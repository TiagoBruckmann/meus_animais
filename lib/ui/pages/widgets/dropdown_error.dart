// pacotes nativos flutter
import 'package:flutter/material.dart';
import 'package:meus_animais/data/sources/remote/services/events.dart';

// import dos estilos
import 'package:meus_animais/ui/styles/app_colors.dart';

class DropdownError extends StatelessWidget {

  final String text;
  const DropdownError({ Key? key, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EventsApp().logDropDownError(text);
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.bossanova,
          fontSize: 15,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
