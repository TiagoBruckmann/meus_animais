// import dos pacotes
import 'dart:convert';

import 'package:http/http.dart' as http;

// import dos domains
import 'package:meus_animais/domain/models/users/user.dart';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/data/sources/remote/credentials.dart';

class RoutesApi {

  sendInfoData( ModelUser modelUser ) async {

    Uri url = Uri.https(Credentials().onesignalUrl, Credentials().createNotification);
    final header = {
      "Accept": "application/json",
      "Authorization": "Basic ${Credentials().onesignalApiToken}",
      "Content-Type": "application/json",
    };

    final body = {
      "app_id": Credentials().onesignalAppId,
      "headings": {
        "en": "💣Solicitação de dados efetuada💥",
      },
      "contents": {
        "en": "O usuário ${modelUser.name}, ID: ${modelUser.id}. Solicitou que seja enviado um relatório de todos os seus dados cadastrais existentes no sistema!\n\n Data da solicitação: ${DateTime.now()}",
      },
      "included_segments": ["only admins"],
      "template_id": Credentials().infoDataTemplateId,
    };

    await http.post(url, headers: header, body: jsonEncode(body)).then((value) {
      if ( value.statusCode == 200 ) {
        Services().analyticsEvent("info_data_requested");
        Services().facebookEvent("info_data_requested");
      } else {
        crash.log("${value.statusCode} - ${value.body}");
      }
    }).timeout(const Duration(seconds: 5), onTimeout: () {
      crash.log("Error, timeout expended");
    }).onError((error, stackTrace) {
      crash.recordError(error, stackTrace);
      crash.log(error.toString());
    });

  }

}