// imports globais
import 'package:flutter/material.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import das telas
import 'package:meus_animais/app/core/style/pop_up_notification.dart';

// import dos domain

// import dos pacotes
import 'package:onesignal_flutter/onesignal_flutter.dart';

enum ActionBtnIdEnum {
  btnOk("btn_ok"),
  btnYes("btn_yes");

  const ActionBtnIdEnum(this.value);
  final String value;
}

class NotificationsServices {

  static bool _isNotificationOpened = false;

  Future<void> init() async {
    // OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.initialize(Session.env.onesignalAppId);
    await OneSignal.Notifications.requestPermission(true);
  }

  Future<void> login( String userId ) async {
    Session.logs.successLog("notification_login => $userId");
    return await OneSignal.login(userId);
  }

  Future<void> logout() async {
    Session.logs.successLog("notification_logOut");
    return await OneSignal.logout();
  }

  String? getPlayerId() {
    final playerId = OneSignal.User.pushSubscription.id;
    Session.logs.successLog("Onesignal PlayerId => $playerId");
    return playerId;
  }

  void receiveNotification() {
    _foreground();
    _closedApp();
  }

  static void _foreground() {
    OneSignal.Notifications.addForegroundWillDisplayListener((event) => _showDialog(event.notification));
  }

  static void _closedApp() {
    OneSignal.Notifications.addClickListener((event) => _showDialog(event.notification));
  }

  static Future<void> _showDialog( OSNotification notification ) async {

    Session.logs.successLog("_showDialog => ${notification.additionalData}");

    if ( _isNotificationOpened ) return;

    _isNotificationOpened = true;

    String templateId = "";
    if ( notification.additionalData != null && notification.additionalData!.containsKey("template_id") ) {
      templateId = notification.additionalData!["template_id"];
    }

    String leftText = "OK";
    String rightText = "";
    if ( notification.buttons != null ) {
      for ( final item in notification.buttons! ) {
        if ( item.id.compareTo(ActionBtnIdEnum.btnOk.value) == 0 && leftText == "OK" ) {
          leftText = item.text;
        }
        rightText = item.text;
      }
    }

    await showDialog(
      context: Session.globalContext.currentContext!,
      builder: ( builder ) {

        return PopUpNotification(
          title: notification.title ?? "",
          content: notification.body ?? "",
          leftButton: leftText,
          rightButton: rightText,
          function: () async {

            if ( templateId.trim().isEmpty ) return;

          },
        );

      },
    );

    _isNotificationOpened = false;
  }

}