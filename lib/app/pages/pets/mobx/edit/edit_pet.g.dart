// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_pet.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditPetMobx on _EditPetMobx, Store {
  late final _$petIdAtom = Atom(name: '_EditPetMobx.petId', context: context);

  @override
  String get petId {
    _$petIdAtom.reportRead();
    return super.petId;
  }

  @override
  set petId(String value) {
    _$petIdAtom.reportWrite(value, super.petId, () {
      super.petId = value;
    });
  }

  late final _$controllerNameAtom =
      Atom(name: '_EditPetMobx.controllerName', context: context);

  @override
  TextEditingController get controllerName {
    _$controllerNameAtom.reportRead();
    return super.controllerName;
  }

  @override
  set controllerName(TextEditingController value) {
    _$controllerNameAtom.reportWrite(value, super.controllerName, () {
      super.controllerName = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_EditPetMobx.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$typePageAtom =
      Atom(name: '_EditPetMobx.typePage', context: context);

  @override
  String get typePage {
    _$typePageAtom.reportRead();
    return super.typePage;
  }

  @override
  set typePage(String value) {
    _$typePageAtom.reportWrite(value, super.typePage, () {
      super.typePage = value;
    });
  }

  late final _$sexAtom = Atom(name: '_EditPetMobx.sex', context: context);

  @override
  String get sex {
    _$sexAtom.reportRead();
    return super.sex;
  }

  @override
  set sex(String value) {
    _$sexAtom.reportWrite(value, super.sex, () {
      super.sex = value;
    });
  }

  late final _$specieAtom = Atom(name: '_EditPetMobx.specie', context: context);

  @override
  String get specie {
    _$specieAtom.reportRead();
    return super.specie;
  }

  @override
  set specie(String value) {
    _$specieAtom.reportWrite(value, super.specie, () {
      super.specie = value;
    });
  }

  late final _$controllerBreedAtom =
      Atom(name: '_EditPetMobx.controllerBreed', context: context);

  @override
  TextEditingController get controllerBreed {
    _$controllerBreedAtom.reportRead();
    return super.controllerBreed;
  }

  @override
  set controllerBreed(TextEditingController value) {
    _$controllerBreedAtom.reportWrite(value, super.controllerBreed, () {
      super.controllerBreed = value;
    });
  }

  late final _$controllerWeightAtom =
      Atom(name: '_EditPetMobx.controllerWeight', context: context);

  @override
  MoneyMaskedTextController get controllerWeight {
    _$controllerWeightAtom.reportRead();
    return super.controllerWeight;
  }

  @override
  set controllerWeight(MoneyMaskedTextController value) {
    _$controllerWeightAtom.reportWrite(value, super.controllerWeight, () {
      super.controllerWeight = value;
    });
  }

  late final _$controllerBirthAtom =
      Atom(name: '_EditPetMobx.controllerBirth', context: context);

  @override
  MaskedTextController get controllerBirth {
    _$controllerBirthAtom.reportRead();
    return super.controllerBirth;
  }

  @override
  set controllerBirth(MaskedTextController value) {
    _$controllerBirthAtom.reportWrite(value, super.controllerBirth, () {
      super.controllerBirth = value;
    });
  }

  late final _$controllerDeathAtom =
      Atom(name: '_EditPetMobx.controllerDeath', context: context);

  @override
  MaskedTextController get controllerDeath {
    _$controllerDeathAtom.reportRead();
    return super.controllerDeath;
  }

  @override
  set controllerDeath(MaskedTextController value) {
    _$controllerDeathAtom.reportWrite(value, super.controllerDeath, () {
      super.controllerDeath = value;
    });
  }

  late final _$_createPetAsyncAction =
      AsyncAction('_EditPetMobx._createPet', context: context);

  @override
  Future<void> _createPet(PetEntity pet, XFile picture) {
    return _$_createPetAsyncAction.run(() => super._createPet(pet, picture));
  }

  late final _$goToVaccinesAsyncAction =
      AsyncAction('_EditPetMobx.goToVaccines', context: context);

  @override
  Future<void> goToVaccines() {
    return _$goToVaccinesAsyncAction.run(() => super.goToVaccines());
  }

  late final _$goToHygieneAsyncAction =
      AsyncAction('_EditPetMobx.goToHygiene', context: context);

  @override
  Future<void> goToHygiene() {
    return _$goToHygieneAsyncAction.run(() => super.goToHygiene());
  }

  late final _$_EditPetMobxActionController =
      ActionController(name: '_EditPetMobx', context: context);

  @override
  void validateIsEdit(PetEntity? pet) {
    final _$actionInfo = _$_EditPetMobxActionController.startAction(
        name: '_EditPetMobx.validateIsEdit');
    try {
      return super.validateIsEdit(pet);
    } finally {
      _$_EditPetMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_EditPetMobxActionController.startAction(
        name: '_EditPetMobx.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_EditPetMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSex(String value) {
    final _$actionInfo =
        _$_EditPetMobxActionController.startAction(name: '_EditPetMobx.setSex');
    try {
      return super.setSex(value);
    } finally {
      _$_EditPetMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpecie(String value) {
    final _$actionInfo = _$_EditPetMobxActionController.startAction(
        name: '_EditPetMobx.setSpecie');
    try {
      return super.setSpecie(value);
    } finally {
      _$_EditPetMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVaccine(Iterable<VaccineEntity> vaccines) {
    final _$actionInfo = _$_EditPetMobxActionController.startAction(
        name: '_EditPetMobx.setVaccine');
    try {
      return super.setVaccine(vaccines);
    } finally {
      _$_EditPetMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHygiene(Iterable<HygieneEntity> hygiene) {
    final _$actionInfo = _$_EditPetMobxActionController.startAction(
        name: '_EditPetMobx.setHygiene');
    try {
      return super.setHygiene(hygiene);
    } finally {
      _$_EditPetMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateFields(XFile? picture) {
    final _$actionInfo = _$_EditPetMobxActionController.startAction(
        name: '_EditPetMobx.validateFields');
    try {
      return super.validateFields(picture);
    } finally {
      _$_EditPetMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo =
        _$_EditPetMobxActionController.startAction(name: '_EditPetMobx.clear');
    try {
      return super.clear();
    } finally {
      _$_EditPetMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _goToHome(PetEntity pet) {
    final _$actionInfo = _$_EditPetMobxActionController.startAction(
        name: '_EditPetMobx._goToHome');
    try {
      return super._goToHome(pet);
    } finally {
      _$_EditPetMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
petId: ${petId},
controllerName: ${controllerName},
isLoading: ${isLoading},
typePage: ${typePage},
sex: ${sex},
specie: ${specie},
controllerBreed: ${controllerBreed},
controllerWeight: ${controllerWeight},
controllerBirth: ${controllerBirth},
controllerDeath: ${controllerDeath}
    ''';
  }
}
