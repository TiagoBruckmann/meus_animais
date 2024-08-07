// imports globais
import 'package:meus_animais/session.dart';

// import dos domain
import 'package:meus_animais/domain/repositories/auth_repo.dart';
import 'package:meus_animais/domain/failures/failures.dart';
import 'package:meus_animais/domain/entities/user.dart';

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

  @override
  Future<Either<Failure, UserEntity>> register( Map<String, dynamic> params ) async {
    try {
      final result = await authRemoteDatasource.register(params);
      return right(result);
    }  on WeekPasswordException catch (e) {
      Session.crash.onError("register_week_password", error: e.message);
      return left(WeekPasswordFailure(e.message));
    } on EmailUsedException catch (e) {
      Session.crash.onError("register_used_email", error: e.message);
      return left(UsedEmailFailure(e.message));
    } on InvalidEmailException catch (e) {
      Session.crash.onError("register_invalid_email", error: e.message);
      return left(InvalidEmailFailure(e.message));
    } on UserPwdNotFoundException catch (e) {
      Session.crash.onError("register_user_pwd_not_found", error: e.message);
      return left(UserPwdNotFoundFailure(e.message));
    } on ServerExceptions catch (e) {
      Session.crash.onError("register_server_error", error: e.message);
      return left(ServerFailure(e.message));
    } catch (e) {
      Session.crash.onError("register_error", error: e);
      return left(GeneralFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login( Map<String, dynamic> params ) async {
    try {
      final result = await authRemoteDatasource.login(params);
      return right(result);
    }  on WeekPasswordException catch (e) {
      Session.crash.onError("login_week_password", error: e.message);
      return left(WeekPasswordFailure(e.message));
    } on EmailUsedException catch (e) {
      Session.crash.onError("login_used_email", error: e.message);
      return left(UsedEmailFailure(e.message));
    } on InvalidEmailException catch (e) {
      Session.crash.onError("login_invalid_email", error: e.message);
      return left(InvalidEmailFailure(e.message));
    } on UserPwdNotFoundException catch (e) {
      Session.crash.onError("login_user_pwd_not_found", error: e.message);
      return left(UserPwdNotFoundFailure(e.message));
    } on UserNotFoundException catch (e) {
      Session.crash.onError("login_user_not_found", error: e.message);
      return left(UserNotFoundFailure(e.message));
    } on InvalidCredentialException catch (e) {
      Session.crash.onError("login_invalid_credential", error: e.message);
      return left(InvalidCredentialFailure(e.message));
    } on ServerExceptions catch (e) {
      Session.crash.onError("login_server_error", error: e.message);
      return left(ServerFailure(e.message));
    } catch (e) {
      Session.crash.onError("login_error", error: e);
      return left(GeneralFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword( String email ) async {
    try {
      final result = await authRemoteDatasource.forgotPassword(email);
      return right(result);
    } on ServerExceptions catch (e) {
      Session.crash.onError("forgot_password_server_error", error: e.message);
      return left(ServerFailure(e.message));
    } catch (e) {
      Session.crash.onError("forgot_pwd_error", error: e);
      return left(GeneralFailure(e.toString()));
    }
  }

}