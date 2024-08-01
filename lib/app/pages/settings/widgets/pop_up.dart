// pacotes nativos flutter
import 'package:flutter/material.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';

class PopUpWidget extends StatelessWidget {
  final String title;
  final String text;
  final Function function;
  const PopUpWidget({ super.key, required this.title, required this.text, required this.function });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Center(
      child: AlertDialog(
        title: Text(
          FlutterI18n.translate(context, title),
          textAlign: TextAlign.center,
        ),
        content: Text(
          FlutterI18n.translate(context, text),
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.all(16),
        actions: [
          TextButton(
            child: Text(
              FlutterI18n.translate(context, "widgets.pop_up.btn_no"),
              style: theme.textTheme.bodySmall?.apply(
                color: theme.colorScheme.error,
              ),
            ),
            onPressed: () {
              Session.appEvents.logPopUp("closed", title, text, false);
              Navigator.pop( context );
            },
          ),
          TextButton(
            child: Text(
              FlutterI18n.translate(context, "widgets.pop_up.btn_yes"),
              style: theme.textTheme.bodySmall?.apply(
                color: Colors.green,
              ),
            ),
            onPressed: () {
              Session.appEvents.logPopUp("accepted", title, text, true);
              Navigator.pop( context );
              function.call();
            },
          ),
        ],
      ),
    );
  }
}
