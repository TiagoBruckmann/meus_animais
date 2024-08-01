// imports nativos do flutter
import 'package:flutter/material.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';

class EmptyPageWidget extends StatelessWidget {
  final String message;
  const EmptyPageWidget({ super.key, required this.message });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        FlutterI18n.translate(context, message),
        textAlign: TextAlign.center,
      ),
    );
  }
}
