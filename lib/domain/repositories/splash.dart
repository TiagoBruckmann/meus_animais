// import dos sources
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

// gerencia de estado
import 'package:meus_animais/data/sources/local/mobx/connection/connection.dart';

abstract class SplashRepository {
  verify( ConnectionMobx mobx, context );
}

@Injectable(as: SplashRepository, env: ["firebase"])
class SplashFirebase implements SplashRepository {

  @override
  verify( ConnectionMobx mobx, context ) async {

    if ( mobx.connectionStatus.toString() == "ConnectivityResult.wifi" || mobx.connectionStatus.toString() == "ConnectivityResult.mobile" ) {

      if ( auth.currentUser != null ) {

        Navigator.pushNamedAndRemoveUntil(
          context,
          "/",
          (route) => false,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/login",
          (route) => false,
        );
      }

    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/login",
        (route) => false,
      );
    }

  }
}

@Injectable(as: SplashRepository, env: ["api"])
class SplashApi implements SplashRepository {

  @override
  verify( ConnectionMobx mobx, context ) async {
    Navigator.pushNamedAndRemoveUntil(
      context,
      "/login",
      (route) => false,
    );
  }

}