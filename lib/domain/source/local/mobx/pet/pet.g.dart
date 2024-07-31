// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PetMobx on _PetMobx, Store {
  late final _$getPetsAsyncAction =
      AsyncAction('_PetMobx.getPets', context: context);

  @override
  Future<void> getPets() {
    return _$getPetsAsyncAction.run(() => super.getPets());
  }

  late final _$refreshAsyncAction =
      AsyncAction('_PetMobx.refresh', context: context);

  @override
  Future refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  late final _$_PetMobxActionController =
      ActionController(name: '_PetMobx', context: context);

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

    ''';
  }
}
