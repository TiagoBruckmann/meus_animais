// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import dos modelos
import 'package:meus_animais/domain/models/pets/pets.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

abstract class GetPetsRepository {
  getPets();
}

@Injectable(as: GetPetsRepository, env: ["firebase"])
class GetPetsFirebase implements GetPetsRepository {
  @override
  getPets() async {

    final data = await db.collection("pets")
        .where("user_id", isEqualTo: "zGLlSDFk0MO4X2dWl8D3FNt2UyU2")
        .get();

    List<ModelPets> listPets = [];
    for ( dynamic item in data.docs ) {
      listPets.add(ModelPets.fromJson(item));
    }
    return listPets;
  }
}

@Injectable(as: GetPetsRepository, env: ["api"])
class GetPetsApi implements GetPetsRepository {
  @override
  getPets() async {
    List<ModelPets> list = [
      ModelPets(
        "5",
        "zGLlSDFk0MO4X2dWl8D3FNt2UyU2",
        "Meguilaine",
        "female",
        "Felina",
        "Comum",
        "https://www.petz.com.br/blog/wp-content/uploads/2021/11/enxoval-para-gato-Copia.jpg",
        "1 Ano 7 meses e la vai pedrada",
        2.5,
        DateTime.now().toString(),
        null,
      )
    ];
    return list;
  }
}