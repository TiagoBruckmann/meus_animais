// pacotes nativos flutter
import 'package:flutter/material.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';

class DropdownErrorWidget extends StatelessWidget {
  final String text;
  const DropdownErrorWidget({ super.key, required this.text });

  @override
  Widget build(BuildContext context) {

    Session.appEvents.logDropDownError(text);
    final theme = Theme.of(context);

    return Center(
      child: Text(
        FlutterI18n.translate(context, text),
        style: theme.textTheme.bodyLarge?.apply(
          color: theme.colorScheme.secondary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}