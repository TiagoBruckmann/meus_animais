// import dos pacotes
import 'package:intl/intl.dart';

class ModelUser {

  String id, name, email = "";
  String? password, picture, createdAt, updatedAt;

  ModelUser( this.id, this.name, this.email, { this.password, this.picture, this.createdAt, this.updatedAt } );

  factory ModelUser.fromJson( dynamic json, { String? uid } ) {
    return ModelUser(
      uid ?? json["id"],
      json["name"],
      json["email"],
      picture: json["picture"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }

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
  String toString() => name;

}