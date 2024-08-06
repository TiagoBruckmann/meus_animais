// imports nativos
import 'package:flutter/material.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import das telas
import 'package:meus_animais/app/pages/pets/mobx/crop/crop.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';

Future<bool> showBackModal( CropMobx mobx, Function function ) async {
  final response = await showDialog(
    context: Session.globalContext.currentContext!,
    builder: (builder) {

      return BackModalWidget(
        mobx: mobx,
        function: function,
      );

    },
  );

  if ( response == null ) {
    return false;
  }

  return response as bool;
}

class BackModalWidget extends StatelessWidget {
  final CropMobx mobx;
  final Function function;
  const BackModalWidget({ super.key, required this.mobx, required this.function });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
      title: Text(
        FlutterI18n.translate(context, "pages.picture.modal_title"),
        style: theme.textTheme.displayLarge?.apply(
          fontWeightDelta: -3,
        ),
      ),
      content: Text(
        FlutterI18n.translate(context, "pages.picture.modal_body"),
        style: theme.textTheme.bodyLarge,
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
          onPressed: () => mobx.goToPop(),
        ),

        Container(
          padding: const EdgeInsets.fromLTRB(10, 16, 10, 10),
          width: 100,
          child: ElevatedButton(
            onPressed: () {
              mobx.goToPop();
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
