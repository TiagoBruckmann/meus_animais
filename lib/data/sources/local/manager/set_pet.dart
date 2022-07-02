// import dos pacotes
import 'package:meus_animais/domain/repositories/set_pet.dart';
import 'package:injectable/injectable.dart';

// import dos modelos
import 'package:meus_animais/domain/models/hygiene_pets/hygiene_pets.dart';
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';

@lazySingleton
class SetPetManager {

  SetPetManager(this.setPetRepository) {
    setData();
  }

  final SetPetRepository setPetRepository;

  ModelPets? modelPets;
  ModelVaccines? modelVaccines;
  ModelHygienePets? modelHygienePets;

  setData() {
    if ( modelPets != null ) {
      _setPet();
    }
  }

  _setPet() async {
    await setPetRepository.setPet( modelPets!, modelVaccines, modelHygienePets );
  }

}