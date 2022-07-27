// imports nativos
import 'dart:io' show Platform;

// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/domain/models/life_time/life_time.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

abstract class LifeTimeRepository {
  getLifeTime();
}

@Injectable(as: LifeTimeRepository, env: ["firebase", "api", "test"])
class LifeTimeFirebase implements LifeTimeRepository {

  @override
  getLifeTime() async {

    String locale = "en_US";
    if ( Platform.localeName == "pt_BR" ) {
      locale = Platform.localeName;
    }
    final data = await db.collection("life_time").doc("languages").collection(locale).get();

    List<ModelLifeTime> list = [];
    for ( var item in data.docs ) {
      list.add(ModelLifeTime.fromJson(item));
    }

    return list;
  }
}