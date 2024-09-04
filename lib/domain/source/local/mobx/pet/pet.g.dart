// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PetMobx on _PetMobx, Store {
  late final _$isLoadingAtom =
      Atom(name: '_PetMobx.isLoading', context: context);

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

  late final _$errorMessageAtom =
      Atom(name: '_PetMobx.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$getPetsAsyncAction =
      AsyncAction('_PetMobx.getPets', context: context);

  @override
  Future<void> getPets() {
    return _$getPetsAsyncAction.run(() => super.getPets());
  }

  late final _$_getSpeciesAsyncAction =
      AsyncAction('_PetMobx._getSpecies', context: context);

  @override
  Future<void> _getSpecies() {
    return _$_getSpeciesAsyncAction.run(() => super._getSpecies());
  }

  late final _$refreshAsyncAction =
      AsyncAction('_PetMobx.refresh', context: context);

  @override
  Future<void> refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  late final _$_PetMobxActionController =
      ActionController(name: '_PetMobx', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo =
        _$_PetMobxActionController.startAction(name: '_PetMobx.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_PetMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorMessage(String? value) {
    final _$actionInfo = _$_PetMobxActionController.startAction(
        name: '_PetMobx.setErrorMessage');
    try {
      return super.setErrorMessage(value);
    } finally {
      _$_PetMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setList(List<PetEntity> list) {
    final _$actionInfo =
        _$_PetMobxActionController.startAction(name: '_PetMobx._setList');
    try {
      return super._setList(list);
    } finally {
      _$_PetMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setListSpecies(Iterable<LifeTimeEntity> value) {
    final _$actionInfo = _$_PetMobxActionController.startAction(
        name: '_PetMobx._setListSpecies');
    try {
      return super._setListSpecies(value);
    } finally {
      _$_PetMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo =
        _$_PetMobxActionController.startAction(name: '_PetMobx.clear');
    try {
      return super.clear();
    } finally {
      _$_PetMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToDetail(PetEntity pet) {
    final _$actionInfo =
        _$_PetMobxActionController.startAction(name: '_PetMobx.goToDetail');
    try {
      return super.goToDetail(pet);
    } finally {
      _$_PetMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}
