class ModelHygienePets {

  String id, type, day, place = "";
  double value;

  ModelHygienePets( this.id, this.type, this.day, this.place, this.value );

  Map<String, dynamic> toMap( String petId ) {
    Map<String, dynamic> map = {
      "id": id,
      "pet_id": petId,
      "type": type,
      "day": day,
      "value": value,
    };

    return map;
  }

}