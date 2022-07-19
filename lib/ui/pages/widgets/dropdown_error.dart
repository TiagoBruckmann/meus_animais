// pacotes nativos flutter
import 'package:flutter/material.dart';

class DropdownError extends StatelessWidget {

  final String text;
  DropdownError({ Key key, @required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
