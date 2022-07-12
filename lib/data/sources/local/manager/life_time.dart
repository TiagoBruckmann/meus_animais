// import dos dominios
import 'package:meus_animais/domain/models/life_time/life_time.dart';
import 'package:meus_animais/domain/repositories/life_time.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

@lazySingleton
class LifeTimeManager {

  LifeTimeManager(this.lifeTimeRepository) {
    getData();
  }

  final LifeTimeRepository lifeTimeRepository;

  List<ModelLifeTime> list = [];

  Future<List<ModelLifeTime>> getData() async {
    Iterable<ModelLifeTime> iterable = await lifeTimeRepository.getLifeTime();
    list.addAll(iterable);
    return list;
  }

}