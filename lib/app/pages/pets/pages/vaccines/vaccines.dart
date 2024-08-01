// pacotes nativos flutter
import 'package:flutter/material.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:meus_animais/domain/entities/vaccine.dart';

class VaccinesPage extends StatelessWidget {
  final VaccineEntity vaccine;
  const VaccinesPage({ super.key, required this.vaccine });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.tertiary,
      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.fromLTRB( 16, 12, 16, 0 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  vaccine.name,
                  style: theme.textTheme.headlineMedium,
                ),

                Text(
                  vaccine.day,
                  style: theme.textTheme.displaySmall,
                ),

              ],
            ),
          ),

          const Divider(
            indent: 16,
            endIndent: 16,
            thickness: 2.5,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text.rich(
                  TextSpan(
                    text: FlutterI18n.translate(context, "pages.vaccines.type"),
                    style: theme.textTheme.displayLarge,
                    children: [
                      TextSpan(
                        text: vaccine.type,
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),

          ( !vaccine.reapply )
            ? const Padding(padding: EdgeInsets.zero)
            : Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text.rich(
                  TextSpan(
                    text: FlutterI18n.translate(context, "pages.vaccines.reapply"),
                    style: theme.textTheme.displayLarge,
                    children: [

                      TextSpan(
                        text: FlutterI18n.translate(context, "pages.vaccines.time", translationParams: <String, String>{"time": vaccine.time!, "type_time": vaccine.typeTime!}),
                        style: theme.textTheme.displayLarge?.apply(
                          fontWeightDelta: -5,
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
    );
  }
}
