// import dos pacotes
import 'package:equatable/equatable.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure with EquatableMixin {
  final String errorMessage;
  ServerFailure( this.errorMessage ) : super(errorMessage);

  @override
  List<Object?> get props => [errorMessage];

}

class CacheFailure extends Failure with EquatableMixin {
  final String errorMessage;
  CacheFailure( this.errorMessage ) : super(errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class WeekPasswordFailure extends Failure with EquatableMixin {
  final String errorMessage;
  WeekPasswordFailure( this.errorMessage ) : super(errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class UsedEmailFailure extends Failure with EquatableMixin {
  final String errorMessage;
  UsedEmailFailure( this.errorMessage ) : super(errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class InvalidEmailFailure extends Failure with EquatableMixin {
  final String errorMessage;
  InvalidEmailFailure( this.errorMessage ) : super(errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class InvalidCredentialFailure extends Failure with EquatableMixin {
  final String errorMessage;
  InvalidCredentialFailure( this.errorMessage ) : super(errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class UserPwdNotFoundFailure extends Failure with EquatableMixin {
  final String errorMessage;
  UserPwdNotFoundFailure( this.errorMessage ) : super(errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class UserNotFoundFailure extends Failure with EquatableMixin {
  final String errorMessage;
  UserNotFoundFailure( this.errorMessage ) : super(errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class SensitiveAccessFailure extends Failure with EquatableMixin {
  final String errorMessage;
  SensitiveAccessFailure( this.errorMessage ) : super(errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class PermissionDeniedFailure extends Failure with EquatableMixin {
  final String errorMessage;
  PermissionDeniedFailure( this.errorMessage ) : super(errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class GeneralFailure extends Failure with EquatableMixin {
  final String errorMessage;
  GeneralFailure( this.errorMessage ) : super(errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}