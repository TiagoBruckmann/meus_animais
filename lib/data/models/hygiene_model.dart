// import dos domain
import 'package:meus_animais/domain/entities/hygiene.dart';

// import dos pacotes
import 'package:equatable/equatable.dart';

class HygieneModel extends HygieneEntity with EquatableMixin {

  HygieneModel( super.id, super.name, super.day, super.place, super.value, super.createdAt, { super.petId } );

  factory HygieneModel.fromJson(dynamic json) {
    return HygieneModel(
      json["id"].toString(),
      json["name"],
      json["day"],
      json["place"],
      json["value"],
      json["created_at"],
      petId: json["pet_id"],
    );
  }

}