// imports nativos do flutter
import 'package:flutter/material.dart';

class CustomSnackBar {

  CustomSnackBar( context, text, color ) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}