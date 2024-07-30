// imports globais
import 'package:meus_animais/session.dart';

// import dos domain
import 'package:meus_animais/domain/repositories/auth_repo.dart';
import 'package:meus_animais/domain/failures/failures.dart';

// import dos data
import 'package:meus_animais/data/datasource/auth_remote_datasource.dart';
import 'package:meus_animais/data/exceptions/exceptions.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDatasource authRemoteDatasource;
  AuthRepoImpl(this.authRemoteDatasource);

  @override
  Future<Either<Failure, bool>> verifyConnection() async {
    try {
      final result = await authRemoteDatasource.verifyConnection();
      return right(result);
    } on ServerExceptions catch (e) {
      Session.crash.onError("verify_connection_server_error", error: e.message);
      return left(ServerFailure(e.message));
    } catch (e) {
      Session.crash.onError("verify_connection_error", error: e);
      return left(GeneralFailure(e.toString()));
    }
  }

}