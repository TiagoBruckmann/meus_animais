// pacotes nativos flutter
import 'package:flutter/material.dart';

// import dos domain
import 'package:meus_animais/domain/entities/hygiene.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';

class HygienePage extends StatelessWidget {
  final HygieneEntity hygiene;
  const HygienePage({ super.key, required this.hygiene });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 10 ),
      child: Card(
        color: theme.colorScheme.tertiary,
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.fromLTRB( 16, 12, 16, 0 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    hygiene.name,
                    style: theme.textTheme.headlineMedium,
                  ),

                  Text(
                    hygiene.day,
                    style: theme.textTheme.displaySmall,
                  ),

                ],
              ),
            ),

            const Divider(),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Text.rich(
                    TextSpan(
                      text: FlutterI18n.translate(context, "pages.hygiene.hygiene.place"),
                      style: theme.textTheme.displayLarge?.apply(
                        color: theme.colorScheme.onSecondary,
                        fontWeightDelta: 3,
                      ),
                      children: [

                        TextSpan(
                          text: hygiene.place,
                          style: theme.textTheme.displayLarge?.apply(
                            color: theme.colorScheme.onSecondary,
                            fontWeightDelta: -1
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only( left: 16, bottom: 8 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Text.rich(
                    TextSpan(
                      text: FlutterI18n.translate(context, "pages.hygiene.hygiene.value"),
                      style: theme.textTheme.displayLarge?.apply(
                        color: theme.colorScheme.onSecondary,
                      ),
                      children: [

                        TextSpan(
                          text: hygiene.value,
                          style: theme.textTheme.displayLarge?.apply(
                            color: theme.colorScheme.onSecondary,
                            fontWeightDelta: -1,
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
