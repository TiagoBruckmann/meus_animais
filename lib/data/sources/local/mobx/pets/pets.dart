// imports nativos do flutter
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/get_user.dart';
import 'package:meus_animais/data/sources/local/manager/login.dart';
import 'package:meus_animais/data/sources/local/manager/set_pet.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';
import 'package:meus_animais/domain/models/users/login.dart';
import 'package:meus_animais/ui/pages/widgets/message.dart';

// import dos pacotes
import 'package:mobx/mobx.dart';
part 'pets.g.dart';

class PetsMobx extends _PetsMobx with _$PetsMobx{}

abstract class _PetsMobx with Store {

  final setPetManager = getIt.get<SetPetManager>();
  final userManager = getIt.get<GetUserManager>();

  @observable
  String picture = "";

  @observable
  TextEditingController controllerName = TextEditingController();

  @observable
  String sex = "";

  @observable
  String specie = "";

  @observable
  String breed = "";

  @observable
  TextEditingController controllerWeight = TextEditingController();

  @observable
  TextEditingController controllerBirth = TextEditingController();

  @action
  void setSex(String value ) => sex = value;

  @action
  void setSpecie(String value ) => specie = value;

  @action
  void setBreed(String value ) => breed = value;

  @action
  validateFields( context ) {

    String name = controllerName.text;
    double weight = double.parse(controllerWeight.text);
    String birth = controllerBirth.text;

    if ( name.isNotEmpty && name.trim().length > 2 ) {
      if ( weight != 0.0 ) {
        if ( birth.isNotEmpty && birth.length != 10 ) {
          if ( picture.trim().isNotEmpty && sex.trim().isNotEmpty && specie.trim().isNotEmpty && breed.trim().isNotEmpty ) {
            setSex("");
            setSpecie("");
            setBreed("");

            setPetManager.modelPets = ModelPets(
                DateFormat('yyyyMMddkkmmss').format(DateTime.now()),
                userManager.modelUser!.id,
                name,
                sex,
                specie,
                breed,
                picture,
                birth,
                weight,
                DateTime.now().toString(),
                null
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
  void clear() {
    controllerName.dispose();
    controllerWeight.dispose();
    controllerBirth.dispose();
  }

}