// import dos pacotes
import 'package:equatable/equatable.dart';

class HygieneEntity extends Equatable {

  final String id, name, day, place, value, createdAt;
  final String? petId;

  const HygieneEntity( this.id, this.name, this.day, this.place, this.value, this.createdAt, { this.petId } );

  Map<String, dynamic> toMap( String petId ) {
    Map<String, dynamic> map = {
      "id": id,
      "name": name,
      "place": place,
      "day": day,
      "value": value,
      "created_at": DateTime.now().toString(),
      "pet_id": petId,
    };

    return map;
  }

  @override
  String toString() => "HygieneEntity($name, $day, $place, $petId)";

  @override
  List<Object?> get props => [id, name, day, place, value, createdAt, petId];

}