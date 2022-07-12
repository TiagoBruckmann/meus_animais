// import dos dominios
import 'package:meus_animais/domain/models/hygiene/hygiene.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';
import 'package:meus_animais/domain/repositories/get_hygiene.dart';

@lazySingleton
class GetHygieneManager {

  GetHygieneManager(this.getHygieneRepository) {
    getHygiene();
  }

  final GetHygieneRepository getHygieneRepository;

  List<ModelHygiene> listHygiene = [];
  String petId = "";

  getHygiene() async {
    Iterable<ModelHygiene> iterable = await getHygieneRepository.getHygiene();
    return listHygiene.addAll(iterable);
  }

}