// import dos pacotes
import 'package:intl/intl.dart';

class ModelUser {

  String id, name, email = "";
  String? password, picture;

  ModelUser( this.id, this.name, this.email, { this.password, this.picture } );

  factory ModelUser.fromJson( dynamic json, { String? uid } ) {
    return ModelUser(
      uid ?? json["id"],
      json["name"],
      json["email"],
      picture: json["picture"],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": id,
      "name": name,
      "email": email,
      "picture": picture,
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