// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/domain/models/life_time/life_time.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

abstract class LifeTimeRepository {
  getLifeTime();
}

@Injectable(as: LifeTimeRepository, env: ["firebase"])
class LifeTimeFirebase implements LifeTimeRepository {

  @override
  getLifeTime() async {

    final data = await db.collection("life_time").get();

    List<ModelLifeTime> list = [];
    for ( var item in data.docs ) {
      list.add(ModelLifeTime.fromJson(item));
    }

    return list;
  }
}

@Injectable(as: LifeTimeRepository, env: ["api"])
class LifeTimeApi implements LifeTimeRepository {

  @override
  getLifeTime() async {
    List<ModelLifeTime> list = [
      ModelLifeTime(
        "1",
        "Canina",
        "10 a 12 ano",
      ),
    ];

    return list;
  }
}