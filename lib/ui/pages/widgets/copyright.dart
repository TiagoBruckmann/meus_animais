// pacotes nativos do flutter
import 'package:flutter/material.dart';

class CopyrightWidget extends StatelessWidget {
  const CopyrightWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        "Copyright © 2022 | Meus animais",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}
