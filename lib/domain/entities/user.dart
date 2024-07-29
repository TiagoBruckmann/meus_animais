// import dos pacotes
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class UserEntity extends Equatable {

  final String id, name, email;
  final String? picture, createdAt, updatedAt;

  const UserEntity( this.id, this.name, this.email, { this.picture, this.createdAt, this.updatedAt } );

  factory UserEntity.empty() => const UserEntity("", "", "");

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": id,
      "name": name,
      "email": email,
      "picture": picture,
      "created_at": DateTime.now().toString(),
      "updated_at": ( createdAt == null ) ? null : DateTime.now().toString(),
    };

    return map;
  }

  Map<String, dynamic> updateToMap() {
    Map<String, dynamic> map = {
      "name": name,
      "picture": picture,
      "updated_at": DateTime.now().toString(),
    };

    return map;
  }

  Map<String, dynamic> deleteToMap() {
    String currantTime = DateFormat('yyyyMMddkkmmss').format(DateTime.now());
    Map<String, dynamic> map = {
      "id": id,
      "name": "deleted $currantTime",
      "email": "deleted@$currantTime.com",
      "picture": null,
    };

    return map;
  }

  @override
  String toString() => "UserEntity($id, $name, $email)";

  @override
  List<Object?> get props => [id, name, picture, email, createdAt, updatedAt];

}