// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditMobx on _EditMobx, Store {
  final _$controllerNameAtom = Atom(name: '_EditMobx.controllerName');

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

  final _$controllerSexAtom = Atom(name: '_EditMobx.controllerSex');

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

  final _$controllerSpecieAtom = Atom(name: '_EditMobx.controllerSpecie');

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

  final _$controllerBreedAtom = Atom(name: '_EditMobx.controllerBreed');

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

  final _$controllerWeightAtom = Atom(name: '_EditMobx.controllerWeight');

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

  final _$controllerBirthAtom = Atom(name: '_EditMobx.controllerBirth');

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

  final _$controllerLifeTimeAtom = Atom(name: '_EditMobx.controllerLifeTime');

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

  final _$setAllDataAsyncAction = AsyncAction('_EditMobx.setAllData');

  @override
  Future setAllData(ModelPets modelPets) {
    return _$setAllDataAsyncAction.run(() => super.setAllData(modelPets));
  }

  final _$validateFieldsAsyncAction = AsyncAction('_EditMobx.validateFields');

  @override
  Future validateFields(dynamic context) {
    return _$validateFieldsAsyncAction.run(() => super.validateFields(context));
  }

  final _$_EditMobxActionController = ActionController(name: '_EditMobx');

  @override
  dynamic setVaccines(dynamic value) {
    final _$actionInfo =
        _$_EditMobxActionController.startAction(name: '_EditMobx.setVaccines');
    try {
      return super.setVaccines(value);
    } finally {
      _$_EditMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHygiene(dynamic value) {
    final _$actionInfo =
        _$_EditMobxActionController.startAction(name: '_EditMobx.setHygiene');
    try {
      return super.setHygiene(value);
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
