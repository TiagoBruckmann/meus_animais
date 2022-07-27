// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccines.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VaccinesMobx on _VaccinesMobx, Store {
  Computed<List<String>>? _$listTimeComputed;

  @override
  List<String> get listTime =>
      (_$listTimeComputed ??= Computed<List<String>>(() => super.listTime,
              name: '_VaccinesMobx.listTime'))
          .value;

  late final _$controllerNameAtom =
      Atom(name: '_VaccinesMobx.controllerName', context: context);

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

  late final _$controllerTypeAtom =
      Atom(name: '_VaccinesMobx.controllerType', context: context);

  @override
  TextEditingController get controllerType {
    _$controllerTypeAtom.reportRead();
    return super.controllerType;
  }

  @override
  set controllerType(TextEditingController value) {
    _$controllerTypeAtom.reportWrite(value, super.controllerType, () {
      super.controllerType = value;
    });
  }

  late final _$controllerDescriptionAtom =
      Atom(name: '_VaccinesMobx.controllerDescription', context: context);

  @override
  TextEditingController get controllerDescription {
    _$controllerDescriptionAtom.reportRead();
    return super.controllerDescription;
  }

  @override
  set controllerDescription(TextEditingController value) {
    _$controllerDescriptionAtom.reportWrite(value, super.controllerDescription,
        () {
      super.controllerDescription = value;
    });
  }

  late final _$controllerDayAtom =
      Atom(name: '_VaccinesMobx.controllerDay', context: context);

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

  late final _$reapplyAtom =
      Atom(name: '_VaccinesMobx.reapply', context: context);

  @override
  bool get reapply {
    _$reapplyAtom.reportRead();
    return super.reapply;
  }

  @override
  set reapply(bool value) {
    _$reapplyAtom.reportWrite(value, super.reapply, () {
      super.reapply = value;
    });
  }

  late final _$typeTimeAtom =
      Atom(name: '_VaccinesMobx.typeTime', context: context);

  @override
  String get typeTime {
    _$typeTimeAtom.reportRead();
    return super.typeTime;
  }

  @override
  set typeTime(String value) {
    _$typeTimeAtom.reportWrite(value, super.typeTime, () {
      super.typeTime = value;
    });
  }

  late final _$timeAtom = Atom(name: '_VaccinesMobx.time', context: context);

  @override
  String get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(String value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  late final _$controllerLaboratoryAtom =
      Atom(name: '_VaccinesMobx.controllerLaboratory', context: context);

  @override
  TextEditingController get controllerLaboratory {
    _$controllerLaboratoryAtom.reportRead();
    return super.controllerLaboratory;
  }

  @override
  set controllerLaboratory(TextEditingController value) {
    _$controllerLaboratoryAtom.reportWrite(value, super.controllerLaboratory,
        () {
      super.controllerLaboratory = value;
    });
  }

  late final _$validateFieldsAsyncAction =
      AsyncAction('_VaccinesMobx.validateFields', context: context);

  @override
  Future validateFields(dynamic context, String petId, bool updatePet) {
    return _$validateFieldsAsyncAction
        .run(() => super.validateFields(context, petId, updatePet));
  }

  late final _$_VaccinesMobxActionController =
      ActionController(name: '_VaccinesMobx', context: context);

  @override
  void setReapply(bool value) {
    final _$actionInfo = _$_VaccinesMobxActionController.startAction(
        name: '_VaccinesMobx.setReapply');
    try {
      return super.setReapply(value);
    } finally {
      _$_VaccinesMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTypeTime(String value) {
    final _$actionInfo = _$_VaccinesMobxActionController.startAction(
        name: '_VaccinesMobx.setTypeTime');
    try {
      return super.setTypeTime(value);
    } finally {
      _$_VaccinesMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTime(String value) {
    final _$actionInfo = _$_VaccinesMobxActionController.startAction(
        name: '_VaccinesMobx.setTime');
    try {
      return super.setTime(value);
    } finally {
      _$_VaccinesMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$_VaccinesMobxActionController.startAction(
        name: '_VaccinesMobx.clear');
    try {
      return super.clear();
    } finally {
      _$_VaccinesMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controllerName: ${controllerName},
controllerType: ${controllerType},
controllerDescription: ${controllerDescription},
controllerDay: ${controllerDay},
reapply: ${reapply},
typeTime: ${typeTime},
time: ${time},
controllerLaboratory: ${controllerLaboratory},
listTime: ${listTime}
    ''';
  }
}
