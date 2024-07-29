import 'package:equatable/equatable.dart';
import 'package:meus_animais/domain/entities/hygiene_pet.dart';

class HygienePetModel extends HygienePetEntity with EquatableMixin {

  HygienePetModel( super.id, super.name, super.day, super.place, super.value, super.createdAt );

  factory HygienePetModel.fromJson(dynamic json) {
    return HygienePetModel(
      json["id"].toString(),
      json["name"],
      json["day"],
      json["place"],
      json["value"],
      json["created_at"],
    );
  }

}