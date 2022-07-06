// import dos pacotes
import 'package:injectable/injectable.dart';
import 'package:meus_animais/domain/models/hygiene/hygiene_pets.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';
import 'package:meus_animais/domain/repositories/set_hygiene.dart';
import 'package:meus_animais/domain/repositories/set_vaccines.dart';

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
  }

}