// import dos pacotes
import 'package:equatable/equatable.dart';

abstract class Failure {
  final String message = "";
}

class ServerFailure extends Failure with EquatableMixin {
  final String errorMessage;
  ServerFailure( this.errorMessage );

  @override
  List<Object?> get props => [errorMessage];

}

class CacheFailure extends Failure with EquatableMixin {
  final String errorMessage;
  CacheFailure( this.errorMessage );

  @override
  List<Object?> get props => [errorMessage];
}

class WeekPasswordFailure extends Failure with EquatableMixin {
  final String errorMessage;
  WeekPasswordFailure( this.errorMessage );

  @override
  List<Object?> get props => [errorMessage];
}

class UsedEmailFailure extends Failure with EquatableMixin {
  final String errorMessage;
  UsedEmailFailure( this.errorMessage );

  @override
  List<Object?> get props => [errorMessage];
}

class InvalidEmailFailure extends Failure with EquatableMixin {
  final String errorMessage;
  InvalidEmailFailure( this.errorMessage );

  @override
  List<Object?> get props => [errorMessage];
}

class UserPwdNotFoundFailure extends Failure with EquatableMixin {
  final String errorMessage;
  UserPwdNotFoundFailure( this.errorMessage );

  @override
  List<Object?> get props => [errorMessage];
}

class UserNotFoundFailure extends Failure with EquatableMixin {
  final String errorMessage;
  UserNotFoundFailure( this.errorMessage );

  @override
  List<Object?> get props => [errorMessage];
}

class SensitiveAccessFailure extends Failure with EquatableMixin {
  final String errorMessage;
  SensitiveAccessFailure( this.errorMessage );

  @override
  List<Object?> get props => [errorMessage];
}

class PermissionDeniedFailure extends Failure with EquatableMixin {
  final String errorMessage;
  PermissionDeniedFailure( this.errorMessage );

  @override
  List<Object?> get props => [errorMessage];
}

class GeneralFailure extends Failure with EquatableMixin {
  final String errorMessage;
  GeneralFailure( this.errorMessage );

  @override
  List<Object?> get props => [errorMessage];
}