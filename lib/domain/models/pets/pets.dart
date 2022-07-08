class ModelPets {

  String id, userId, name, sex, specie, breed, picture, age = "";
  String? createdAt, updatedAt;
  double? weight = 0.0;

  dynamic context;

  ModelPets(
    this.id, this.userId, this.name, this.sex, this.specie, this.breed,
    this.picture, this.age, this.weight, this.createdAt, this.updatedAt
  );

  factory ModelPets.fromJson(dynamic json) {
    return ModelPets(
      json["id"],
      json["user_id"],
      json["name"],
      json["sex"],
      json["specie"],
      json["breed"],
      json["picture"],
      json["age"],
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

  @override
  String toString() => name;

}