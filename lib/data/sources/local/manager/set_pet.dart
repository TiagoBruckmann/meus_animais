// import dos pacotes
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

// import dos modelos
import 'package:meus_animais/domain/repositories/set_pet.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';

@lazySingleton
class SetPetManager {

  SetPetManager(this.setPetRepository) {
    setData();
  }

  final SetPetRepository setPetRepository;

  ModelPets? modelPets;
  dynamic context;
  XFile? picture;

  setData() {
    if ( modelPets != null && context != null && picture != null ) {
      _setPet();
    }
  }

  _setPet() async {
    await setPetRepository.setPet( modelPets!, picture!, context );
  }

}