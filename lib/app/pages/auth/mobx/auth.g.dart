// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthMobx on _AuthMobx, Store {
  late final _$controllerNameAtom =
      Atom(name: '_AuthMobx.controllerName', context: context);

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
      Atom(name: '_AuthMobx.controllerEmail', context: context);

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
      Atom(name: '_AuthMobx.controllerPasswd', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: '_AuthMobx.isLoading', context: context);

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

  late final _$messageAtom = Atom(name: '_AuthMobx.message', context: context);

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

  late final _$isSuccessMessageAtom =
      Atom(name: '_AuthMobx.isSuccessMessage', context: context);

  @override
  bool get isSuccessMessage {
    _$isSuccessMessageAtom.reportRead();
    return super.isSuccessMessage;
  }

  @override
  set isSuccessMessage(bool value) {
    _$isSuccessMessageAtom.reportWrite(value, super.isSuccessMessage, () {
      super.isSuccessMessage = value;
    });
  }

  late final _$passwdVisibleAtom =
      Atom(name: '_AuthMobx.passwdVisible', context: context);

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

  late final _$_loginAsyncAction =
      AsyncAction('_AuthMobx._login', context: context);

  @override
  Future<void> _login() {
    return _$_loginAsyncAction.run(() => super._login());
  }

  late final _$_forgotAsyncAction =
      AsyncAction('_AuthMobx._forgot', context: context);

  @override
  Future<void> _forgot() {
    return _$_forgotAsyncAction.run(() => super._forgot());
  }

  late final _$_registerAsyncAction =
      AsyncAction('_AuthMobx._register', context: context);

  @override
  Future<void> _register() {
    return _$_registerAsyncAction.run(() => super._register());
  }

  late final _$_AuthMobxActionController =
      ActionController(name: '_AuthMobx', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo =
        _$_AuthMobxActionController.startAction(name: '_AuthMobx.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_AuthMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMessage(String value, {bool isSuccess = false}) {
    final _$actionInfo =
        _$_AuthMobxActionController.startAction(name: '_AuthMobx.setMessage');
    try {
      return super.setMessage(value, isSuccess: isSuccess);
    } finally {
      _$_AuthMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeVisible() {
    final _$actionInfo = _$_AuthMobxActionController.startAction(
        name: '_AuthMobx.changeVisible');
    try {
      return super.changeVisible();
    } finally {
      _$_AuthMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateFields(String authType) {
    final _$actionInfo = _$_AuthMobxActionController.startAction(
        name: '_AuthMobx.validateFields');
    try {
      return super.validateFields(authType);
    } finally {
      _$_AuthMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo =
        _$_AuthMobxActionController.startAction(name: '_AuthMobx.clear');
    try {
      return super.clear();
    } finally {
      _$_AuthMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToForgot() {
    final _$actionInfo =
        _$_AuthMobxActionController.startAction(name: '_AuthMobx.goToForgot');
    try {
      return super.goToForgot();
    } finally {
      _$_AuthMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToRegister() {
    final _$actionInfo =
        _$_AuthMobxActionController.startAction(name: '_AuthMobx.goToRegister');
    try {
      return super.goToRegister();
    } finally {
      _$_AuthMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _goToHome() {
    final _$actionInfo =
        _$_AuthMobxActionController.startAction(name: '_AuthMobx._goToHome');
    try {
      return super._goToHome();
    } finally {
      _$_AuthMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _goToPop() {
    final _$actionInfo =
        _$_AuthMobxActionController.startAction(name: '_AuthMobx._goToPop');
    try {
      return super._goToPop();
    } finally {
      _$_AuthMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controllerName: ${controllerName},
controllerEmail: ${controllerEmail},
controllerPasswd: ${controllerPasswd},
isLoading: ${isLoading},
message: ${message},
isSuccessMessage: ${isSuccessMessage},
passwdVisible: ${passwdVisible}
    ''';
  }
}
