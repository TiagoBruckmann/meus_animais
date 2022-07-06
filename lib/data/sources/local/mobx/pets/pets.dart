// import nativos do flutter
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

// import dos sources
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/set_pet.dart';
import 'package:meus_animais/domain/models/hygiene/hygiene_pets.dart';
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/message.dart';

// import dos pacotes
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';
part 'pets.g.dart';

class PetsMobx extends _PetsMobx with _$PetsMobx{}

abstract class _PetsMobx with Store {

  final setPetManager = getIt.get<SetPetManager>();
  // final userManager = getIt.get<GetUserManager>();

  @observable
  TextEditingController controllerName = TextEditingController();

  @observable
  String sex = "";

  @observable
  String specie = "";

  @observable
  String breed = "";

  @observable
  TextEditingController controllerBreed = TextEditingController();

  @observable
  MoneyMaskedTextController controllerWeight = MoneyMaskedTextController(decimalSeparator: ".", precision: 2);

  @observable
  MaskedTextController controllerBirth = MaskedTextController(mask: "00/00/0000");

  ObservableList<ModelVaccines> listVaccines = ObservableList();

  ObservableList<ModelHygienePets> listHygiene = ObservableList();

  @action
  void setSex(String value ) => sex = value;

  @action
  void setSpecie(String value ) => specie = value;

  @action
  void setBreed(String value ) => breed = value;

  @action
  validateFields( File? picture, context ) {

    String? image;
    if ( picture != null ) {
      image = base64Encode(File(picture.toString().replaceAll("File: ", "").replaceAll("'", "")).readAsBytesSync());
    }
    String name = controllerName.text;
    double weight = double.parse(controllerWeight.text);
    String birth = controllerBirth.text;
    int day = int.parse(birth.split("/")[0]);
    int month = int.parse(birth.split("/")[1]);
    int year = int.parse(birth.split("/")[2]);
    print("day => $day");
    print("month => $month");
    print("year => $year");

    if ( name.isNotEmpty && name.trim().length > 2 ) {
      if ( weight != 0.0 ) {
        if ( birth.isNotEmpty && birth.length != 10 ) {
          if ( day <= 31 && month <= 12 && year <= DateTime.now().year ) {
            if ( image != null && sex.trim().isNotEmpty && specie.trim().isNotEmpty && breed.trim().isNotEmpty ) {
              setSex("");
              setSpecie("");
              setBreed("");

              setPetManager.modelPets = ModelPets(
                DateFormat('yyyyMMddkkmmss').format(DateTime.now()),
                "zGLlSDFk0MO4X2dWl8D3FNt2UyU2",
                name,
                sex,
                specie,
                breed,
                image,
                birth,
                weight,
                DateTime.now().toString(),
                null,
              );

              setPetManager.setData();
            } else {
              CustomSnackBar(
                context,
                "Existe campos não preenchidos, por favor preencha-os!",
                Colors.red,
              );
            }
          } else {
            CustomSnackBar(
              context,
              "Informe uma data válida!",
              Colors.red,
            );
          }
        } else {
          CustomSnackBar(
            context,
            "Informe a data de adoção/nascimento do seu amiguinho!",
            Colors.red,
          );
        }
      } else {
        CustomSnackBar(
          context,
          "Informe o peso do seu amiguinho!",
          Colors.red,
        );
      }
    } else {
      CustomSnackBar(
        context,
        "Informe o nome do seu amiguinho!",
        Colors.red,
      );
    }
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
    controllerName.dispose();
    controllerWeight.dispose();
    controllerBirth.dispose();
  }

}