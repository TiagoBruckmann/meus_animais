// import dos domain
import 'package:meus_animais/domain/entities/life_time.dart';

// import dos pacotes
import 'package:equatable/equatable.dart';

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