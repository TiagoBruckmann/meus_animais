// import dos domain
import 'package:meus_animais/domain/entities/service.dart';

// import dos pacotes
import 'package:equatable/equatable.dart';

class ServiceModel extends ServiceEntity with EquatableMixin {

  ServiceModel( super.id, super.name );

  factory ServiceModel.fromJson(dynamic json) {
    return ServiceModel(
      json["id"],
      json["name"],
    );
  }

}