// import dos sources
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/data/sources/local/manager/get_user.dart';

// import dos modelos
import 'package:meus_animais/domain/models/users/login.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/message.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:injectable/injectable.dart';

abstract class LoginRepository {
  login( ModelLogin modelLogin );
}

@Injectable(as: LoginRepository, env: ["firebase"])
class LoginFirebase implements LoginRepository {

  @override
  login( ModelLogin modelLogin ) async {

    auth.signInWithEmailAndPassword(
      email: modelLogin.email,
      password: modelLogin.password,
    ).then(( value ) async {

      getIt.get<GetUserManager>();
      Services().setToken("apiToken", auth.currentUser!.uid);
      Navigator.pushNamedAndRemoveUntil(
        modelLogin.context,
        "/",
        (route) => false,
      );

    }).onError((error, stackTrace) {
      CustomSnackBar(
        modelLogin.context,
        FlutterI18n.translate(modelLogin.context, "custom_message.register.error"),
        Colors.red,
      );
      crash.recordError(error, stackTrace);
      crash.log(error.toString());
    });
  }
}

@Injectable(as: LoginRepository, env: ["api"])
class LoginApi implements LoginRepository {

  @override
  login( ModelLogin modelLogin ) async {
    Services().setToken("apiToken", "ajklshdjkashdjkashbdjkasbhdjkasb");
    Navigator.pushNamedAndRemoveUntil(
      modelLogin.context,
      "/",
      (route) => false,
    );
  }
}

@Injectable(as: LoginRepository, env: ["test"])
class LoginTest implements LoginRepository {

  @override
  login( ModelLogin modelLogin ) async {
    Services().setToken("apiToken", "token_de_teste");
    return true;
  }
}