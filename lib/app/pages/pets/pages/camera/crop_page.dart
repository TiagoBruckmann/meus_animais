// pacotes nativos flutter
import 'package:flutter/material.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import das telas
import 'package:meus_animais/app/pages/pets/mobx/crop/crop.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:image_crop/image_crop.dart';

class CropPage extends StatelessWidget {
  final CropMobx mobx;
  const CropPage({ super.key, required this.mobx });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Column(
      children: [

        Expanded(
          child: Crop.file(
            mobx.sampleImage!,
            key: mobx.cropKey,
            aspectRatio: 20.0 / 10.0,
          ),
        ),

        Container(
          color: theme.colorScheme.primary,
          alignment: AlignmentDirectional.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              TextButton(
                child: Text(
                  FlutterI18n.translate(context, "widgets.crop.new"),
                  style: theme.textTheme.displayMedium?.apply(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Session.appEvents.sharedEvent("crop_image_new_image");
                  mobx.settingCamera("crop_image");
                },
              ),

              TextButton(
                child: Text(
                  FlutterI18n.translate(context, "widgets.crop.save"),
                  style: theme.textTheme.displayMedium?.apply(
                    color: Colors.white,
                  ),
                ),
                onPressed: () => mobx.cropImage(),
              ),

            ],
          ),
        ),

      ],
    );
  }
}
