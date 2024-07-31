// import dos pacotes
import 'package:equatable/equatable.dart';

class ServiceEntity extends Equatable {

  final String id, name;

  const ServiceEntity( this.id, this.name );

  @override
  String toString() => "ServiceEntity($id - $name)";

  @override
  List<Object?> get props => [id, name];

}