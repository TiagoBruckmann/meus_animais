// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import dos modelos
import 'package:meus_animais/domain/models/pets/pets.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';

abstract class GetVaccinesRepository {
  getVaccines();
}

@Injectable(as: GetVaccinesRepository, env: ["firebase"])
class GetPetsFirebase implements GetVaccinesRepository {
  @override
  getVaccines() async {

    final data = await db.collection("vaccines")
        .where("pet_id", isEqualTo: "35CKECXTI2EvXz4GSQBj")
        .get();

    List<ModelVaccines> listVaccines = [];
    for ( dynamic item in data.docs ) {
      listVaccines.add(ModelVaccines.fromJson(item));
    }

    return listVaccines;
  }
}

@Injectable(as: GetVaccinesRepository, env: ["api"])
class GetVaccinesApi implements GetVaccinesRepository {
  @override
  Future<List<ModelVaccines>> getVaccines() async {
    List<ModelVaccines> list = [
      ModelVaccines(
        "5",
        "Anti-cria",
        "castral",
        "Para não engravidar",
        "21/06/2022",
        true,
        "02/07/2022",
        typeTime: "mounth",
        time: 3,
        laboratory: "Sei la meo",
      )
    ];
    return list;
  }
}