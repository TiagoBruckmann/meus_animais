// imports nativos
import 'dart:convert';

// import dos pacotes
import 'package:onesignal_flutter/onesignal_flutter.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/manager/show_notification.dart';
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/data/sources/remote/credentials.dart';

class Notifications {

  void initOneSignal() async {

    final showNotification = getIt.get<ShowNotificationManager>();
    // await OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    await OneSignal.shared.setAppId(Credentials().onesignalAppId);

    OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) async {
      final custom = jsonDecode(result.notification.rawPayload!["custom"]);
      if ( custom["ti"] == Credentials().reapplyTemplateId ) {
        showNotification.notification = result.notification.rawPayload!;
        showNotification.setData();
      } else if ( custom["ti"] == Credentials().infoDataTemplateId ) {
        await Services().sendWppMessage(result.notification.rawPayload!["title"], result.notification.rawPayload!["alert"]);
      }
    });

    OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
      if ( event.notification.rawPayload != null && showNotification.context != null ) {
        final custom = jsonDecode(event.notification.rawPayload!["custom"]);
        if ( custom["ti"] == Credentials().reapplyTemplateId ) {
          showNotification.notification = event.notification.rawPayload!;
          showNotification.setData();
        }
      }
      event.complete(null);
    });

    /*
    OneSignal.shared.setInAppMessageClickedHandler((OSInAppMessageAction action) {
      _debugLabelString = "In App Message Clicked: \n${action.jsonRepresentation().replaceAll("\\n", "\n")}";
      print("_debugLabelString 3 => $_debugLabelString");
    });

    OneSignal.shared.setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      print("SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}");
    });

    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      print("PERMISSION STATE CHANGED: ${changes.jsonRepresentation()}");
    });

    OneSignal.shared.setOnWillDisplayInAppMessageHandler((message) {
      print("ON WILL DISPLAY IN APP MESSAGE ${message.messageId}");
    });

    OneSignal.shared.setOnDidDisplayInAppMessageHandler((message) {
      print("ON DID DISPLAY IN APP MESSAGE ${message.messageId}");
    });

    OneSignal.shared.setOnWillDismissInAppMessageHandler((message) {
      print("ON WILL DISMISS IN APP MESSAGE ${message.messageId}");
    });

    OneSignal.shared.setOnDidDismissInAppMessageHandler((message) {
      print("ON DID DISMISS IN APP MESSAGE ${message.messageId}");
    });
    */

  }
}