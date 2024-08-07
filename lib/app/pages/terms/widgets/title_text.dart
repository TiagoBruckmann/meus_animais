import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  final String title;
  const TitleTextWidget({ super.key, required this.title });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Text(
      title,
      style: theme.textTheme.displayLarge?.apply(
        color: theme.colorScheme.onSecondary,
        fontWeightDelta: 4,
      ),
    );
  }
}
