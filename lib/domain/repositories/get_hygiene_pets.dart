// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';
import 'package:meus_animais/domain/models/hygiene/hygiene_pets.dart';

abstract class GetHygienePetsRepository {
  getHygienePet( String petId );
}

@Injectable(as: GetHygienePetsRepository, env: ["firebase"])
class GetHygienePetsFirebase implements GetHygienePetsRepository {
  @override
  getHygienePet( String petId ) async {

    final data = await db.collection("pets").doc(petId).collection("hygiene").get();

    List<ModelHygienePets> listHygiene = [];
    for ( dynamic item in data.docs ) {
      listHygiene.add(ModelHygienePets.fromJson(item));
    }

    return listHygiene;
  }
}

@Injectable(as: GetHygienePetsRepository, env: ["api"])
class GetHygienePetsApi implements GetHygienePetsRepository {
  @override
  Future<List<ModelHygienePets>> getHygienePet( String petId ) async {
    List<ModelHygienePets> list = [
      ModelHygienePets(
        "Ae1gtINI3U6QFfsfDdtd",
        "Banho",
        "12/07/2022",
        "Casa",
        "0.0",
        "2022-07-12 12:11:19.663752",
        petId: "2",
      )
    ];
    return list;
  }
}

@Injectable(as: GetHygienePetsRepository, env: ["test"])
class GetHygienePetsTest implements GetHygienePetsRepository {
  @override
  Future<List<ModelHygienePets>> getHygienePet( String petId ) async {
    List<ModelHygienePets> list = [
      ModelHygienePets(
        "Ae1gtINI3U6QFfsfDdtd",
        "Banho",
        "12/07/2022",
        "Casa",
        "0.0",
        "2022-07-12 12:11:19.663752",
        petId: "2",
      ),
    ];
    return list;
  }
}