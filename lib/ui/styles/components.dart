import 'package:flutter/material.dart';
import 'package:meus_animais/ui/styles/app_colors.dart';

class Components {

  inputDecoration( String text, context ) {
    InputDecoration(
      contentPadding: const EdgeInsets.all(16),
      labelText: text,
      labelStyle: const TextStyle(
        color: AppColors.barossa,
      ),
      filled: true,
      fillColor: AppColors.blueSolitude,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      border:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

}