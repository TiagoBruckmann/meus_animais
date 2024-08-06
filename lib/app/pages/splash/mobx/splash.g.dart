// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashMobx on _SplashMobx, Store {
  late final _$verifyConnectionAsyncAction =
      AsyncAction('_SplashMobx.verifyConnection', context: context);

  @override
  Future<void> verifyConnection(UserMobx userMobx) {
    return _$verifyConnectionAsyncAction
        .run(() => super.verifyConnection(userMobx));
  }

  late final _$redirectAsyncAction =
      AsyncAction('_SplashMobx.redirect', context: context);

  @override
  Future<void> redirect(bool connected) {
    return _$redirectAsyncAction.run(() => super.redirect(connected));
  }

  late final _$_SplashMobxActionController =
      ActionController(name: '_SplashMobx', context: context);

  @override
  void _goToHome() {
    final _$actionInfo = _$_SplashMobxActionController.startAction(
        name: '_SplashMobx._goToHome');
    try {
      return super._goToHome();
    } finally {
      _$_SplashMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _goToLogin() {
    final _$actionInfo = _$_SplashMobxActionController.startAction(
        name: '_SplashMobx._goToLogin');
    try {
      return super._goToLogin();
    } finally {
      _$_SplashMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
