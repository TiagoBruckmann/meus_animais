// imports globais
import 'package:meus_animais/session.dart';

// import dos domain
import 'package:meus_animais/domain/repositories/service_repo.dart';
import 'package:meus_animais/domain/failures/failures.dart';
import 'package:meus_animais/domain/entities/service.dart';

// import dos data
import 'package:meus_animais/data/datasource/service_remote_datasource.dart';
import 'package:meus_animais/data/exceptions/exceptions.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

class ServiceRepoImpl implements ServiceRepo {
  final ServiceRemoteDatasource serviceRemoteDatasource;
  ServiceRepoImpl(this.serviceRemoteDatasource);

  @override
  Future<Either<Failure, List<ServiceEntity>>> getServices() async {
    try {
      final result = await serviceRemoteDatasource.getServices();
      return right(result);
    } on ServerExceptions catch (e) {
      Session.crash.onError("get_services_server_error", error: e.message);
      return left(ServerFailure(e.message));
    } catch (e) {
      Session.crash.onError("get_services_error", error: e);
      return left(GeneralFailure(e.toString()));
    }
  }

}