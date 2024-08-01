// imports globais
import 'package:meus_animais/session.dart';

// import dos domain
import 'package:meus_animais/domain/repositories/notification_repo.dart';
import 'package:meus_animais/domain/failures/failures.dart';

// import dos data
import 'package:meus_animais/data/datasource/notification_remote_datasource.dart';
import 'package:meus_animais/data/exceptions/exceptions.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

class NotificationRepoImpl implements NotificationRepo {
  final NotificationRemoteDatasource notificationRemoteDatasource;
  NotificationRepoImpl(this.notificationRemoteDatasource);

  @override
  Future<Either<Failure, void>> sendNotifyReapplyVaccine( Map<String, dynamic> json ) async {
    try {
      final result = await notificationRemoteDatasource.sendNotifyReapplyVaccine( json );
      return right(result);
    } on ServerExceptions catch (e) {
      Session.crash.onError("send_notification_reapply_vaccine_server_error", error: e.message);
      return left(ServerFailure(e.message));
    } catch (e) {
      Session.crash.onError("send_notification_reapply_vaccine_error", error: e);
      return left(GeneralFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> requestInfoData() async {
    try {
      final result = await notificationRemoteDatasource.requestInfoData();
      return right(result);
    } on ServerExceptions catch (e) {
      Session.crash.onError("request_info_data_server_error", error: e.message);
      return left(ServerFailure(e.message));
    } catch (e) {
      Session.crash.onError("request_info_data_error", error: e);
      return left(GeneralFailure(e.toString()));
    }
  }

}