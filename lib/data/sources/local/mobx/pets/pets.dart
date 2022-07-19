// import dos sources
import 'package:meus_pets/data/sources/local/injection/injection.dart';
import 'package:meus_pets/data/sources/local/manager/get_pets.dart';
import 'package:meus_pets/data/sources/remote/services/services.dart';
import 'package:meus_pets/domain/models/pets/pets.dart';

// import dos pacotes
import 'package:mobx/mobx.dart';
part 'pets.g.dart';

class PetsMobx = _PetsMobx with _$PetsMobx;

abstract class _PetsMobx with Store {

  final _petsManager = getIt.get<GetPetsManager>();

  ObservableList<ModelPets> listPets = ObservableList();

  @action
  Future<List<ModelPets>> getPets( context ) async {
    analytics.logEvent(name: "get_pets-v1");
    _petsManager.context = context;
    Iterable<ModelPets> iterable = await _petsManager.getPets();
    listPets.clear();
    setPets(iterable);
    return listPets;
  }

  @action
  setPets( Iterable<ModelPets> iterable ) => listPets.addAll(iterable);

  @action
  refresh() async {
    analytics.logEvent(name: "refresh_pets-v1");
    await Future.delayed(Duration(seconds: 1, milliseconds: 500));
    listPets.clear();
  }

}