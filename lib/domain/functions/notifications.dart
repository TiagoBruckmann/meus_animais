// import dos pacotes
import 'package:onesignal_flutter/onesignal_flutter.dart';

class Notifications {

  final bool _requireConsent = true;
  String _debugLabelString = "";

  void initOneSignal() async {

    // await OneSignal.shared.setLogLevel(OSLogLevel.debug, OSLogLevel.debug);

    await OneSignal.shared.setAppId("44ace734-623b-4022-98e6-a6fb254aebce");
    /*
    await OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setRequiresUserPrivacyConsent(_requireConsent);
     */

    OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      print('NOTIFICATION OPENED HANDLER CALLED WITH: $result');
      _debugLabelString = "Opened notification: \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      print("_debugLabelString 1 => $_debugLabelString");
    });

    OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
      print('FOREGROUND HANDLER CALLED WITH: $event');
      /// Display Notification, send null to not display
      /*
      showDialog(
        context: context,
        builder: (builder) {
          return const NotifyPopUpWidget(
            title: "Dia de revacinar",
            message: "Olá Tiago, chegou o dia de revacinar a Meg",
          );

        },
      );
      */
      event.complete(null);
      _debugLabelString = "Notification received in foreground notification: \n${event.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      print("_debugLabelString 2 => $_debugLabelString");
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

    // iOS-only method to open launch URLs in Safari when set to false
    // OneSignal.shared.setLaunchURLsInApp(false);

    bool requiresConsent = await OneSignal.shared.requiresUserPrivacyConsent();

    print("requiresConsent => $requiresConsent");

    OneSignal.shared.disablePush(false);

    bool userProvidedPrivacyConsent = await OneSignal.shared.userProvidedPrivacyConsent();
    print("USER PROVIDED PRIVACY CONSENT: $userProvidedPrivacyConsent");

    /*
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission => $accepted");
    });
    */
  }
}