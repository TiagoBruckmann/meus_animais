// import dos pacotes
import 'package:injectable/injectable.dart';

// import dos domain
import 'package:meus_animais/data/sources/remote/services/events.dart';
import 'package:meus_animais/domain/models/hygiene/hygiene_pets.dart';
import 'package:meus_animais/domain/repositories/set_hygiene.dart';

@lazySingleton
class SetHygieneManager {

  SetHygieneManager(this.setHygieneRepository) {
    setData();
  }

  final SetHygieneRepository setHygieneRepository;

  List<ModelHygienePets> listHygiene = [];

  setData() {
    if ( listHygiene.isNotEmpty ) {
      _setHygiene();
    }
  }

  _setHygiene() async {
    await setHygieneRepository.setHygiene(listHygiene);
    EventsApp().sharedEvent("create_hygiene");
  }

}