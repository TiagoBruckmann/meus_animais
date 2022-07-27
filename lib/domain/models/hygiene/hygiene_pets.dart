class ModelHygienePets {

  String id, name, day, place, value, createdAt;
  String? petId = "";

  ModelHygienePets( this.id, this.name, this.day, this.place, this.value, this.createdAt, { this.petId } );

  factory ModelHygienePets.fromJson(dynamic json) {
    return ModelHygienePets(
      json["id"].toString(),
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