// imports nativos do flutter
import 'package:flutter/material.dart';

class PopUpNotification extends StatelessWidget {

  final String title;
  final String content;
  final String leftButton;
  final Function? function;
  final String? rightButton;
  const PopUpNotification({ super.key, required this.title, required this.content, required this.leftButton, this.function, this.rightButton });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        content: Text(
          content,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.all(16),
        actions: [

          TextButton(
            child: Text(
              leftButton,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
            onPressed: () => Navigator.pop( context ),
          ),

          if ( rightButton != null )
            TextButton(
              child: Text(
                rightButton!,
                style: const TextStyle(
                  color: Colors.green,
                ),
              ),
              onPressed: () {
                Navigator.pop( context );
                if ( function != null ) {
                  function!.call();
                }
              },
            ),

        ],
      ),
    );
  }
}