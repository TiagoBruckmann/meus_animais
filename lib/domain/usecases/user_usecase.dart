// import dos domain
import 'package:meus_animais/domain/repositories/user_repo.dart';
import 'package:meus_animais/domain/failures/failures.dart';
import 'package:meus_animais/domain/entities/user.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

class UserUseCase {
  final UserRepo userRepo;
  UserUseCase(this.userRepo);

  Future<Either<Failure, UserEntity>> getUserData() async {
    return await userRepo.getUserData();
  }

  Future<Either<Failure, void>> logOut() async {
    return await userRepo.logOut();
  }

  Future<Either<Failure, void>> deleteAccount( Map<String, dynamic> json ) async {
    return await userRepo.deleteAccount( json );
  }

}