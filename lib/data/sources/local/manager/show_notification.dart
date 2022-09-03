// imports nativos
import 'package:flutter/cupertino.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/events.dart';

// import dos domain
import 'package:meus_animais/domain/repositories/show_notifications.dart';

@lazySingleton
class ShowNotificationManager {

  ShowNotificationManager(this.showNotificationRepository) {
    setData();
  }

  final ShowNotificationRepository showNotificationRepository;
  Map<String, dynamic>? notification;
  BuildContext? context;

  setData() {
    if ( notification != null && context != null ) {
      _showNotification();
    }
  }

  _showNotification() async {
    EventsApp().sharedEvent("show_notification");
    showNotificationRepository.setNotification(notification!, context!);
  }

}