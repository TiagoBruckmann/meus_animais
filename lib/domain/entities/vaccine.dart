// import dos pacotes
import 'package:equatable/equatable.dart';

class VaccineEntity extends Equatable {

  final String id, name, type, description, day, createdAt;
  final String? petId, typeTime, time, laboratory;
  final bool reapply;

  const VaccineEntity(
    this.id, this.name, this.type, this.description, this.day, this.reapply, this.createdAt,
    { this.petId, this.typeTime, this.time, this.laboratory }
  );

  Map<String, dynamic> toMap( String petId ) {
    Map<String, dynamic> map = {
      "id": id,
      "name": name,
      "type": type,
      "description": description,
      "day": day,
      "reapply": reapply,
      "created_at": DateTime.now().toString(),
      "type_time": typeTime,
      "time": time,
      "laboratory": laboratory,
      "pet_id": petId,
    };

    return map;
  }

  @override
  String toString() => "VaccineEntity($name, $type, $day, $typeTime)";

  @override
  List<Object?> get props => [id, name, type, description, day, createdAt, petId, typeTime, time, laboratory, reapply];

}