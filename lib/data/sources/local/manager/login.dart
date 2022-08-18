// import dos dominios
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/domain/models/users/login.dart';
import 'package:meus_animais/domain/repositories/login.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginManager {

  LoginManager(this.loginRepository) {
    setCredentials();
  }

  final LoginRepository loginRepository;

  ModelLogin? modelLogin;

  void setCredentials() {
    if ( modelLogin != null ) {
      _login();
    }
  }

  _login() async {
    modelLogin = await loginRepository.login( modelLogin! );
    Services().analyticsEvent("login_successful");
    Services().facebookEvent("login_successful");
  }

}