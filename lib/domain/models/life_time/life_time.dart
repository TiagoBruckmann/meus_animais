class ModelLifeTime {

  String id, name, time = "";

  ModelLifeTime( this.id, this.name, this.time );

  factory ModelLifeTime.fromJson(dynamic json) {
    return ModelLifeTime(
      json["id"],
      json["name"],
      json["time"],
    );
  }

  @override
  String toString() => name;
}