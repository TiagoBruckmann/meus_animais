// imports nativos do flutter
import 'package:flutter/material.dart';

// import das telas
import 'package:meus_animais/app/core/style/app_images.dart';

// import dos pacotes
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class LoadingPetsWidget extends StatelessWidget {
  const LoadingPetsWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 5, vertical: 8 ),
      child: SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric( horizontal: 5 ),
          child: ClipRect(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [

                  Shimmer(
                    duration: const Duration(seconds: 5),
                    color: Colors.grey,
                    colorOpacity: 0.6,
                    enabled: true,
                    direction: const ShimmerDirection.fromLTRB(),
                    child: Image.asset(
                      AppImages.banner,
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    child: Shimmer(
                      duration: const Duration(seconds: 5),
                      color: Colors.grey,
                      colorOpacity: 0.3,
                      enabled: true,
                      direction: const ShimmerDirection.fromLTRB(),
                      child: Card(
                        color: theme.colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric( horizontal: 16, vertical: 7 ),
                          width: width - 25,
                          child: Shimmer(
                            duration: const Duration(seconds: 5),
                            color: Colors.grey,
                            colorOpacity: 0.8,
                            enabled: true,
                            direction: const ShimmerDirection.fromLTRB(),
                            child: Text(
                              FlutterI18n.translate(context, "widgets.pets.title"),
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
