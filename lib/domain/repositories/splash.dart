// import dos sources
import 'package:flutter/material.dart';
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/get_user.dart';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

// gerencia de estado
import 'package:meus_animais/data/sources/local/mobx/connection/connection.dart';
import 'package:meus_animais/domain/models/users/user.dart';

abstract class SplashRepository {
  verify( ConnectionMobx mobx, context );
}

@Injectable(as: SplashRepository, env: ["firebase"])
class SplashFirebase implements SplashRepository {

  @override
  verify( ConnectionMobx mobx, context ) async {

    if ( mobx.connectionStatus.toString() == "ConnectivityResult.wifi" || mobx.connectionStatus.toString() == "ConnectivityResult.mobile" ) {

      if ( auth.currentUser != null ) {

        /*
        final getUser = getIt.get<GetUserManager>();
        ModelUser modelUser = ModelUser(
          auth.currentUser!.uid,
          auth.currentUser!.displayName!,
          auth.currentUser!.email!,
        );
        getUser.setCredentials(modelUser);
        */
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

@Injectable(as: SplashRepository, env: ["test"])
class SplashTest implements SplashRepository {

  @override
  verify( ConnectionMobx mobx, context ) async {
    if ( auth.currentUser != null ) {
      ModelUser modelUser = ModelUser(
        auth.currentUser!.uid,
        auth.currentUser!.displayName!,
        auth.currentUser!.email!,
      );
      return modelUser;
    }

    return false;
  }

}