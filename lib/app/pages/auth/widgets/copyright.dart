// pacotes nativos do flutter
import 'package:flutter/material.dart';

// import das telas
import 'package:meus_animais/app/core/style/app_colors.dart';

class CopyrightWidget extends StatelessWidget {
  const CopyrightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        "Copyright © ${DateTime.now().year} | Meus animais",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayLarge?.apply(
          color: AppColors.bossanova,
        ),
      ),
    );
  }
}
