// import nativos do flutter
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/data/sources/local/manager/life_time.dart';
import 'package:meus_animais/data/sources/remote/services/events.dart';
import 'package:meus_animais/domain/models/hygiene/hygiene_pets.dart';
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/message.dart';

// gerencia de estado
import 'package:meus_animais/data/sources/local/manager/get_hygiene_pets.dart';
import 'package:meus_animais/data/sources/local/manager/get_vaccines.dart';

// import dos pacotes
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:mobx/mobx.dart';
part 'edit.g.dart';

class EditMobx extends _EditMobx with _$EditMobx{}

abstract class _EditMobx with Store {

  final lifeTimeManager = getIt.get<LifeTimeManager>();
  final _getVaccineManager = getIt.get<GetVaccinesManager>();
  final _getHygienePetManager = getIt.get<GetHygienePetsManager>();

  @observable
  TextEditingController controllerName = TextEditingController();

  @observable
  TextEditingController controllerSex = TextEditingController();

  @observable
  TextEditingController controllerSpecie = TextEditingController();

  @observable
  TextEditingController controllerBreed = TextEditingController();

  @observable
  MoneyMaskedTextController controllerWeight = MoneyMaskedTextController(leftSymbol: "KG ", decimalSeparator: ".", precision: 2);

  @observable
  TextEditingController controllerBirth = TextEditingController();

  @observable
  bool willPopUp = true;

  @observable
  TextEditingController controllerLifeTime = TextEditingController();

  ObservableList<ModelVaccines> listVaccines = ObservableList();

  ObservableList<ModelHygienePets> listHygiene = ObservableList();

  @action
  changeWillPopUp( bool value ) {
    EventsApp().sharedEvent("edit_pet_change_will_pop_up");
    willPopUp = value;
  }

  @action
  setAllData( ModelPets modelPets ) async {

    _getVaccineManager.petId = modelPets.id;
    _getHygienePetManager.petId = modelPets.id;

    Iterable<ModelVaccines> vaccines = await _getVaccineManager.getVaccines();
    setVaccines(vaccines);
    Iterable<ModelHygienePets> hygiene = await _getHygienePetManager.getHygiene();
    setHygiene(hygiene);

    controllerName.text = modelPets.name;
    controllerSex.text = modelPets.sex;
    controllerSpecie.text = modelPets.specie;
    controllerBreed.text = modelPets.breed;
    controllerWeight = MoneyMaskedTextController(leftSymbol: "KG ", decimalSeparator: ".", precision: 2, initialValue: modelPets.weight );
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
  validateFields( ModelPets modelPets, XFile? picture, context ) async {

    EventsApp().sharedEvent("edit_pet_validate_update");
    String removedKg = controllerWeight.text.replaceAll("KG ", "");
    if ( removedKg.length > 6 ) {
      changeWillPopUp( true );
      return CustomSnackBar(
        context,
        FlutterI18n.translate(context, "custom_message.update_pet.validate.weight"),
        Colors.red,
      );
    }
    double weight = double.parse(removedKg);
    
    if ( weight == 0.0 ) {
      changeWillPopUp( true );
      return CustomSnackBar(
        context,
        FlutterI18n.translate(context, "custom_message.update_pet.validate.weight"),
        Colors.red,
      );
    }

    modelPets.weight = weight;
    if ( picture != null ) {
      modelPets.picture = picture.name;
    }
    EventsApp().sharedEvent("edit_pet_upload_picture");
    await Services().uploadPicture(modelPets, picture, context);

  }

  @action
  setVaccines( Iterable<ModelVaccines> modelVaccines ) => listVaccines.addAll(modelVaccines);

  @action
  setHygiene( Iterable<ModelHygienePets> modelHygienePets ) => listHygiene.addAll(modelHygienePets);


}