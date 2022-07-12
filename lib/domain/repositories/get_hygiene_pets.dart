// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import dos modelos
import 'package:meus_animais/domain/models/hygiene/hygiene.dart';

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

    final data = await db.collection("hygiene_pets").where("pet_id", isEqualTo: petId).get();

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
        "20220712121117",
        "Banho",
        "12/07/2022",
        "Casa",
        "0.0",
        "2022-07-12 12:11:19.663752",
      )
    ];
    return list;
  }
}