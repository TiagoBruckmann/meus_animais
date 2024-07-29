class ServerExceptions implements Exception {
  final String message;
  ServerExceptions( this.message );
}

class CacheExceptions implements Exception {
  final String message;
  CacheExceptions( this.message );
}

class WeekPasswordException implements Exception {
  final String message;
  WeekPasswordException( this.message );
}

class EmailUsedException implements Exception {
  final String message;
  EmailUsedException( this.message );
}

class InvalidEmailException implements Exception {
  final String message;
  InvalidEmailException( this.message );
}

class UserPwdNotFoundException implements Exception {
  final String message;
  UserPwdNotFoundException( this.message );
}

class UserNotFoundException implements Exception {
  final String message;
  UserNotFoundException( this.message );
}