// import dos domain
import 'package:meus_animais/domain/entities/user.dart';

// import dos pacotes
import 'package:equatable/equatable.dart';

class UserModel extends UserEntity with EquatableMixin {

  UserModel( super.id, super.name, super.email, { super.picture, super.createdAt, super.updatedAt });

  factory UserModel.fromJson( dynamic json, { String? uid } ) {
    return UserModel(
      uid ?? json["id"],
      json["name"],
      json["email"],
      picture: json["picture"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }

}