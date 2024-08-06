// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hygiene.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HygieneMobx on _HygieneMobx, Store {
  late final _$isLoadingAtom =
      Atom(name: '_HygieneMobx.isLoading', context: context);

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

  late final _$selectedServiceAtom =
      Atom(name: '_HygieneMobx.selectedService', context: context);

  @override
  String get selectedService {
    _$selectedServiceAtom.reportRead();
    return super.selectedService;
  }

  @override
  set selectedService(String value) {
    _$selectedServiceAtom.reportWrite(value, super.selectedService, () {
      super.selectedService = value;
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

  late final _$getServicesAsyncAction =
      AsyncAction('_HygieneMobx.getServices', context: context);

  @override
  Future<void> getServices() {
    return _$getServicesAsyncAction.run(() => super.getServices());
  }

  late final _$validateFieldsAsyncAction =
      AsyncAction('_HygieneMobx.validateFields', context: context);

  @override
  Future<void> validateFields(String petId, bool isUpdate) {
    return _$validateFieldsAsyncAction
        .run(() => super.validateFields(petId, isUpdate));
  }

  late final _$_setHygieneAsyncAction =
      AsyncAction('_HygieneMobx._setHygiene', context: context);

  @override
  Future<void> _setHygiene(List<HygieneEntity> list) {
    return _$_setHygieneAsyncAction.run(() => super._setHygiene(list));
  }

  late final _$_HygieneMobxActionController =
      ActionController(name: '_HygieneMobx', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_HygieneMobxActionController.startAction(
        name: '_HygieneMobx.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_HygieneMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListServices(Iterable<ServiceEntity> value) {
    final _$actionInfo = _$_HygieneMobxActionController.startAction(
        name: '_HygieneMobx.setListServices');
    try {
      return super.setListServices(value);
    } finally {
      _$_HygieneMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedService(String value) {
    final _$actionInfo = _$_HygieneMobxActionController.startAction(
        name: '_HygieneMobx.setSelectedService');
    try {
      return super.setSelectedService(value);
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
  void _goToPop(List<HygieneEntity> hygiene) {
    final _$actionInfo = _$_HygieneMobxActionController.startAction(
        name: '_HygieneMobx._goToPop');
    try {
      return super._goToPop(hygiene);
    } finally {
      _$_HygieneMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
selectedService: ${selectedService},
controllerPlace: ${controllerPlace},
controllerDay: ${controllerDay},
controllerValue: ${controllerValue}
    ''';
  }
}
