// imports nativos
import 'package:flutter/material.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import das telas
import 'package:meus_animais/app/pages/pets/mobx/crop/crop.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';

Future<void> showPictureSelection( CropMobx cropMobx ) async {

  final currentContext = Session.globalContext.currentContext!;
  void goToPop() => Navigator.pop(currentContext);

  await showModalBottomSheet(
    backgroundColor: Theme.of(currentContext).colorScheme.primary,
    isDismissible: true,
    elevation: 2.0,
    context: currentContext,
    builder: (builder) {

      final theme = Theme.of(builder);

      return SizedBox(
        height: 160,
        child: Column(
          children: [

            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  goToPop();
                  cropMobx.chooseTypePicture("gallery");
                },
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    FlutterI18n.translate(builder, "pages.picture.gallery"),
                    style: theme.textTheme.bodyLarge?.apply(
                      color: Colors.white,
                      fontWeightDelta: 2,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  goToPop();
                  cropMobx.chooseTypePicture("picture");
                },
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    FlutterI18n.translate(builder, "pages.picture.picture"),
                    style: theme.textTheme.bodyLarge?.apply(
                      color: Colors.white,
                      fontWeightDelta: 2,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => goToPop(),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    FlutterI18n.translate(builder, "widgets.pop_up.btn_no"),
                    style: theme.textTheme.bodyLarge?.apply(
                      color: theme.colorScheme.error,
                      fontWeightDelta: 2,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      );
    },
  );
}