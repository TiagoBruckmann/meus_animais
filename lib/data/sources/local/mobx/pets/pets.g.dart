// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pets.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PetsMobx on _PetsMobx, Store {
  late final _$pictureAtom = Atom(name: '_PetsMobx.picture', context: context);

  @override
  String get picture {
    _$pictureAtom.reportRead();
    return super.picture;
  }

  @override
  set picture(String value) {
    _$pictureAtom.reportWrite(value, super.picture, () {
      super.picture = value;
    });
  }

  late final _$controllerNameAtom =
      Atom(name: '_PetsMobx.controllerName', context: context);

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

  late final _$sexAtom = Atom(name: '_PetsMobx.sex', context: context);

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

  late final _$specieAtom = Atom(name: '_PetsMobx.specie', context: context);

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

  late final _$breedAtom = Atom(name: '_PetsMobx.breed', context: context);

  @override
  String get breed {
    _$breedAtom.reportRead();
    return super.breed;
  }

  @override
  set breed(String value) {
    _$breedAtom.reportWrite(value, super.breed, () {
      super.breed = value;
    });
  }

  late final _$controllerWeightAtom =
      Atom(name: '_PetsMobx.controllerWeight', context: context);

  @override
  TextEditingController get controllerWeight {
    _$controllerWeightAtom.reportRead();
    return super.controllerWeight;
  }

  @override
  set controllerWeight(TextEditingController value) {
    _$controllerWeightAtom.reportWrite(value, super.controllerWeight, () {
      super.controllerWeight = value;
    });
  }

  late final _$controllerBirthAtom =
      Atom(name: '_PetsMobx.controllerBirth', context: context);

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

  late final _$_PetsMobxActionController =
      ActionController(name: '_PetsMobx', context: context);

  @override
  void setSex(String value) {
    final _$actionInfo =
        _$_PetsMobxActionController.startAction(name: '_PetsMobx.setSex');
    try {
      return super.setSex(value);
    } finally {
      _$_PetsMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpecie(String value) {
    final _$actionInfo =
        _$_PetsMobxActionController.startAction(name: '_PetsMobx.setSpecie');
    try {
      return super.setSpecie(value);
    } finally {
      _$_PetsMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBreed(String value) {
    final _$actionInfo =
        _$_PetsMobxActionController.startAction(name: '_PetsMobx.setBreed');
    try {
      return super.setBreed(value);
    } finally {
      _$_PetsMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateFields(dynamic context) {
    final _$actionInfo = _$_PetsMobxActionController.startAction(
        name: '_PetsMobx.validateFields');
    try {
      return super.validateFields(context);
    } finally {
      _$_PetsMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo =
        _$_PetsMobxActionController.startAction(name: '_PetsMobx.clear');
    try {
      return super.clear();
    } finally {
      _$_PetsMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
picture: ${picture},
controllerName: ${controllerName},
sex: ${sex},
specie: ${specie},
breed: ${breed},
controllerWeight: ${controllerWeight},
controllerBirth: ${controllerBirth}
    ''';
  }
}
