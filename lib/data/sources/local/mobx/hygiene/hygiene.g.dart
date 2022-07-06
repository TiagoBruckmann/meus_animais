// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hygiene.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HygieneMobx on _HygieneMobx, Store {
  late final _$nameAtom = Atom(name: '_HygieneMobx.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$controllerPlaceAtom =
      Atom(name: '_HygieneMobx.controllerPlace', context: context);

  @override
  TextEditingController get controllerPlace {
    _$controllerPlaceAtom.reportRead();
    return super.controllerPlace;
  }

  @override
  set controllerPlace(TextEditingController value) {
    _$controllerPlaceAtom.reportWrite(value, super.controllerPlace, () {
      super.controllerPlace = value;
    });
  }

  late final _$controllerDayAtom =
      Atom(name: '_HygieneMobx.controllerDay', context: context);

  @override
  MaskedTextController get controllerDay {
    _$controllerDayAtom.reportRead();
    return super.controllerDay;
  }

  @override
  set controllerDay(MaskedTextController value) {
    _$controllerDayAtom.reportWrite(value, super.controllerDay, () {
      super.controllerDay = value;
    });
  }

  late final _$controllerValueAtom =
      Atom(name: '_HygieneMobx.controllerValue', context: context);

  @override
  MoneyMaskedTextController get controllerValue {
    _$controllerValueAtom.reportRead();
    return super.controllerValue;
  }

  @override
  set controllerValue(MoneyMaskedTextController value) {
    _$controllerValueAtom.reportWrite(value, super.controllerValue, () {
      super.controllerValue = value;
    });
  }

  late final _$_HygieneMobxActionController =
      ActionController(name: '_HygieneMobx', context: context);

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_HygieneMobxActionController.startAction(
        name: '_HygieneMobx.setName');
    try {
      return super.setName(value);
    } finally {
      _$_HygieneMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateFields(dynamic context, String petId) {
    final _$actionInfo = _$_HygieneMobxActionController.startAction(
        name: '_HygieneMobx.validateFields');
    try {
      return super.validateFields(context, petId);
    } finally {
      _$_HygieneMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo =
        _$_HygieneMobxActionController.startAction(name: '_HygieneMobx.clear');
    try {
      return super.clear();
    } finally {
      _$_HygieneMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
controllerPlace: ${controllerPlace},
controllerDay: ${controllerDay},
controllerValue: ${controllerValue}
    ''';
  }
}
