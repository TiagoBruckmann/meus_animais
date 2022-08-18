// import dos dominios
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/domain/repositories/register.dart';
import 'package:meus_animais/domain/models/users/login.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

@lazySingleton
class RegisterManager {

  RegisterManager(this.registerRepository) {
    setCredentials();
  }

  final RegisterRepository registerRepository;

  ModelLogin? modelLogin;

  void setCredentials() {
    if ( modelLogin != null ) {
      _register();
    }
  }

  _register() async {
    modelLogin = await registerRepository.register(modelLogin!);
    Services().analyticsEvent("register_successful");
    Services().facebookEvent("register_successful");
  }

}