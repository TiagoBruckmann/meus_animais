// import dos pacotes
import 'package:onesignal_flutter/onesignal_flutter.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/manager/show_notification.dart';
import 'package:meus_animais/data/sources/local/injection/injection.dart';

class Notifications {

  String _debugLabelString = "";

  void initOneSignal() async {

    final showNotification = getIt.get<ShowNotificationManager>();
    // await OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    await OneSignal.shared.setAppId("44ace734-623b-4022-98e6-a6fb254aebce");

    OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      print('NOTIFICATION OPENED HANDLER CALLED WITH: $result');
      _debugLabelString = "Opened notification: \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      print("_debugLabelString 1 => $_debugLabelString");
    });

    OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
      if ( event.notification.rawPayload != null && showNotification.context != null ) {
        showNotification.notification = event.notification.rawPayload!;
        showNotification.setData();
      }
      event.complete(null);
    });

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

  }
}