// import dos sources
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/get_user.dart';
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

    List<ModelPets> listPets = [];

    if ( auth.currentUser != null ) {
      final data = await db.collection("pets")
          .where("user_id", isEqualTo: auth.currentUser!.uid)
          .get();

      for ( dynamic item in data.docs ) {
        listPets.add(ModelPets.fromJson(item));
      }
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
        "10/09/2020",
        "10/09/2020",
        2.5,
        DateTime.now().toString(),
        null,
      )
    ];
    return list;
  }
}