// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditMobx on _EditMobx, Store {
  late final _$controllerNameAtom =
      Atom(name: '_EditMobx.controllerName', context: context);

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

  late final _$controllerSexAtom =
      Atom(name: '_EditMobx.controllerSex', context: context);

  @override
  TextEditingController get controllerSex {
    _$controllerSexAtom.reportRead();
    return super.controllerSex;
  }

  @override
  set controllerSex(TextEditingController value) {
    _$controllerSexAtom.reportWrite(value, super.controllerSex, () {
      super.controllerSex = value;
    });
  }

  late final _$controllerSpecieAtom =
      Atom(name: '_EditMobx.controllerSpecie', context: context);

  @override
  TextEditingController get controllerSpecie {
    _$controllerSpecieAtom.reportRead();
    return super.controllerSpecie;
  }

  @override
  set controllerSpecie(TextEditingController value) {
    _$controllerSpecieAtom.reportWrite(value, super.controllerSpecie, () {
      super.controllerSpecie = value;
    });
  }

  late final _$controllerBreedAtom =
      Atom(name: '_EditMobx.controllerBreed', context: context);

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
      Atom(name: '_EditMobx.controllerWeight', context: context);

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
      Atom(name: '_EditMobx.controllerBirth', context: context);

  @override
  TextEditingController get controllerBirth {
    _$controllerBirthAtom.reportRead();
    return super.controllerBirth;
  }

  @override
  set controllerBirth(TextEditingController value) {
    _$controllerBirthAtom.reportWrite(value, super.controllerBirth, () {
      super.controllerBirth = value;
    });
  }

  late final _$controllerLifeTimeAtom =
      Atom(name: '_EditMobx.controllerLifeTime', context: context);

  @override
  TextEditingController get controllerLifeTime {
    _$controllerLifeTimeAtom.reportRead();
    return super.controllerLifeTime;
  }

  @override
  set controllerLifeTime(TextEditingController value) {
    _$controllerLifeTimeAtom.reportWrite(value, super.controllerLifeTime, () {
      super.controllerLifeTime = value;
    });
  }

  late final _$setAllDataAsyncAction =
      AsyncAction('_EditMobx.setAllData', context: context);

  @override
  Future setAllData(ModelPets modelPets) {
    return _$setAllDataAsyncAction.run(() => super.setAllData(modelPets));
  }

  late final _$validateFieldsAsyncAction =
      AsyncAction('_EditMobx.validateFields', context: context);

  @override
  Future validateFields(ModelPets modelPets, XFile? picture, dynamic context) {
    return _$validateFieldsAsyncAction
        .run(() => super.validateFields(modelPets, picture, context));
  }

  late final _$_EditMobxActionController =
      ActionController(name: '_EditMobx', context: context);

  @override
  dynamic setVaccines(Iterable<ModelVaccines> modelVaccines) {
    final _$actionInfo =
        _$_EditMobxActionController.startAction(name: '_EditMobx.setVaccines');
    try {
      return super.setVaccines(modelVaccines);
    } finally {
      _$_EditMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHygiene(Iterable<ModelHygienePets> modelHygienePets) {
    final _$actionInfo =
        _$_EditMobxActionController.startAction(name: '_EditMobx.setHygiene');
    try {
      return super.setHygiene(modelHygienePets);
    } finally {
      _$_EditMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo =
        _$_EditMobxActionController.startAction(name: '_EditMobx.clear');
    try {
      return super.clear();
    } finally {
      _$_EditMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controllerName: ${controllerName},
controllerSex: ${controllerSex},
controllerSpecie: ${controllerSpecie},
controllerBreed: ${controllerBreed},
controllerWeight: ${controllerWeight},
controllerBirth: ${controllerBirth},
controllerLifeTime: ${controllerLifeTime}
    ''';
  }
}
