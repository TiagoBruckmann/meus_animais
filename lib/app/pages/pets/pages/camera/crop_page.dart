// pacotes nativos flutter
import 'package:flutter/material.dart';
import 'package:meus_animais/app/core/widgets/loading_overlay.dart';

// import das telas
import 'package:meus_animais/app/pages/pets/pages/widgets/back_modal.dart';
import 'package:meus_animais/app/pages/pets/mobx/crop/crop.dart';

// import dos pacotes
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class CropPage extends StatelessWidget {
  final CropMobx mobx;
  const CropPage({ super.key, required this.mobx });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Observer(
      builder: (context) {

        return PopScope(
          canPop: false,
          onPopInvokedWithResult: ( bool value, object ) => showBackModal(() => mobx.setIsCropImage(false)),
          child: Scaffold(
            body: Center(
              child: LoadingOverlay(
                isLoading: mobx.isLoading,
                child: Visibility(
                  visible: mobx.isCropImage,
                  replacement: const CircularProgressIndicator(),
                  child: Column(
                    children: [

                      Expanded(
                        child: Visibility(
                          visible: mobx.croppedData == null,
                          replacement: Center(
                            child: mobx.croppedData == null
                              ? const SizedBox.shrink()
                              : Image.memory(mobx.croppedData!),
                          ),
                          child: Stack(
                            children: [

                              Crop(
                                controller: mobx.cropController,
                                image: mobx.currentImage!,
                                onCropped: (croppedData) => mobx.onCroppedImage(croppedData),
                                progressIndicator: const CircularProgressIndicator(),
                                baseColor: theme.colorScheme.primary,
                                withCircleUi: false,
                                initialSize: 0.5,
                                maskColor: null,
                                cornerDotBuilder: (size, edgeAlignment) => const SizedBox.shrink(),
                                interactive: true,
                                fixCropRect: true,
                                radius: 10,
                                initialRectBuilder: (rect, _) {

                                  return Rect.fromLTRB(
                                    rect.left + 28,
                                    rect.top + 120,
                                    rect.right - 28,
                                    rect.bottom - 120,
                                  );

                                },
                              ),

                              IgnorePointer(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 25),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 4, color: Colors.white),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: SafeArea(
              child: Container(
                color: theme.colorScheme.primary.withOpacity(0.5),
                padding: const EdgeInsets.fromLTRB(10, 16, 10, 10),
                width: 100,
                child: ElevatedButton(
                  onPressed: () => mobx.cutImage(),
                  child: Text(
                    FlutterI18n.translate(context, "widgets.pop_up.btn_yes"),
                    style: theme.textTheme.headlineMedium?.apply(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

      }
    );
  }
}
