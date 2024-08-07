// imports nativos
import 'package:flutter/material.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';

Future<void> showBackModal( Function function ) async {
  return showDialog(
    context: Session.globalContext.currentContext!,
    builder: (builder) {

      return BackModalWidget(
        function: function,
      );

    },
  );
}

class BackModalWidget extends StatelessWidget {
  final Function function;
  const BackModalWidget({ super.key, required this.function });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return AlertDialog(
      title: Text(
        FlutterI18n.translate(context, "pages.picture.modal_title"),
      ),
      content: Text(
        FlutterI18n.translate(context, "pages.picture.modal_body"),
      ),
      actions: [

        TextButton(
          child: Text(
            FlutterI18n.translate(context, "widgets.pop_up.btn_no"),
            textAlign: TextAlign.left,
            style: theme.textTheme.titleSmall?.apply(
              color: theme.colorScheme.primary,
              fontWeightDelta: 2,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),

        Container(
          padding: const EdgeInsets.fromLTRB(10, 16, 10, 10),
          width: 100,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              function.call();
            },
            child: Text(
              FlutterI18n.translate(context, "widgets.pop_up.btn_yes"),
              style: theme.textTheme.headlineMedium,
            ),
          ),
        ),

      ],
    );
  }
}
