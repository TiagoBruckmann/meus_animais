// imports globais
import 'package:meus_animais/session.dart';

// import dos domain
import 'package:meus_animais/domain/repositories/user_repo.dart';
import 'package:meus_animais/domain/failures/failures.dart';
import 'package:meus_animais/domain/entities/user.dart';

// import dos data
import 'package:meus_animais/data/datasource/user_remote_datasource.dart';
import 'package:meus_animais/data/exceptions/exceptions.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

class UserRepoImpl implements UserRepo {
  final UserRemoteDatasource userRemoteDatasource;
  UserRepoImpl(this.userRemoteDatasource);

  @override
  Future<Either<Failure, UserEntity>> getUserData() async {
    try {
      final result = await userRemoteDatasource.getUserData();
      return right(result);
    } on ServerExceptions catch (e) {
      Session.crash.onError("get_user_data_server_error", error: e.message);
      return left(ServerFailure(e.message));
    } catch (e) {
      Session.crash.onError("get_user_error", error: e);
      return left(GeneralFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      final result = await userRemoteDatasource.logOut();
      return right(result);
    } on ServerExceptions catch (e) {
      Session.crash.onError("logout_server_error", error: e.message);
      return left(ServerFailure(e.message));
    } catch (e) {
      Session.crash.onError("log_out_error", error: e);
      return left(GeneralFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendEmailDeleteAccount( Map<String, dynamic> json ) async {
    try {
      await userRemoteDatasource.sendEmailDeleteAccount( json );
      await _deleteAccount();
      return right(null);
    } on ServerExceptions catch (e) {
      Session.crash.onError("send_email_delete_account_server_error", error: e.message);
      return left(ServerFailure(e.message));
    } on SensitiveAccessException catch (e) {
      Session.crash.onError("send_email_delete_account_sensitive_access", error: e.message);
      return left(SensitiveAccessFailure(e.message));
    } on PermissionDeniedException catch (e) {
      Session.crash.onError("send_email_delete_account_permission_denied", error: e.message);
      return left(PermissionDeniedFailure(e.message));
    } catch (e) {

      if ( e is SensitiveAccessException ) {
        Session.crash.onError("send_email_delete_account_sensitive_access", error: e.message);
        return left(SensitiveAccessFailure(e.message));
      }

      Session.crash.onError("send_email_delete_account_error", error: e);
      return left(GeneralFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> _deleteAccount() async {
    try {
      final result = await userRemoteDatasource.deleteAccount();
      return right(result);
    } on ServerExceptions catch (e) {
      Session.crash.onError("delete_account_server_error", error: e.message);
      return left(ServerFailure(e.message));
    } on SensitiveAccessException catch (e) {
      Session.crash.onError("delete_account_sensitive_access", error: e.message);
      return left(SensitiveAccessFailure(e.message));
    } catch (e) {

      if ( e is SensitiveAccessException ) {
        Session.crash.onError("delete_account_sensitive_access", error: e.message);
        return left(SensitiveAccessFailure(e.message));
      }

      Session.crash.onError("delete_account_error", error: e);
      return left(GeneralFailure(e.toString()));
    }
  }

}