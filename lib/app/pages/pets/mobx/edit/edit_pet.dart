// imports nativos
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import das telas
import 'package:meus_animais/app/core/widgets/custom_snack_bar.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import dos domain
import 'package:meus_animais/domain/source/local/injection/injection.dart';
import 'package:meus_animais/domain/source/local/mobx/pet/pet.dart';
import 'package:meus_animais/domain/usecases/pet_use_case.dart';
import 'package:meus_animais/domain/entities/life_time.dart';
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
  PetEntity? petDetail;

  @observable
  bool isLoading = true;

  @observable
  bool isUpdate = true;

  @observable
  String typePage = "";

  @observable
  String sex = "";

  @observable
  String specie = "";

  @observable
  TextEditingController controllerBreed = TextEditingController();

  @observable
  TextEditingController controllerSex = TextEditingController();

  @observable
  TextEditingController controllerSpecie = TextEditingController();

  @observable
  MoneyMaskedTextController controllerWeight = MoneyMaskedTextController(leftSymbol: "KG ", thousandSeparator: ".", decimalSeparator: ",", precision: 2);

  @observable
  MaskedTextController controllerBirth = MaskedTextController(mask: "00/00/0000");

  @observable
  String lifeTime = "";

  @observable
  MaskedTextController controllerDeath = MaskedTextController(mask: "00/00/0000");

  ObservableList<LifeTimeEntity> listSpecies = ObservableList();

  ObservableList<VaccineEntity> listVaccines = ObservableList();

  ObservableList<HygieneEntity> listHygiene = ObservableList();

  @action
  Future<void> validateIsEdit( PetEntity? pet, List<LifeTimeEntity> lifeTimeList ) async {

    _getSpecies();

    if ( pet == null ) {
      isUpdate = false;
      typePage = "create_pet";
      Session.appEvents.sendScreen(typePage);
      setIsLoading(false);
      return;
    }

    typePage = "edit_pet";
    Session.appEvents.sendScreen(typePage, params: "pet_id => ${pet.id}");

    controllerName.text = pet.name;
    controllerBreed.text = pet.breed;
    controllerWeight = MoneyMaskedTextController(leftSymbol: "KG ", thousandSeparator: ".", decimalSeparator: ",", precision: 2, initialValue: pet.weight);
    controllerDeath = MaskedTextController(mask: "00/00/0000", text: pet.death);

    controllerSex.text = pet.sex;
    controllerSpecie.text = pet.specie;

    setSex(pet.sex);
    setSpecie(pet.specie);

    final response = lifeTimeList.firstWhere(( value ) => value.name.contains( pet.specie ), orElse: () => const LifeTimeEntity("", "", "Falha ao buscar a especie"));
    lifeTime = response.time;

    await _getVaccines( pet.id );
    await _getHygiene( pet.id );
    petDetail = pet;

    setIsLoading(false);

  }

  @action
  Future<void> _getVaccines( String petId ) async {

    final successOrFailure = await _petUseCase.getVaccines(petId);

    successOrFailure.fold(
      (failure) => Session.logs.errorLog(failure.message),
      (success) => _setListVaccines(success),
    );

  }

  @action
  Future<void> _getHygiene( String petId ) async {

    final successOrFailure = await _petUseCase.getHygienePets(petId);

    successOrFailure.fold(
      (failure) => Session.logs.errorLog(failure.message),
      (success) => _setListHygiene(success),
    );

  }

  @action
  Future<void> _getSpecies() async {

    final successOrFailure = await _petUseCase.getLifeTimePets();

    successOrFailure.fold(
      (failure) {
        Session.logs.errorLog(failure.message);
        CustomSnackBar(messageKey: "pages.pets.error_life_time");
        return;
      },
      (success) => _setListSpecies(success),
    );

  }

  @action
  void _setListVaccines( Iterable<VaccineEntity> value ) => listVaccines.addAll(value);

  @action
  void _setListHygiene( Iterable<HygieneEntity> value ) => listHygiene.addAll(value);

  @action
  void _setListSpecies( Iterable<LifeTimeEntity> value ) => listSpecies.addAll(value);

  @action
  void setIsLoading( bool value ) => isLoading = value;

  @action
  void setSex( String value ) => sex = value;

  @action
  void setSpecie( String value ) => specie = value;

  @action
  Future<void> validateFields( Uint8List? picture, PetMobx petMobx ) async {

    setIsLoading(true);
    Session.appEvents.sharedEvent("create_pet_validate_fields");

    String weight = controllerWeight.text.trim().replaceAll("KG ", "").replaceAll(".", "").replaceAll(",", ".");
    double weightParse = double.parse(weight);
    String death = controllerDeath.text.trim();

    if ( weight.length > 7 ) {
      setIsLoading(false);
      CustomSnackBar(messageKey: "custom_message.update_pet.validate.weight");
      return;
    }

    if ( weightParse == 0.0 ) {
      setIsLoading(false);
      CustomSnackBar(messageKey: "custom_message.set_pet.validate.weight");
      return;
    }

    if ( isUpdate && petDetail != null ) {

      String imageName = petDetail!.picture;
      if ( picture != null ) {
        final file = XFile.fromData(picture);
        imageName = file.name;
      }

      final pet = PetEntity(
        petDetail!.id,
        petDetail!.userId,
        petDetail!.name,
        sex,
        specie,
        petDetail!.breed,
        imageName,
        petDetail!.birth,
        petDetail!.birth,
        death,
        weightParse,
        petDetail!.createdAt,
        DateTime.now().toString(),
      );

      if ( picture == null ) {
        await _updatePet(pet, null, petMobx);
      } else {
        final file = XFile.fromData(picture);
        await _updatePet(pet, file, petMobx);
      }

      return;

    }

    String name = controllerName.text.trim();
    String birth = controllerBirth.text.trim();
    String breed = controllerBreed.text.trim();

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

    final file = XFile.fromData(picture);

    final pet = PetEntity(
      petId,
      Session.user.id,
      name,
      sex,
      specie,
      breed,
      file.name,
      birth,
      birth,
      death,
      weightParse,
      DateTime.now().toString(),
      "",
    );

    return await _createPet(pet, file);

  }

  @action
  Future<void> _createPet( PetEntity pet, XFile picture ) async {

    Session.appEvents.sharedEvent("create_pet");

    List<Map<String, dynamic>> vaccines = [];
    for ( final item in listVaccines ) {
      vaccines.add(
        item.toMap( pet.id ),
      );
    }

    List<Map<String, dynamic>> hygiene = [];
    for ( final item in listHygiene ) {
      hygiene.add(
        item.toMap( pet.id ),
      );
    }

    Map<String, dynamic> params = {
      "pet": pet.toMap(),
      "vaccine": vaccines,
      "hygiene": hygiene,
    };

    final successOrFailure = await _petUseCase.createPet(params, picture);

    successOrFailure.fold(
      (failure) {
        Session.logs.errorLog(failure.message);
        CustomSnackBar(messageKey: "custom_message.set_pet.error");
        return;
      },
      (success) => _goToHome(),
    );

  }

  @action
  Future<void> _updatePet( PetEntity pet, XFile? picture, PetMobx petMobx ) async {

    final successOrFailure = await _petUseCase.updatePet(pet.toMap(), picture);

    successOrFailure.fold(
      (failure) {
        Session.logs.errorLog(failure.message);
        CustomSnackBar(messageKey: "custom_message.update_pet.error");
        return;
      },
      (success) async {
        await Future.delayed(const Duration(seconds: 3));
        await petMobx.refresh();
        _goToHome();
      },
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
    controllerSex.dispose();
    controllerSpecie.dispose();
    listVaccines.clear();
    listHygiene.clear();
  }

  @action
  void _goToHome() {
    Navigator.pushNamedAndRemoveUntil(_currentContext, "/", (route) => false);
    return;
  }

  @action
  Future<void> goToVaccines() async {
    Session.appEvents.sharedEvent("create_pet_open_vaccines");

    final params = {
      "pet_id": petDetail?.id ?? petId,
      "is_update": isUpdate,
    };

    final response = await Navigator.pushNamed(_currentContext, "/vaccine", arguments: params);

    if ( response != null ) {
      Iterable<VaccineEntity> vaccines = response as Iterable<VaccineEntity>;
      _setListVaccines( vaccines );
    }

    return;
  }

  @action
  Future<void> goToHygiene() async {
    Session.appEvents.sharedEvent("create_pet_open_hygiene");

    final params = {
      "pet_id": petDetail?.id ?? petId,
      "is_update": isUpdate,
    };

    final response = await Navigator.pushNamed(_currentContext, "/hygiene", arguments: params);

    if ( response != null ) {
      Iterable<HygieneEntity> hygiene = response as Iterable<HygieneEntity>;
      _setListHygiene( hygiene );
    }

    return;
  }

}