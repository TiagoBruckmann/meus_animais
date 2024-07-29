import 'package:equatable/equatable.dart';
import 'package:meus_animais/domain/entities/life_time.dart';

class LifeTimeModel extends LifeTimeEntity with EquatableMixin {

  LifeTimeModel( super.id, super.name, super.time );

  factory LifeTimeModel.fromJson(dynamic json) {
    return LifeTimeModel(
      json["id"],
      json["name"],
      json["time"],
    );
  }

}