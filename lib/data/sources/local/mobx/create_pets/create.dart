// import nativos do flutter
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/get_pets.dart';
import 'package:meus_animais/data/sources/local/manager/get_user.dart';
import 'package:meus_animais/data/sources/local/manager/set_pet.dart';
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/domain/models/hygiene/hygiene_pets.dart';
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/message.dart';

// import dos pacotes
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';
part 'create.g.dart';

class CreateMobx extends _CreateMobx with _$CreateMobx{}

abstract class _CreateMobx with Store {

  final setPetManager = getIt.get<SetPetManager>();
  final userManager = getIt.get<GetUserManager>();
  final getPets = getIt.get<GetPetsManager>();

  @observable
  TextEditingController controllerName = TextEditingController();

  @observable
  String sex = "";

  @observable
  String specie = "";

  @observable
  TextEditingController controllerBreed = TextEditingController();

  @observable
  MoneyMaskedTextController controllerWeight = MoneyMaskedTextController(decimalSeparator: ".", precision: 2);

  @observable
  MaskedTextController controllerBirth = MaskedTextController(mask: "00/00/0000");

  ObservableList<ModelVaccines> listVaccines = ObservableList();

  ObservableList<ModelHygienePets> listHygiene = ObservableList();

  @observable
  bool clicked = false;

  @action
  void setSex( String value ) => sex = value;

  @action
  void setSpecie( String value ) => specie = value;

  @action
  void setClicked( bool value ) => clicked = value;

  @action
  validateFields( XFile? picture, context ) async {

    analytics.logEvent(name: "validate_pet");
    String userId = userManager.modelUser!.id;
    String name = controllerName.text;
    double weight = double.parse(controllerWeight.text);
    String birth = controllerBirth.text;
    String breed = controllerBreed.text;

    if ( name.trim().isEmpty && name.trim().length < 3 ) {
      CustomSnackBar(
        context,
        "Informe o nome do seu amiguinho!",
        Colors.red,
      );
      return;
    }
    if ( weight == 0.0 ) {
      CustomSnackBar(
        context,
        "Informe o peso do seu amiguinho!",
        Colors.red,
      );
      return;
    }
    if ( birth.trim().isEmpty || birth.length != 10 ) {
      CustomSnackBar(
        context,
        "Informe a data de adoção/nascimento do seu amiguinho!",
        Colors.red,
      );
      return;
    }

    int day = int.parse(birth.split("/")[0]);
    int month = int.parse(birth.split("/")[1]);
    int year = int.parse(birth.split("/")[2]);
    if ( day > 31 && month > 12 && year > DateTime.now().year ) {
      CustomSnackBar(
        context,
        "Informe uma data válida!",
        Colors.red,
      );
      return;
    }
    if ( picture == null && sex.trim().isEmpty && specie.trim().isEmpty && breed.trim().isEmpty ) {
      CustomSnackBar(
        context,
        "Existe campos não preenchidos, por favor preencha-os!",
        Colors.red,
      );
      return;
    }

    setClicked( true );

    setPetManager.picture = picture;
    setPetManager.context = context;
    setPetManager.modelPets = ModelPets(
      DateFormat('yyyyMMddkkmmss').format(DateTime.now()),
      userId,
      name,
      sex,
      specie,
      breed,
      picture!.name,
      birth,
      birth,
      weight,
      DateTime.now().toString(),
      null,
    );

    await setPetManager.setData();

    getPets.listPets.add(setPetManager.modelPets!);

  }

  @action
  void setVaccine( value ) => listVaccines.addAll(value);

  @action
  void setHygiene( value ) => listHygiene.addAll(value);

  @action
  void clear() {
    setSex("");
    setSpecie("");
    controllerName.dispose();
    controllerWeight.dispose();
    controllerBirth.dispose();
  }

}