// import dos dominios
import 'package:meus_animais/domain/repositories/forgot.dart';
import 'package:meus_animais/domain/models/users/login.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

@lazySingleton
class ForgotManager {

  ForgotManager(this.forgotRepository) {
    forgot();
  }

  final ForgotRepository forgotRepository;

  ModelLogin? modelLogin;
  bool _emailVerified = false;

  Future<bool> forgot() async {
    if ( modelLogin != null ) {
      _emailVerified = await forgotRepository.forgot( modelLogin!, _emailVerified );
    }
    return _emailVerified;
  }

}