// import dos sources
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/get_pets.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';

// import dos pacotes
import 'package:mobx/mobx.dart';
part 'pets.g.dart';

class PetsMobx extends _PetsMobx with _$PetsMobx{}

abstract class _PetsMobx with Store {

  final _petsManager = getIt.get<GetPetsManager>();

  ObservableList<ModelPets> listPets = ObservableList();

  @action
  Future<List<ModelPets>> getPets() async {
    Iterable<ModelPets> iterable = await _petsManager.getPets();
    listPets.clear();
    setPets(iterable);
    return listPets;
  }

  @action
  setPets( Iterable<ModelPets> iterable ) => listPets.addAll(iterable);

  @action
  refresh() async {
    await Future.delayed(const Duration(seconds: 1, milliseconds: 500));
    listPets.clear();
  }

  @action
  void clear() {
  }

}