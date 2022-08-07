// pacotes nativos flutter
import 'package:flutter/material.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';

class NotifyPopUpWidget extends StatelessWidget {

  final String title;
  final String message;
  const NotifyPopUpWidget({ Key? key, required this.title, required this.message }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.all(16),
        actions: [
          TextButton(
            child: Text(
              // FlutterI18n.translate(context, "widgets.pop_up.btn_no"),
              "Ok",
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
            onPressed: () {
              Navigator.pop( context );
            },
          ),
          TextButton(
            child: Text(
              // FlutterI18n.translate(context, "widgets.pop_up.btn_yes"),
              "Obrigado, reaplicado",
              style: const TextStyle(
                color: Colors.green,
              ),
            ),
            onPressed: () {
              Navigator.pop( context );
            },
          ),
        ],
      ),
    );
  }
}
