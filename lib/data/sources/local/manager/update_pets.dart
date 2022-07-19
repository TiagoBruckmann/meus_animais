// import dos pacotes
import 'package:injectable/injectable.dart';
import 'package:meus_pets/data/sources/remote/services/services.dart';

// import dos modelos
import 'package:meus_pets/domain/repositories/update_pet.dart';
import 'package:meus_pets/domain/models/pets/pets.dart';

@lazySingleton
class UpdatePetManager {

  UpdatePetManager(this.updatePetRepository) {
    setData();
  }

  final UpdatePetRepository updatePetRepository;

  ModelPets modelPets;
  dynamic context;

  setData() {
    if ( modelPets != null && context != null ) {
      _updatePet();
    }
  }

  _updatePet() async {
    await updatePetRepository.updatePet( modelPets, context );
    analytics.logEvent(name: "update_pet-v1");
  }

}