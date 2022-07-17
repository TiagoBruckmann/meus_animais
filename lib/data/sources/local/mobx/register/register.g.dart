// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterMobx on _RegisterMobx, Store {
  late final _$controllerNameAtom =
      Atom(name: '_RegisterMobx.controllerName', context: context);

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

  late final _$controllerEmailAtom =
      Atom(name: '_RegisterMobx.controllerEmail', context: context);

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

  late final _$controllerPasswdAtom =
      Atom(name: '_RegisterMobx.controllerPasswd', context: context);

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

  late final _$messageAtom =
      Atom(name: '_RegisterMobx.message', context: context);

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

  late final _$passwdVisibleAtom =
      Atom(name: '_RegisterMobx.passwdVisible', context: context);

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

  late final _$darkThemeAtom =
      Atom(name: '_RegisterMobx.darkTheme', context: context);

  @override
  bool get darkTheme {
    _$darkThemeAtom.reportRead();
    return super.darkTheme;
  }

  @override
  set darkTheme(bool value) {
    _$darkThemeAtom.reportWrite(value, super.darkTheme, () {
      super.darkTheme = value;
    });
  }

  late final _$_RegisterMobxActionController =
      ActionController(name: '_RegisterMobx', context: context);

  @override
  void setMessage(String value) {
    final _$actionInfo = _$_RegisterMobxActionController.startAction(
        name: '_RegisterMobx.setMessage');
    try {
      return super.setMessage(value);
    } finally {
      _$_RegisterMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeVisible() {
    final _$actionInfo = _$_RegisterMobxActionController.startAction(
        name: '_RegisterMobx.changeVisible');
    try {
      return super.changeVisible();
    } finally {
      _$_RegisterMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDarkTheme() {
    final _$actionInfo = _$_RegisterMobxActionController.startAction(
        name: '_RegisterMobx.setDarkTheme');
    try {
      return super.setDarkTheme();
    } finally {
      _$_RegisterMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateFields(dynamic context) {
    final _$actionInfo = _$_RegisterMobxActionController.startAction(
        name: '_RegisterMobx.validateFields');
    try {
      return super.validateFields(context);
    } finally {
      _$_RegisterMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$_RegisterMobxActionController.startAction(
        name: '_RegisterMobx.clear');
    try {
      return super.clear();
    } finally {
      _$_RegisterMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controllerName: ${controllerName},
controllerEmail: ${controllerEmail},
controllerPasswd: ${controllerPasswd},
message: ${message},
passwdVisible: ${passwdVisible},
darkTheme: ${darkTheme}
    ''';
  }
}
