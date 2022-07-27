// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import dos modelos
import 'package:meus_animais/domain/models/hygiene/hygiene.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

abstract class GetHygieneRepository {
  getHygiene();
}

@Injectable(as: GetHygieneRepository, env: ["firebase"])
class GetHygieneFirebase implements GetHygieneRepository {
  @override
  getHygiene() async {

    final data = await db.collection("hygiene").get();

    List<ModelHygiene> listHygiene = [];
    for ( dynamic item in data.docs ) {
      listHygiene.add(ModelHygiene.fromJson(item));
    }

    return listHygiene;
  }
}

@Injectable(as: GetHygieneRepository, env: ["api"])
class GetHygieneApi implements GetHygieneRepository {
  @override
  Future<List<ModelHygiene>> getHygiene() async {
    List<ModelHygiene> list = [
      ModelHygiene(
        "5",
        "Banho e tosa",
      )
    ];
    return list;
  }
}

@Injectable(as: GetHygieneRepository, env: ["test"])
class GetHygieneTest implements GetHygieneRepository {
  @override
  Future<List<ModelHygiene>> getHygiene() async {
    List<ModelHygiene> list = [
      ModelHygiene(
        "5",
        "Banho e tosa",
      )
    ];
    return list;
  }
}