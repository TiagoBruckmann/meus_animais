// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pets.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PetsMobx on _PetsMobx, Store {
  late final _$getPetsAsyncAction =
      AsyncAction('_PetsMobx.getPets', context: context);

  @override
  Future<List<ModelPets>> getPets(dynamic context) {
    return _$getPetsAsyncAction.run(() => super.getPets(context));
  }

  late final _$refreshAsyncAction =
      AsyncAction('_PetsMobx.refresh', context: context);

  @override
  Future refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  late final _$_PetsMobxActionController =
      ActionController(name: '_PetsMobx', context: context);

  @override
  dynamic setPets(Iterable<ModelPets> iterable) {
    final _$actionInfo =
        _$_PetsMobxActionController.startAction(name: '_PetsMobx.setPets');
    try {
      return super.setPets(iterable);
    } finally {
      _$_PetsMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
