// import dos dominios
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/remote/routes/routes_api.dart';
import 'package:meus_animais/data/sources/remote/services/events.dart';
import 'package:meus_animais/domain/repositories/get_user.dart';
import 'package:meus_animais/domain/models/users/user.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserManager {

  GetUserManager(this.getUserRepository) {
    _getUser();
  }

  final GetUserRepository getUserRepository;

  ModelUser? modelUser;

  void setCredentials( ModelUser user ) {
    modelUser = ModelUser(user.id, user.name, user.email, picture: user.picture);
  }

  Widget infoAccountDialog( context ) {
    return Center(
      child: AlertDialog(
        title: Text(
          FlutterI18n.translate(context, "widgets.settings.info_account.title"),
          textAlign: TextAlign.center,
        ),
        content: Text(
          FlutterI18n.translate(context, "widgets.settings.info_account.description"),
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.all(16),
        actions: [
          TextButton(
            child: Text(
              FlutterI18n.translate(context, "widgets.pop_up.btn_no"),
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
            onPressed: () => Navigator.pop( context ),
          ),
          TextButton(
            child: Text(
              FlutterI18n.translate(context, "widgets.pop_up.btn_yes"),
              style: const TextStyle(
                color: Colors.green,
              ),
            ),
            onPressed: () {
              EventsApp().sendScreen("settings_info_account_apply");
              Navigator.pop( context );
              RoutesApi().sendInfoData( modelUser! );
            },
          ),
        ],
      ),
    );
  }

  _getUser() async {
    modelUser = await getUserRepository.getUser(modelUser);
    return modelUser!;
  }

}