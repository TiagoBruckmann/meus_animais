// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateMobx on _CreateMobx, Store {
  late final _$controllerNameAtom =
      Atom(name: '_CreateMobx.controllerName', context: context);

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

  late final _$sexAtom = Atom(name: '_CreateMobx.sex', context: context);

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

  late final _$specieAtom = Atom(name: '_CreateMobx.specie', context: context);

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
      Atom(name: '_CreateMobx.controllerBreed', context: context);

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
      Atom(name: '_CreateMobx.controllerWeight', context: context);

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
      Atom(name: '_CreateMobx.controllerBirth', context: context);

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

  late final _$clickedAtom =
      Atom(name: '_CreateMobx.clicked', context: context);

  @override
  bool get clicked {
    _$clickedAtom.reportRead();
    return super.clicked;
  }

  @override
  set clicked(bool value) {
    _$clickedAtom.reportWrite(value, super.clicked, () {
      super.clicked = value;
    });
  }

  late final _$validateFieldsAsyncAction =
      AsyncAction('_CreateMobx.validateFields', context: context);

  @override
  Future validateFields(XFile? picture, dynamic context) {
    return _$validateFieldsAsyncAction
        .run(() => super.validateFields(picture, context));
  }

  late final _$_CreateMobxActionController =
      ActionController(name: '_CreateMobx', context: context);

  @override
  void setSex(String value) {
    final _$actionInfo =
        _$_CreateMobxActionController.startAction(name: '_CreateMobx.setSex');
    try {
      return super.setSex(value);
    } finally {
      _$_CreateMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpecie(String value) {
    final _$actionInfo = _$_CreateMobxActionController.startAction(
        name: '_CreateMobx.setSpecie');
    try {
      return super.setSpecie(value);
    } finally {
      _$_CreateMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setClicked(bool value) {
    final _$actionInfo = _$_CreateMobxActionController.startAction(
        name: '_CreateMobx.setClicked');
    try {
      return super.setClicked(value);
    } finally {
      _$_CreateMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVaccine(dynamic value) {
    final _$actionInfo = _$_CreateMobxActionController.startAction(
        name: '_CreateMobx.setVaccine');
    try {
      return super.setVaccine(value);
    } finally {
      _$_CreateMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHygiene(dynamic value) {
    final _$actionInfo = _$_CreateMobxActionController.startAction(
        name: '_CreateMobx.setHygiene');
    try {
      return super.setHygiene(value);
    } finally {
      _$_CreateMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo =
        _$_CreateMobxActionController.startAction(name: '_CreateMobx.clear');
    try {
      return super.clear();
    } finally {
      _$_CreateMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controllerName: ${controllerName},
sex: ${sex},
specie: ${specie},
controllerBreed: ${controllerBreed},
controllerWeight: ${controllerWeight},
controllerBirth: ${controllerBirth},
clicked: ${clicked}
    ''';
  }
}
