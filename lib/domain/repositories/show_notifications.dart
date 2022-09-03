// imports nativos
import 'package:flutter/material.dart';
import 'dart:convert';

// import das telas
import 'package:meus_animais/ui/pages/widgets/notify_pop_up.dart';

// import dos pacotes
import 'package:injectable/injectable.dart';

abstract class ShowNotificationRepository {
  setNotification( Map<String, dynamic> notification, BuildContext context );
}

@Injectable(as: ShowNotificationRepository, env: ["firebase", "api", "test"])
class ShowNotification implements ShowNotificationRepository {

  @override
  setNotification( Map<String, dynamic> notification, BuildContext context ) {

    return showDialog(
      context: context,
      builder: (builder) {

        final custom = jsonDecode(notification["custom"]);
        return NotifyPopUpWidget(
          title: notification["title"],
          message: notification["alert"],
          petId: custom["a"]["pet_id"],
          petName: custom["a"]["pet_name"],
          leftButton: custom["a"]["actionButtons"][0]["text"],
          rightButton: custom["a"]["actionButtons"][1]["text"],
          oldContext: context,
        );

      },
    );

  }
}