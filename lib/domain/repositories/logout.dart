// import dos sources
import 'package:flutter/material.dart';
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/get_user.dart';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import dos modelos
import 'package:meus_animais/domain/models/users/login.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/message.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

abstract class LogoutRepository {
  logout( context );
}

@Injectable(as: LogoutRepository, env: ["firebase"])
class LoginFirebase implements LogoutRepository {

  @override
  logout( context ) async {

    auth.signOut().whenComplete(() {
      Services().deleteAllTokens();
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/login",
        (route) => false,
      );
    }).onError((error, stackTrace) {
      crash.recordError(error, stackTrace);
    });
  }
}

@Injectable(as: LogoutRepository, env: ["api"])
class LoginApi implements LogoutRepository {

  @override
  logout( context ) async {
    Services().deleteAllTokens();
    Navigator.pushNamedAndRemoveUntil(
      context,
      "/login",
      (route) => false,
    );
  }
}