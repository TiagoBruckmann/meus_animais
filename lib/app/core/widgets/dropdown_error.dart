// pacotes nativos flutter
import 'package:flutter/material.dart';

// imports globais
import 'package:meus_animais/session.dart';

// imports das telas
import 'package:meus_animais/app/core/style/app_colors.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';

class DropdownErrorWidget extends StatelessWidget {
  final String text;
  const DropdownErrorWidget({ super.key, required this.text });

  @override
  Widget build(BuildContext context) {

    Session.appEvents.logDropDownError(text);

    return Center(
      child: Text(
        FlutterI18n.translate(context, text),
        style: Theme.of(context).textTheme.bodyLarge?.apply(
          color: AppColors.bossanova,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}