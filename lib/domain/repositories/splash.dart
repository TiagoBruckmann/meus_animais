// imports nativos
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/get_user.dart';
import 'package:meus_animais/data/sources/remote/routes/requests.dart';
import 'package:meus_animais/data/sources/remote/services/events.dart';
import 'package:meus_animais/data/sources/remote/credentials.dart';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

// gerencia de estado
import 'package:meus_animais/data/sources/local/mobx/connection/connection.dart';
import 'package:meus_animais/domain/models/requests/requests.dart';
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

        final getUser = getIt.get<GetUserManager>();
        ModelUser modelUser = ModelUser(
          auth.currentUser!.uid,
          auth.currentUser!.displayName!,
          auth.currentUser!.email!,
        );
        EventsApp().sharedEvent("splash_user_logged");
        getUser.setCredentials(modelUser);
        Services().setEmail(modelUser.email);
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/",
          (route) => false,
        );
      } else {
        EventsApp().sharedEvent("splash_user_disconnected");
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/login",
          (route) => false,
        );
      }

    } else {
      EventsApp().sharedEvent("splash_user_disconnected");
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

    if ( mobx.connectionStatus.toString() == "ConnectivityResult.wifi" || mobx.connectionStatus.toString() == "ConnectivityResult.mobile" ) {

      Uri url = Uri.https(Credentials().apiUrl, Credentials().verifyToken);
      print("url => $url");
      final response = await Requests().httpGetDefault(url) as ModelRequests;
      print("response splash => $response");
      if ( response.statusCode == 204 ) {
        EventsApp().sharedEvent("splash_user_logged");
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/",
          (route) => false,
        );
      } else {
        EventsApp().sharedEvent("splash_invalid_token");
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/login",
          (route) => false,
        );
      }

    } else {
      EventsApp().sharedEvent("splash_network_error");
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/login",
        (route) => false,
      );
    }
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