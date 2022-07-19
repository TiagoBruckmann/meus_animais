// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForgotMobx on _ForgotMobx, Store {
  final _$controllerEmailAtom = Atom(name: '_ForgotMobx.controllerEmail');

  @override
  TextEditingController get controllerEmail {
    _$controllerEmailAtom.reportRead();
    return super.controllerEmail;
  }

  @override
  set controllerEmail(TextEditingController value) {
    _$controllerEmailAtom.reportWrite(value, super.controllerEmail, () {
      super.controllerEmail = value;
    });
  }

  final _$messageAtom = Atom(name: '_ForgotMobx.message');

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  final _$emailVerifiedAtom = Atom(name: '_ForgotMobx.emailVerified');

  @override
  bool get emailVerified {
    _$emailVerifiedAtom.reportRead();
    return super.emailVerified;
  }

  @override
  set emailVerified(bool value) {
    _$emailVerifiedAtom.reportWrite(value, super.emailVerified, () {
      super.emailVerified = value;
    });
  }

  final _$validateEmailAsyncAction = AsyncAction('_ForgotMobx.validateEmail');

  @override
  Future validateEmail(dynamic context) {
    return _$validateEmailAsyncAction.run(() => super.validateEmail(context));
  }

  final _$_ForgotMobxActionController = ActionController(name: '_ForgotMobx');

  @override
  void setMessage(String value) {
    final _$actionInfo = _$_ForgotMobxActionController.startAction(
        name: '_ForgotMobx.setMessage');
    try {
      return super.setMessage(value);
    } finally {
      _$_ForgotMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void verifyEmail(bool value) {
    final _$actionInfo = _$_ForgotMobxActionController.startAction(
        name: '_ForgotMobx.verifyEmail');
    try {
      return super.verifyEmail(value);
    } finally {
      _$_ForgotMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo =
        _$_ForgotMobxActionController.startAction(name: '_ForgotMobx.clear');
    try {
      return super.clear();
    } finally {
      _$_ForgotMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controllerEmail: ${controllerEmail},
message: ${message},
emailVerified: ${emailVerified}
    ''';
  }
}
