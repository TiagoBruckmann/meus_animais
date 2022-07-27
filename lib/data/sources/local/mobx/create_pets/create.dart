// import nativos do flutter
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/data/sources/local/manager/get_pets.dart';
import 'package:meus_animais/data/sources/local/manager/get_user.dart';
import 'package:meus_animais/data/sources/local/manager/set_pet.dart';
import 'package:meus_animais/domain/models/hygiene/hygiene_pets.dart';
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/message.dart';

// import dos pacotes
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:mobx/mobx.dart';
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
  MoneyMaskedTextController controllerWeight = MoneyMaskedTextController(leftSymbol: "KG ", decimalSeparator: ".", precision: 2);

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
  validateFields( String petId, XFile? picture, context ) async {

    analytics.logEvent(name: "validate_pet");
    String userId = userManager.modelUser!.id;
    String name = controllerName.text;
    double weight = double.parse(controllerWeight.text.replaceAll("KG ", ""));
    String birth = controllerBirth.text;
    String breed = controllerBreed.text;

    if ( name.trim().isEmpty && name.trim().length < 3 ) {
      return CustomSnackBar(
        context,
        FlutterI18n.translate(context, "custom_message.set_pet.validate.name"),
        Colors.red,
      );
    }
    if ( weight == 0.0 ) {
      return CustomSnackBar(
        context,
        FlutterI18n.translate(context, "custom_message.set_pet.validate.weight"),
        Colors.red,
      );
    }
    if ( birth.trim().isEmpty || birth.length != 10 ) {
      return CustomSnackBar(
        context,
        FlutterI18n.translate(context, "custom_message.set_pet.validate.birth"),
        Colors.red,
      );
    }

    int day = int.parse(birth.split("/")[0]);
    int month = int.parse(birth.split("/")[1]);
    int year = int.parse(birth.split("/")[2]);
    if ( day > 31 && month > 12 && year > DateTime.now().year ) {
      return CustomSnackBar(
        context,
        FlutterI18n.translate(context, "custom_message.set_pet.validate.day"),
        Colors.red,
      );
    }
    if ( picture == null && sex.trim().isEmpty && specie.trim().isEmpty && breed.trim().isEmpty ) {
      return CustomSnackBar(
        context,
        FlutterI18n.translate(context, "custom_message.set_pet.validate.another"),
        Colors.red,
      );
    }

    setClicked( true );

    setPetManager.picture = picture;
    setPetManager.context = context;
    setPetManager.modelPets = ModelPets(
      petId,
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
  void setVaccine( ModelVaccines modelVaccines ) => listVaccines.add(modelVaccines);

  @action
  void setHygiene( ModelHygienePets modelHygienePets ) => listHygiene.add(modelHygienePets);

  @action
  void clear() {
    setSex("");
    setSpecie("");
    controllerName.dispose();
    controllerWeight.dispose();
    controllerBirth.dispose();
    listHygiene.clear();
    listVaccines.clear();
  }

}