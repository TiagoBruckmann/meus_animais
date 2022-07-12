// import dos pacotes
import 'package:injectable/injectable.dart';

// import dos dominios
import 'package:meus_animais/domain/repositories/get_hygiene_pets.dart';
import 'package:meus_animais/domain/models/hygiene/hygiene_pets.dart';

@lazySingleton
class GetHygienePetsManager {

  GetHygienePetsManager(this.getHygienePetsRepository) {
    getHygiene();
  }

  final GetHygienePetsRepository getHygienePetsRepository;

  List<ModelHygienePets> listHygiene = [];
  String petId = "";

  getHygiene() async {
    if ( petId.trim().isNotEmpty ) {
      listHygiene.clear();
      Iterable<ModelHygienePets> iterable = await getHygienePetsRepository.getHygienePet( petId );
      listHygiene.addAll(iterable);
    }
    return listHygiene;
  }

}