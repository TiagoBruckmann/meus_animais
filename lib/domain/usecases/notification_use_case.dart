// import dos domain
import 'package:meus_animais/domain/repositories/notification_repo.dart';
import 'package:meus_animais/domain/failures/failures.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

class NotificationUseCase {
  final NotificationRepo notificationRepo;
  NotificationUseCase(this.notificationRepo);

  Future<Either<Failure, void>> sendNotifyReapplyVaccine( Map<String, dynamic> json ) async {
    return await notificationRepo.sendNotifyReapplyVaccine(json);
  }

}