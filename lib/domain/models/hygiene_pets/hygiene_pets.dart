class ModelHygienePets {

  String id, name, day, place, createdAt;
  double value;

  ModelHygienePets( this.id, this.name, this.day, this.place, this.value, this.createdAt );

  factory ModelHygienePets.hygienePets(Map<String, dynamic> json) {
    return ModelHygienePets(
      json["id"],
      json["name"],
      json["day"],
      json["place"],
      json["value"],
      json["created_at"],
    );
  }

  Map<String, dynamic> toMap( String petId ) {
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