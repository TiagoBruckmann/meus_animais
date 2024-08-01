// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccine.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VaccineMobx on _VaccineMobx, Store {
  Computed<List<String>>? _$listTimeComputed;

  @override
  List<String> get listTime =>
      (_$listTimeComputed ??= Computed<List<String>>(() => super.listTime,
              name: '_VaccineMobx.listTime'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: '_VaccineMobx.isLoading', context: context);

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

  late final _$controllerNameAtom =
      Atom(name: '_VaccineMobx.controllerName', context: context);

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
      Atom(name: '_VaccineMobx.controllerType', context: context);

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
      Atom(name: '_VaccineMobx.controllerDescription', context: context);

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

  late final _$controllerDateAtom =
      Atom(name: '_VaccineMobx.controllerDate', context: context);

  @override
  MaskedTextController get controllerDate {
    _$controllerDateAtom.reportRead();
    return super.controllerDate;
  }

  @override
  set controllerDate(MaskedTextController value) {
    _$controllerDateAtom.reportWrite(value, super.controllerDate, () {
      super.controllerDate = value;
    });
  }

  late final _$reapplyAtom =
      Atom(name: '_VaccineMobx.reapply', context: context);

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
      Atom(name: '_VaccineMobx.typeTime', context: context);

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

  late final _$timeAtom = Atom(name: '_VaccineMobx.time', context: context);

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
      Atom(name: '_VaccineMobx.controllerLaboratory', context: context);

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
      AsyncAction('_VaccineMobx.validateFields', context: context);

  @override
  Future<void> validateFields(String petId, bool isUpdate) {
    return _$validateFieldsAsyncAction
        .run(() => super.validateFields(petId, isUpdate));
  }

  late final _$_setVaccinesAsyncAction =
      AsyncAction('_VaccineMobx._setVaccines', context: context);

  @override
  Future<void> _setVaccines(List<VaccineEntity> list) {
    return _$_setVaccinesAsyncAction.run(() => super._setVaccines(list));
  }

  late final _$_VaccineMobxActionController =
      ActionController(name: '_VaccineMobx', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_VaccineMobxActionController.startAction(
        name: '_VaccineMobx.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_VaccineMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReapply(bool value) {
    final _$actionInfo = _$_VaccineMobxActionController.startAction(
        name: '_VaccineMobx.setReapply');
    try {
      return super.setReapply(value);
    } finally {
      _$_VaccineMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTypeTime(String value) {
    final _$actionInfo = _$_VaccineMobxActionController.startAction(
        name: '_VaccineMobx.setTypeTime');
    try {
      return super.setTypeTime(value);
    } finally {
      _$_VaccineMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTime(String value) {
    final _$actionInfo = _$_VaccineMobxActionController.startAction(
        name: '_VaccineMobx.setTime');
    try {
      return super.setTime(value);
    } finally {
      _$_VaccineMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo =
        _$_VaccineMobxActionController.startAction(name: '_VaccineMobx.clear');
    try {
      return super.clear();
    } finally {
      _$_VaccineMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _goToPop(List<VaccineEntity>? list) {
    final _$actionInfo = _$_VaccineMobxActionController.startAction(
        name: '_VaccineMobx._goToPop');
    try {
      return super._goToPop(list);
    } finally {
      _$_VaccineMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
controllerName: ${controllerName},
controllerType: ${controllerType},
controllerDescription: ${controllerDescription},
controllerDate: ${controllerDate},
reapply: ${reapply},
typeTime: ${typeTime},
time: ${time},
controllerLaboratory: ${controllerLaboratory},
listTime: ${listTime}
    ''';
  }
}
