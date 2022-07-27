import 'package:meus_animais/domain/functions/pets.dart';

class ModelPets {

  String id, userId, name, sex, specie, breed, picture, age, birth = "";
  String? createdAt, updatedAt;
  double weight = 0.0;

  dynamic context;

  ModelPets(
    this.id, this.userId, this.name, this.sex, this.specie, this.breed,
    this.picture, this.age, this.birth, this.weight, this.createdAt, this.updatedAt,
  );

  factory ModelPets.fromJson(dynamic json, context) {
    return ModelPets(
      json["id"],
      json["user_id"],
      json["name"],
      json["sex"],
      json["specie"],
      json["breed"],
      json["picture"],
      json["age"],
      PetsFunctions().calculateBirth(json["age"], context),
      json["weight"],
      json["created_at"],
      json["updated_at"],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": id,
      "user_id": userId,
      "name": name,
      "sex": sex,
      "specie": specie,
      "breed": breed,
      "picture": picture,
      "age": age,
      "weight": weight,
      "created_at": createdAt ?? DateTime.now().toString(),
      "updated_at": ( createdAt == null ) ? null : DateTime.now().toString(),
    };

    return map;
  }

  Map<String, dynamic> updateToMap() {
    Map<String, dynamic> map = {
      "picture": picture,
      "weight": weight,
      "updated_at": DateTime.now().toString(),
    };

    return map;
  }

  @override
  String toString() => name;

}