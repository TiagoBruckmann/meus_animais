// import dos pacotes
import 'package:injectable/injectable.dart';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/events.dart';
import 'package:meus_animais/domain/repositories/update_pet.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';

@lazySingleton
class UpdatePetManager {

  UpdatePetManager(this.updatePetRepository) {
    setData();
  }

  final UpdatePetRepository updatePetRepository;

  ModelPets? modelPets;
  dynamic context;

  setData() {
    if ( modelPets != null && context != null ) {
      _updatePet();
    }
  }

  _updatePet() async {
    await updatePetRepository.updatePet( modelPets!, context );
    EventsApp().sharedEvent("update_pet");
  }

}