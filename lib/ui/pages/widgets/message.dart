// imports nativos do flutter
import 'package:flutter/material.dart';

// import dos estilos
import 'package:meus_animais/ui/styles/app_colors.dart';

class CustomSnackBar {

  CustomSnackBar( context, text, color ) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: const TextStyle(
          color: AppColors.whiteSmoke,
        ),
      ),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}