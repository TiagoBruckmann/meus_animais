class ModelHygiene {

  String id, name = "";

  ModelHygiene( this.id, this.name );

  factory ModelHygiene.fromJson(dynamic json) {
    return ModelHygiene(
      json["id"],
      json["name"],
    );
  }

  @override
  String toString() => name;

}