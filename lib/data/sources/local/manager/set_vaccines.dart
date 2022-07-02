// import dos pacotes
import 'package:injectable/injectable.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';
import 'package:meus_animais/domain/repositories/set_vaccines.dart';

@lazySingleton
class SetVaccineManager {

  SetVaccineManager(this.setVaccinesRepository) {
    setData();
  }

  final SetVaccinesRepository setVaccinesRepository;

  ModelVaccines? modelVaccines;
  String? petId;

  setData() {
    if ( modelVaccines != null && petId != null ) {
      _setVaccines();
    }
  }

  _setVaccines() async {
    await setVaccinesRepository.setVaccines( modelVaccines!, petId! );
  }

}