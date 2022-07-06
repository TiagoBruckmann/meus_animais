class ModelHygienePets {

  String id, petId, name, day, place, value, createdAt;

  ModelHygienePets( this.id, this.petId, this.name, this.day, this.place, this.value, this.createdAt );

  factory ModelHygienePets.fromJson(dynamic json) {
    return ModelHygienePets(
      json["id"].toString(),
      json["pet_id"],
      json["name"],
      json["day"],
      json["place"],
      json["value"],
      json["created_at"],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": id,
      "pet_id": petId,
      "name": name,
      "place": place,
      "day": day,
      "value": value,
      "created_at": DateTime.now().toString(),
    };

    return map;
  }

  @override
  String toString() => name;

}