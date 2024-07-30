// import dos pacotes
import 'package:dartz/dartz.dart';

// import dos domain
import 'package:meus_animais/domain/failures/failures.dart';
import 'package:meus_animais/domain/entities/user.dart';

abstract class AuthRepo {
  Future<Either<Failure, bool>> verifyConnection();
}