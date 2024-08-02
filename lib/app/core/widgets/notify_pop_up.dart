// pacotes nativos flutter
import 'package:flutter/material.dart';

// imports globais
import 'package:meus_animais/session.dart';

class NotifyPopUpWidget extends StatelessWidget {
  final String title;
  final String message;
  final String petId;
  final String petName;
  final String leftButton;
  final String? rightButton;
  const NotifyPopUpWidget({ super.key, required this.title, required this.message, required this.petId, required this.petName, required this.leftButton, this.rightButton });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        content: Text(
          message,
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
            onPressed: () {
              Session.appEvents.logPopUp("closed", title, message, false);
              Navigator.pop( context );
            },
          ),

          if ( rightButton == null )
            TextButton(
              child: Text(
                rightButton!,
                style: const TextStyle(
                  color: Colors.green,
                ),
              ),
              onPressed: () {

                Session.appEvents.logPopUp("opened", title, message, true);
                Navigator.pop( context );
                Map<String, dynamic> params = {
                  "pet_id": petId,
                  "is_update": true,
                };

                Navigator.pushNamed(
                  context,
                  "/vaccine",
                  arguments: params,
                );
              },
            ),

        ],
      ),
    );
  }
}
