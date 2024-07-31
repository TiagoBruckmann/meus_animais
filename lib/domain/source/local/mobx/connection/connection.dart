// pacotes nativos do flutter
import 'package:flutter/services.dart';
import 'dart:async';

// imports globais
import 'package:meus_animais/session.dart';

// import dos pacotes
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobx/mobx.dart';

part 'connection.g.dart';

class ConnectionMobx extends _ConnectionMobx with _$ConnectionMobx {}

abstract class _ConnectionMobx with Store {

  @observable
  ConnectivityResult connectionStatus = ConnectivityResult.none;

  @observable
  Connectivity connectivity = Connectivity();

  @observable
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  @action
  Future<void> verifyConnection() async {

    List<ConnectivityResult> result = [];

    try {
      result.addAll(await connectivity.checkConnectivity());

      if ( result.contains( ConnectivityResult.wifi ) ) {
        return updateConnectionStatus(ConnectivityResult.wifi);
      }

      if ( result.contains( ConnectivityResult.mobile ) ) {
        return updateConnectionStatus(ConnectivityResult.mobile);
      }

      return updateConnectionStatus(ConnectivityResult.none);

    } on PlatformException catch (e) {
      Session.appEvents.sharedErrorEvent("verify_connection_error", e.code);
      Session.crash.log(e);
      return;
    }

  }

  @action
  Future<void> updateConnectionStatus( ConnectivityResult result ) async => connectionStatus = result;

  @action
  void listenChangeConnectivityState() {
    _subscription = connectivity.onConnectivityChanged.listen((event) async {
      return await verifyConnection();
    });
  }

  @action
  void cancelListen() => _subscription?.cancel();
}