// pacotes nativos flutter
import 'package:flutter/material.dart';

class NotifyPopUpWidget extends StatelessWidget {

  final String title;
  final String message;
  final String petId;
  final String petName;
  final String leftButton;
  final String? rightButton;
  final BuildContext oldContext;
  const NotifyPopUpWidget({ Key? key, required this.title, required this.message, required this.petId, required this.petName, required this.leftButton, this.rightButton, required this.oldContext }) : super(key: key);

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
              Navigator.pop( context );
            },
          ),

          ( rightButton == null )
          ? const Padding(padding: EdgeInsets.zero)
          : TextButton(
            child: Text(
              rightButton!,
              style: const TextStyle(
                color: Colors.green,
              ),
            ),
            onPressed: () {

              Navigator.pop( context );
              Map<String, dynamic> params = {
                "pet_id": petId,
                "update": true,
                "pet_name": petName,
              };

              Navigator.pushNamed(
                context,
                "/vaccines",
                arguments: params,
              );
            },
          ),

        ],
      ),
    );
  }
}
