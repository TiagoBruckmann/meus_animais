// import dos dominios
import 'package:meus_animais/data/sources/remote/services/events.dart';
import 'package:meus_animais/data/sources/remote/credentials.dart';
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

  final headerOnesignal = {
    "Authorization": "Basic ${Credentials().onesignalApiToken}",
    "Content-Type": "application/json",
  };

  late Map<String, String> defaultHeader = {
    "content-type" : "application/json",
    "Authorization": "Bearer ${modelLogin!.token}"
  };

  void setCredentials() {
    if ( modelLogin != null ) {
      _login();
    }
  }

  _login() async {
    modelLogin = await loginRepository.login( modelLogin! );
    EventsApp().sharedEvent("login_successful");
  }

}