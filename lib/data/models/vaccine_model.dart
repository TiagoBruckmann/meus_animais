// import dos domain
import 'package:meus_animais/domain/entities/vaccine.dart';

// import dos pacotes
import 'package:equatable/equatable.dart';

class VaccineModel extends VaccineEntity with EquatableMixin {

  VaccineModel( super.id, super.name, super.type, super.description, super.day, super.reapply, super.createdAt, { super.petId, super.typeTime, super.time, super.laboratory });

  factory VaccineModel.fromJson(dynamic json, String petId) {
    return VaccineModel(
      json["id"].toString(),
      json["name"],
      json["type"],
      json["description"],
      json["day"],
      json["reapply"],
      json["created_at"],
      typeTime: json["type_time"],
      time: json["time"],
      laboratory: json["laboratory"],
      petId: petId,
    );
  }

}