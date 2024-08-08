import 'package:meus_animais/session.dart';

// import dos domain
import 'package:meus_animais/domain/entities/pet.dart';

// import dos pacotes
import 'package:equatable/equatable.dart';

class PetModel extends PetEntity with EquatableMixin {

  PetModel( super.id, super.userId, super.name, super.sex, super.specie, super.breed, super.picture, super.age, super.birth, super.death, super.weight, super.createdAt, super.updatedAt );

  factory PetModel.fromJson( dynamic json ) {
    return PetModel(
      json["id"],
      json["user_id"],
      json["name"],
      json["sex"],
      json["specie"],
      json["breed"],
      json["picture"],
      json["age"],
      json["age"].toString().contains("/") ? Session.sharedServices.calculateBirth(json["age"]) : json["age"],
      json["death"],
      json["weight"],
      json["created_at"],
      json["updated_at"],
    );
  }

}