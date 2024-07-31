// import dos domain
import 'package:meus_animais/domain/failures/failures.dart';
import 'package:meus_animais/domain/entities/service.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

abstract class ServiceRepo {
  Future<Either<Failure, List<ServiceEntity>>> getServices();
}