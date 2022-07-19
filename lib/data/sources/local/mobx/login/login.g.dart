// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginMobx on _LoginMobx, Store {
  final _$controllerEmailAtom = Atom(name: '_LoginMobx.controllerEmail');

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

  final _$controllerPasswdAtom = Atom(name: '_LoginMobx.controllerPasswd');

  @override
  TextEditingController get controllerPasswd {
    _$controllerPasswdAtom.reportRead();
    return super.controllerPasswd;
  }

  @override
  set controllerPasswd(TextEditingController value) {
    _$controllerPasswdAtom.reportWrite(value, super.controllerPasswd, () {
      super.controllerPasswd = value;
    });
  }

  final _$messageAtom = Atom(name: '_LoginMobx.message');

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

  final _$passwdVisibleAtom = Atom(name: '_LoginMobx.passwdVisible');

  @override
  bool get passwdVisible {
    _$passwdVisibleAtom.reportRead();
    return super.passwdVisible;
  }

  @override
  set passwdVisible(bool value) {
    _$passwdVisibleAtom.reportWrite(value, super.passwdVisible, () {
      super.passwdVisible = value;
    });
  }

  final _$_LoginMobxActionController = ActionController(name: '_LoginMobx');

  @override
  void setMessage(String value) {
    final _$actionInfo =
        _$_LoginMobxActionController.startAction(name: '_LoginMobx.setMessage');
    try {
      return super.setMessage(value);
    } finally {
      _$_LoginMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeVisible() {
    final _$actionInfo = _$_LoginMobxActionController.startAction(
        name: '_LoginMobx.changeVisible');
    try {
      return super.changeVisible();
    } finally {
      _$_LoginMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateFields(dynamic context) {
    final _$actionInfo = _$_LoginMobxActionController.startAction(
        name: '_LoginMobx.validateFields');
    try {
      return super.validateFields(context);
    } finally {
      _$_LoginMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo =
        _$_LoginMobxActionController.startAction(name: '_LoginMobx.clear');
    try {
      return super.clear();
    } finally {
      _$_LoginMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controllerEmail: ${controllerEmail},
controllerPasswd: ${controllerPasswd},
message: ${message},
passwdVisible: ${passwdVisible}
    ''';
  }
}
