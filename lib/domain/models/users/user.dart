class ModelUser {

  String id, name, email, password = "";
  String? picture;

  ModelUser( this.id, this.name, this.email, this.password, { this.picture } );

  factory ModelUser.fromJson( dynamic json, { String? uid } ) {
    return ModelUser(
      uid?? json["id"],
      json["name"],
      json["email"],
      json["password"],
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

  @override
  String toString() => name;

}