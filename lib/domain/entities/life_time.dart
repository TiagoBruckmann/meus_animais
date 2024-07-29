// import dos pacotes
import 'package:equatable/equatable.dart';

class LifeTimeEntity extends Equatable {

  final String id, name, time;

  const LifeTimeEntity( this.id, this.name, this.time );

  @override
  String toString() => "LifeTimeEntity($name, $time)";

  @override
  List<Object?> get props => [id, name, time];

}