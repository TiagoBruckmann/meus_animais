// import dos pacotes
import 'package:dartz/dartz.dart';

// import dos domain
import 'package:meus_animais/domain/failures/failures.dart';
import 'package:meus_animais/domain/entities/user.dart';

abstract class UserRepo {
  Future<Either<Failure, UserEntity>> getUserData();
  Future<Either<Failure, void>> logOut();
  Future<Either<Failure, void>> deleteAccount( Map<String, dynamic> json );
}