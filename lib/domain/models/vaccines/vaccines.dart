class ModelVaccines {

  // dados da vacina
  String id, name, type, description, day, createdAt = "";
  String? typeTime, laboratory = "";
  int? time;
  bool reapply = true;

  ModelVaccines(
    this.id, this.name, this.type, this.description, this.day, this.reapply, this.createdAt,
    {
      this.typeTime, this.time, this.laboratory,
    }
  );

  factory ModelVaccines.fromJson(Map<String, dynamic> json) {
    return ModelVaccines(
      json["id"],
      json["name"],
      json["type"],
      json["description"],
      json["day"],
      json["reapply"],
      json["created_at"],
      typeTime: json["type_time"],
      time: json["time"],
      laboratory: json["laboratory"],
    );
  }

  Map<String, dynamic> toMap( String petId ) {
    Map<String, dynamic> map = {
      "id": id,
      "pet_id": petId,
      "name": name,
      "type": type,
      "description": description,
      "day": day,
      "reapply": reapply,
      "created_at": DateTime.now().toString(),
      "type_time": typeTime,
      "time": time,
      "laboratory": laboratory,
    };

    return map;
  }

  @override
  String toString() => name;

}