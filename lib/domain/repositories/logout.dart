// imports nativos
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/get_user.dart';
import 'package:meus_animais/data/sources/remote/routes/requests.dart';
import 'package:meus_animais/data/sources/remote/credentials.dart';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/message.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:injectable/injectable.dart';

abstract class LogoutRepository {
  logout( context );
}

@Injectable(as: LogoutRepository, env: ["firebase"])
class LogoutFirebase implements LogoutRepository {

  @override
  logout( context ) async {

    auth.signOut().then(( data ) async {

      Services().deleteAllTokens();
      getIt.resetLazySingleton<GetUserManager>();
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/login",
        (route) => false,
      );

      CustomSnackBar(
        context,
        FlutterI18n.translate(context, "custom_message.logout.success"),
        Colors.green,
      );

    }).onError((error, stackTrace) {
      CustomSnackBar(
        context,
        FlutterI18n.translate(context, "custom_message.logout.error"),
        Colors.red,
      );
      crash.recordError(error, stackTrace);
      crash.log(error.toString());
    });
  }
}

@Injectable(as: LogoutRepository, env: ["api"])
class LogoutApi implements LogoutRepository {

  @override
  logout( context ) async {
    Services().deleteAllTokens();
    getIt.resetLazySingleton<GetUserManager>();
    Uri url = Uri.https(Credentials().apiUrl, Credentials().authRoute);
    await Requests().httpGetDefault(url);
  }
}

@Injectable(as: LogoutRepository, env: ["test"])
class LogoutTest implements LogoutRepository {

  @override
  logout( context ) async {
    Services().deleteAllTokens();
    getIt.resetLazySingleton<GetUserManager>();
    return true;
  }
}