// imports nativos do flutter
import 'package:flutter/material.dart';

class RefreshWidget extends StatelessWidget {

  final String message;
  const RefreshWidget({ Key? key, required this.message }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Center(
            child: Text(
              message,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}