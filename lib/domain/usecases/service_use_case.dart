 // import dos domain
import 'package:meus_animais/domain/repositories/service_repo.dart';
import 'package:meus_animais/domain/failures/failures.dart';
import 'package:meus_animais/domain/entities/service.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

class ServiceUseCase {
  final ServiceRepo serviceRepo;
  ServiceUseCase(this.serviceRepo);

  Future<Either<Failure, List<ServiceEntity>>> getServices() async {
    return await serviceRepo.getServices();
  }

}