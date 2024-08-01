// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserMobx on _UserMobx, Store {
  late final _$getUserAsyncAction =
      AsyncAction('_UserMobx.getUser', context: context);

  @override
  Future<void> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  late final _$requestInfoDataAsyncAction =
      AsyncAction('_UserMobx.requestInfoData', context: context);

  @override
  Future<void> requestInfoData() {
    return _$requestInfoDataAsyncAction.run(() => super.requestInfoData());
  }

  late final _$logOutAsyncAction =
      AsyncAction('_UserMobx.logOut', context: context);

  @override
  Future<void> logOut(Function clearUserData) {
    return _$logOutAsyncAction.run(() => super.logOut(clearUserData));
  }

  late final _$deleteAccountAsyncAction =
      AsyncAction('_UserMobx.deleteAccount', context: context);

  @override
  Future<void> deleteAccount() {
    return _$deleteAccountAsyncAction.run(() => super.deleteAccount());
  }

  late final _$_UserMobxActionController =
      ActionController(name: '_UserMobx', context: context);

  @override
  void goToTerms() {
    final _$actionInfo =
        _$_UserMobxActionController.startAction(name: '_UserMobx.goToTerms');
    try {
      return super.goToTerms();
    } finally {
      _$_UserMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToPolicy() {
    final _$actionInfo =
        _$_UserMobxActionController.startAction(name: '_UserMobx.goToPolicy');
    try {
      return super.goToPolicy();
    } finally {
      _$_UserMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _goToLogin() {
    final _$actionInfo =
        _$_UserMobxActionController.startAction(name: '_UserMobx._goToLogin');
    try {
      return super._goToLogin();
    } finally {
      _$_UserMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
