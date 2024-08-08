// imports nativos do flutter
import 'package:flutter/material.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';

class EmptyPageWidget extends StatelessWidget {
  final String message;
  const EmptyPageWidget({ super.key, required this.message });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Center(
      child: Text(
        FlutterI18n.translate(context, message),
        style: theme.textTheme.bodyLarge?.apply(
          color: theme.colorScheme.onSecondary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
