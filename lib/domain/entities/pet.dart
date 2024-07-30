// import dos pacotes
import 'package:equatable/equatable.dart';

class PetEntity extends Equatable {

  final String id, userId, name, sex, specie, breed, picture, age, birth;
  final String? createdAt, updatedAt;
  final double weight;

  const PetEntity(
    this.id, this.userId, this.name, this.sex, this.specie, this.breed,
    this.picture, this.age, this.birth, this.weight, this.createdAt, this.updatedAt,
  );

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
  String toString() => "PetEntity($name, $specie, $sex, $age)";

  @override
  List<Object?> get props => [id, userId, name, sex, specie, breed, picture, age, birth, weight, createdAt, updatedAt];

}