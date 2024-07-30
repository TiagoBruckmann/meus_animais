// import dos domain
import 'package:meus_animais/domain/repositories/auth_repo.dart';
import 'package:meus_animais/domain/failures/failures.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

class AuthUseCase {
  final AuthRepo authRepo;
  AuthUseCase( this.authRepo );

  Future<Either<Failure, bool>> verifyConnection() async {
    return await authRepo.verifyConnection();
  }

}