// imports nativos
import 'package:flutter/material.dart';

// import das telas
import 'package:meus_animais/app/core/widgets/custom_snack_bar.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import dos domain
import 'package:meus_animais/domain/source/local/injection/injection.dart';
import 'package:meus_animais/domain/usecases/pet_use_case.dart';
import 'package:meus_animais/domain/entities/hygiene.dart';
import 'package:meus_animais/domain/entities/vaccine.dart';
import 'package:meus_animais/domain/entities/pet.dart';

// import dos pacotes
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'edit_pet.g.dart';

class EditPetMobx extends _EditPetMobx with _$EditPetMobx {}

abstract class _EditPetMobx with Store {

  final _currentContext = Session.globalContext.currentContext!;
  final _petUseCase = PetUseCase(getIt());

  @observable
  String petId = DateFormat('yyyyMMddkkmmss').format(DateTime.now());

  @observable
  TextEditingController controllerName = TextEditingController();

  @observable
  bool isLoading = true;

  @observable
  String typePage = "";

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

  @observable
  MaskedTextController controllerDeath = MaskedTextController(mask: "00/00/0000");

  ObservableList<VaccineEntity> listVaccines = ObservableList();

  ObservableList<HygieneEntity> listHygiene = ObservableList();

  @action
  void validateIsEdit( PetEntity? pet ) {

    if ( pet == null ) {
      typePage = "create_pet";
      Session.appEvents.sendScreen(typePage);
      setIsLoading(false);
      return;
    }

    typePage = "edit_pet";
    Session.appEvents.sendScreen(typePage, params: "pet_id => ${pet.id}");

    controllerName.text = pet.name;
    controllerBreed.text = pet.breed;
    controllerWeight = MoneyMaskedTextController(leftSymbol: "KG ", decimalSeparator: ".", precision: 2, initialValue: pet.weight);
    controllerBirth = MaskedTextController(mask: "00/00/0000", text: pet.birth);
    controllerDeath = MaskedTextController(mask: "00/00/0000", text: pet.death);

    setSex(pet.sex);
    setSpecie(pet.specie);

    setIsLoading(false);

  }

  @action
  void setIsLoading( bool value ) => isLoading = value;

  @action
  void setSex( String value ) => sex = value;

  @action
  void setSpecie( String value ) => specie = value;

  @action
  void setVaccine( Iterable<VaccineEntity> vaccines ) => listVaccines.addAll(vaccines);

  @action
  void setHygiene( Iterable<HygieneEntity> hygiene ) => listHygiene.addAll(hygiene);

  @action
  void validateFields( XFile? picture ) {

    setIsLoading(true);
    Session.appEvents.sharedEvent("create_pet_validate_fields");

    String name = controllerName.text.trim();
    String birth = controllerBirth.text.trim();
    String death = controllerDeath.text.trim();
    String breed = controllerBreed.text.trim();
    String weight = controllerWeight.text.trim().replaceAll("KG ", "");
    double weightParse = double.parse(weight);

    int day = int.parse(birth.split("/")[0]);
    int month = int.parse(birth.split("/")[1]);
    int year = int.parse(birth.split("/")[2]);

    if ( name.isEmpty || name.length < 3 ) {
      setIsLoading(false);
      CustomSnackBar(messageKey: "custom_message.set_pet.validate.name");
      return;
    }

    if ( birth.isEmpty || birth.length != 10 ) {
      setIsLoading(false);
      CustomSnackBar(messageKey: "custom_message.set_pet.validate.birth");
      return;
    }

    if ( weight.length > 6 ) {
      setIsLoading(false);
      CustomSnackBar(messageKey: "custom_message.update_pet.validate.weight");
      return;
    }

    if ( weightParse == 0.0 ) {
      setIsLoading(false);
      CustomSnackBar(messageKey: "custom_message.set_pet.validate.weight");
      return;
    }

    if ( day > 31 && month > 12 && year > DateTime.now().year ) {
      setIsLoading(false);
      CustomSnackBar(messageKey: "custom_message.set_pet.validate.day");
      return;
    }

    if ( picture == null || sex.trim().isEmpty || specie.trim().isEmpty || breed.isEmpty ) {
      setIsLoading(false);
      CustomSnackBar(messageKey: "custom_message.set_pet.validate.another");
      return;
    }

    final pet = PetEntity(
      petId,
      Session.user.id,
      name,
      sex,
      specie,
      breed,
      picture.name,
      birth,
      birth,
      death,
      weightParse,
      DateTime.now().toString(),
      "",
    );

    _createPet(pet, picture);
    return;

  }

  @action
  Future<void> _createPet( PetEntity pet, XFile picture ) async {

    Session.appEvents.sharedEvent("create_pet");

    final successOrFailure = await _petUseCase.createPet(pet.toMap(), picture);

    successOrFailure.fold(
      (failure) {
        Session.logs.errorLog(failure.message);
        CustomSnackBar(messageKey: "custom_message.set_pet.error");
        return;
      },
      (success) => _goToHome(pet),
    );

  }

  @action
  void clear() {
    Session.appEvents.sharedEvent("create_pet_close");
    setSex("");
    setSpecie("");
    controllerName.dispose();
    controllerWeight.dispose();
    controllerBirth.dispose();
    controllerDeath.dispose();
    listHygiene.clear();
    listVaccines.clear();
  }

  @action
  void _goToHome( PetEntity pet ) {
    Navigator.pushNamedAndRemoveUntil(_currentContext, "/", (route) => false, arguments: pet);
    return;
  }

  @action
  Future<void> goToVaccines() async {
    Session.appEvents.sharedEvent("create_pet_open_vaccines");

    final params = {
      "pet_id": petId,
      "update": false,
    };

    final response = await Navigator.pushNamed(_currentContext, "/vaccines", arguments: params);

    if ( response != null ) {
      Iterable<VaccineEntity> vaccines = response as Iterable<VaccineEntity>;
      setVaccine( vaccines );
    }

    return;
  }

  @action
  Future<void> goToHygiene() async {
    Session.appEvents.sharedEvent("create_pet_open_hygiene");

    final params = {
      "pet_id": petId,
      "update": false,
    };

    final response = await Navigator.pushNamed(_currentContext, "/hygiene", arguments: params);

    if ( response != null ) {
      Iterable<HygieneEntity> hygiene = response as Iterable<HygieneEntity>;
      setHygiene( hygiene );
    }

    return;
  }

}