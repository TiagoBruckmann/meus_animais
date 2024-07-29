// import dos pacotes
import 'package:equatable/equatable.dart';

class HygienePetEntity extends Equatable {

  final String id, name, day, place, value, createdAt;
  final String? petId;

  const HygienePetEntity( this.id, this.name, this.day, this.place, this.value, this.createdAt, { this.petId } );

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
  String toString() => "HygienePetEntity($name, $day, $place, $petId)";

  @override
  List<Object?> get props => [id, name, day, place, value, createdAt, petId];

}