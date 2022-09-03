// import dos dominios
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/get_user.dart';
import 'package:meus_animais/data/sources/remote/services/events.dart';
import 'package:meus_animais/domain/repositories/destroy.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

@lazySingleton
class DestroyManager {

  DestroyManager(this.destroyRepository) {
    destroy();
  }

  final DestroyRepository destroyRepository;
  dynamic context;

  void destroy() async {
    final getUser = getIt.get<GetUserManager>();
    if ( context != null ) {
      destroyRepository.destroy( getUser.modelUser!, context );
      EventsApp().sharedEvent("destroy");
    }
  }

}