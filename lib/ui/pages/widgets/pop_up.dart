// pacotes nativos flutter
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/destroy.dart';
import 'package:meus_animais/data/sources/local/manager/logout.dart';

class PopUpWidget extends StatelessWidget {

  final String type;
  final String title;
  final String text;
  const PopUpWidget({ Key? key, required this.type, required this.title, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        content: Text(
          text,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.all(16),
        actions: [
          TextButton(
            child: Text(
              FlutterI18n.translate(context, "widgets.pop_up.btn_no"),
              style: const TextStyle(
                color: Colors.green,
              ),
            ),
            onPressed: () {
              Navigator.pop( context );
            },
          ),
          TextButton(
            child: Text(
              FlutterI18n.translate(context, "widgets.pop_up.btn_yes"),
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
            onPressed: () {
              switch ( type ) {
                case "Destroy":
                  getIt.get<DestroyManager>();
                  break;
                case "Logout":
                  final logout = getIt.get<LogoutManager>();
                  logout.context = context;
                  logout.disconnect();
                  break;
              }
              Navigator.pop( context );
            },
          ),
        ],
      ),
    );
  }
}
