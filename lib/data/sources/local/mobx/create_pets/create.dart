// import nativos do flutter
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/get_pets.dart';
import 'package:meus_animais/data/sources/local/manager/get_user.dart';
import 'package:meus_animais/data/sources/local/manager/set_pet.dart';
import 'package:meus_animais/domain/models/hygiene/hygiene_pets.dart';
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/message.dart';

// import dos pacotes
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
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

  @action
  void setSex( String value ) => sex = value;

  @action
  void setSpecie( String value ) => specie = value;

  @action
  validateFields( XFile? picture, context ) async {

    String userId = userManager.modelUser!.id;
    String name = controllerName.text;
    double weight = double.parse(controllerWeight.text);
    String birth = controllerBirth.text;
    String breed = controllerBreed.text;
    int day = int.parse(birth.split("/")[0]);
    int month = int.parse(birth.split("/")[1]);
    int year = int.parse(birth.split("/")[2]);

    if ( name.isEmpty && name.trim().length < 3 ) {
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
    if ( birth.isNotEmpty && birth.length != 10 ) {
      CustomSnackBar(
        context,
        "Informe a data de adoção/nascimento do seu amiguinho!",
        Colors.red,
      );
      return;
    }
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

    firebase_storage.UploadTask uploadTask;
    firebase_storage.Reference archive = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child("documents/pets/$userId/")
        .child(picture!.name);

    final metadata = firebase_storage.SettableMetadata(
      contentType: '${picture.mimeType}',
      customMetadata: {'picked-file-path': picture.path},
    );

    uploadTask = archive.putData(await picture.readAsBytes(), metadata);

    uploadTask.snapshotEvents.listen((event) async {
      event.ref.getDownloadURL().then((value) async {

        setPetManager.context = context;
        setPetManager.modelPets = ModelPets(
          DateFormat('yyyyMMddkkmmss').format(DateTime.now()),
          userId,
          name,
          sex,
          specie,
          breed,
          value,
          birth,
          birth,
          weight,
          DateTime.now().toString(),
          null,
        );

        await setPetManager.setData();

        getPets.listPets.add(setPetManager.modelPets!);

      });
    });
  }

  @action
  void setVaccine( ModelVaccines modelVaccines ) {
    listVaccines.add(modelVaccines);
  }

  @action
  void setHygiene( ModelHygienePets modelHygienePets ) {
    listHygiene.add(modelHygienePets);
  }

  @action
  void clear() {
    setSex("");
    setSpecie("");
    controllerName.dispose();
    controllerWeight.dispose();
    controllerBirth.dispose();
  }

}