// import dos dominios
import 'package:meus_animais/domain/repositories/splash.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

// gerenciamento de estado
import 'package:meus_animais/data/sources/local/mobx/connection/connection.dart';

@lazySingleton
class SplashManager {

  SplashManager(this.splashRepository) {
    setData();
  }

  final SplashRepository splashRepository;

  ConnectionMobx? mobx;
  dynamic context;

  void setData() {
    if ( mobx != null && context != null ) {
      _verifyUserLogged();
    }
  }

  _verifyUserLogged() async {
    splashRepository.verify(mobx!, context!);
  }


}