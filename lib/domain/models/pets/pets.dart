class ModelPets {

  String id, userId, name, sex, specie, breed, picture, createdAt, updatedAt = "";
  double age, weight = 0.0;

  // dados da vacina
  String? vaccineId, vaccineName, vaccineType, vaccineDescription, vaccineDay, vaccineTypeTime, vaccineTime, vaccineLaboratory;
  bool? vaccineReapply;

  // dados de higiene
  String? hygieneId, hygieneType, hygieneDay, hygienePlace;
  double? hygieneValue;

  ModelPets(
    this.id, this.userId, this.name, this.sex, this.specie, this.breed, this.picture, this.age, this.weight, this.createdAt, this.updatedAt,
    {
      this.vaccineId, this.vaccineName, this.vaccineType, this.vaccineDescription, this.vaccineDay, this.vaccineTypeTime,
      this.vaccineTime, this.vaccineLaboratory, this.vaccineReapply, this.hygieneId, this.hygieneType, this.hygieneDay, this.hygienePlace,
      this.hygieneValue,
    }
  );

  ModelPets petsFromJson(Map<String, dynamic> json) {
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

  vaccinesFromJson(Map<String, dynamic> json) {
    Map modelVaccines = {
      vaccineId: json["id"],
      vaccineName: json["name"],
      vaccineType: json["type"],
      vaccineDescription: json["description"],
      vaccineDay: json["day"],
      vaccineTypeTime: json["type_time"],
      vaccineTime: json["time"],
      vaccineLaboratory: json["laboratory"],
      vaccineReapply: json["reapply"],
    };

    return modelVaccines;
  }

  hygienePets(Map<String, dynamic> json) {
    Map modelHygiene = {
      hygieneId: json["id"],
      hygieneType: json["type"],
      hygieneDay: json["day"],
      hygieneValue: json["value"],
      hygienePlace: json["place"],
    };

    return modelHygiene;
  }

  @override
  String toString() => name;

}