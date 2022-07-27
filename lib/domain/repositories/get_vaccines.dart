// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';

abstract class GetVaccinesRepository {
  getVaccines( String petId );
}

@Injectable(as: GetVaccinesRepository, env: ["firebase"])
class GetVaccinesFirebase implements GetVaccinesRepository {
  @override
  getVaccines( String petId ) async {

    final data = await db.collection("pets").doc(petId).collection("vaccines").get();

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
  Future<List<ModelVaccines>> getVaccines( String petId ) async {
    List<ModelVaccines> list = [
      ModelVaccines(
        "1",
        "anti cio",
        "Prevenção de gravidez",
        "",
        "21/06/2022",
        true,
        "2022-07-12 17:40:23.472719",
        petId: "1",
        time: "3",
        typeTime: "Mês/Meses",
      ),
    ];
    return list;
  }
}

@Injectable(as: GetVaccinesRepository, env: ["test"])
class GetVaccinesTest implements GetVaccinesRepository {
  @override
  Future<List<ModelVaccines>> getVaccines( String petId ) async {
    List<ModelVaccines> list = [
      ModelVaccines(
        "1",
        "anti cio",
        "Prevenção de gravidez",
        "",
        "21/06/2022",
        true,
        "2022-07-12 17:40:23.472719",
        petId: "1",
        time: "3",
        typeTime: "Mês/Meses",
      ),
    ];
    return list;
  }
}