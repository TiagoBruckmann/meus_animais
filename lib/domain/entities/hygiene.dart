// import dos pacotes
import 'package:equatable/equatable.dart';

class HygieneEntity extends Equatable {

  final String id, name;

  const HygieneEntity( this.id, this.name );

  @override
  String toString() => "HygieneEntity($id - $name)";

  @override
  List<Object?> get props => [id, name];

}