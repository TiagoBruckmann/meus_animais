// import dos domain
import 'package:meus_animais/domain/repositories/auth_repo.dart';
import 'package:meus_animais/domain/failures/failures.dart';
import 'package:meus_animais/domain/entities/user.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

class AuthUseCase {
  final AuthRepo authRepo;
  AuthUseCase( this.authRepo );

  Future<Either<Failure, bool>> verifyConnection() async {
    return await authRepo.verifyConnection();
  }

  Future<Either<Failure, UserEntity>> register( Map<String, dynamic> json ) async {
    return await authRepo.register(json);
  }

  Future<Either<Failure, UserEntity>> login( Map<String, dynamic> json ) async {
    return await authRepo.login(json);
  }

  Future<Either<Failure, void>> forgotPassword( String email ) async {
    return await authRepo.forgotPassword(email);
  }

}