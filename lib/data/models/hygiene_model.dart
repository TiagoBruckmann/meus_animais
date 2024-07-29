import 'package:equatable/equatable.dart';
import 'package:meus_animais/domain/entities/hygiene.dart';

class HygieneModel extends HygieneEntity with EquatableMixin {

  HygieneModel( super.id, super.name );

  factory HygieneModel.fromJson(dynamic json) {
    return HygieneModel(
      json["id"],
      json["name"],
    );
  }

}