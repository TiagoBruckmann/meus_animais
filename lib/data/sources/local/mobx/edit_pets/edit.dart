// import nativos do flutter
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/life_time.dart';
import 'package:meus_animais/data/sources/local/manager/get_user.dart';
import 'package:meus_animais/data/sources/local/manager/set_pet.dart';
import 'package:meus_animais/domain/models/hygiene/hygiene_pets.dart';
import 'package:meus_animais/domain/models/life_time/life_time.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';

// import dos pacotes
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:mobx/mobx.dart';
part 'edit.g.dart';

class EditMobx extends _EditMobx with _$EditMobx{}

abstract class _EditMobx with Store {

  final lifeTimeManager = getIt.get<LifeTimeManager>();
  final setPetManager = getIt.get<SetPetManager>();
  final userManager = getIt.get<GetUserManager>();

  @observable
  TextEditingController controllerName = TextEditingController();

  @observable
  TextEditingController controllerSex = TextEditingController();

  @observable
  TextEditingController controllerSpecie = TextEditingController();

  @observable
  TextEditingController controllerBreed = TextEditingController();

  @observable
  MoneyMaskedTextController controllerWeight = MoneyMaskedTextController(decimalSeparator: ".", precision: 2);

  @observable
  TextEditingController controllerBirth = TextEditingController();

  @observable
  TextEditingController controllerLifeTime = TextEditingController();

  ObservableList<ModelVaccines> listVaccines = ObservableList();

  ObservableList<ModelHygienePets> listHygiene = ObservableList();

  @action
  setAllData( ModelPets modelPets ) async {

    controllerName.text = modelPets.name;
    controllerSex.text = modelPets.sex;
    controllerSpecie.text = modelPets.specie;
    controllerBreed.text = modelPets.breed;
    controllerWeight.text = modelPets.weight.toString();
    controllerBirth.text = modelPets.birth;

    await lifeTimeManager.getData();

    for ( var item in lifeTimeManager.list ) {
      if ( item.name == modelPets.specie ) {
        controllerLifeTime.text = item.time;
        return;
      }
    }

  }

  @action
  validateFields( context ) async {

    String userId = userManager.modelUser!.id;

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