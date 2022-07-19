// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConnectionMobx on _ConnectionMobx, Store {
  final _$connectionStatusAtom = Atom(name: '_ConnectionMobx.connectionStatus');

  @override
  ConnectivityResult get connectionStatus {
    _$connectionStatusAtom.reportRead();
    return super.connectionStatus;
  }

  @override
  set connectionStatus(ConnectivityResult value) {
    _$connectionStatusAtom.reportWrite(value, super.connectionStatus, () {
      super.connectionStatus = value;
    });
  }

  final _$connectivityAtom = Atom(name: '_ConnectionMobx.connectivity');

  @override
  Connectivity get connectivity {
    _$connectivityAtom.reportRead();
    return super.connectivity;
  }

  @override
  set connectivity(Connectivity value) {
    _$connectivityAtom.reportWrite(value, super.connectivity, () {
      super.connectivity = value;
    });
  }

  final _$verifyConnectionAsyncAction =
      AsyncAction('_ConnectionMobx.verifyConnection');

  @override
  Future<void> verifyConnection() {
    return _$verifyConnectionAsyncAction.run(() => super.verifyConnection());
  }

  final _$updateConnectionStatusAsyncAction =
      AsyncAction('_ConnectionMobx.updateConnectionStatus');

  @override
  Future<void> updateConnectionStatus(ConnectivityResult result) {
    return _$updateConnectionStatusAsyncAction
        .run(() => super.updateConnectionStatus(result));
  }

  @override
  String toString() {
    return '''
connectionStatus: ${connectionStatus},
connectivity: ${connectivity}
    ''';
  }
}
