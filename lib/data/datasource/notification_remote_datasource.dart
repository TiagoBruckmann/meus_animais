// imports globais
import 'package:meus_animais/session.dart';
import 'dart:convert';

// import dos data
import 'package:meus_animais/data/exceptions/exceptions.dart';

// import dos pacotess
import 'package:firebase_performance/firebase_performance.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:http/http.dart' as http;

abstract class NotificationRemoteDatasource {

  Future<void> sendNotifyReapplyVaccine( Map<String, dynamic> json );
  Future<void> requestInfoData();

}

class NotificationRemoteDatasourceImpl implements NotificationRemoteDatasource {
  final FirebaseAuth auth;
  final http.Client client;
  NotificationRemoteDatasourceImpl( this.auth, this.client );

  final _titleInfoData = "💣Solicitação de dados efetuada💥";

  @override
  Future<void> sendNotifyReapplyVaccine( Map<String, dynamic> json ) async {

    final user = auth.currentUser;
    if ( user == null ) {
      const errorMessage = "NULL user - send notify reapply vaccine";
      Session.crash.onError("send_notify_reapply_vaccine", error: errorMessage);
      throw ServerExceptions(errorMessage);
    }

    String? playerId = Session.notifications.getPlayerId();

    DateTime date = DateTime.parse(json["date"]);
    String month = Session.sharedServices.convertMonth(date.month);

    final vaccineName = json["vaccine_name"];
    final petName = json["pet"];

    Map<String, dynamic> params = {
      "app_id": Session.env.onesignalAppId,
      "header": {
        "en": "Vaccination day",
        "pt": "Dia de revacinar",
      },
      "content": {
        "en": "Hello $user, the day has come to reapply the vaccine $vaccineName in $petName.",
        "pt": "Olá $user, chegou o dia de reaplicar a vacina $vaccineName em $petName.",
      },
      "include_player_ids": [playerId],
      "data": {
        "pet_id": json["pet_id"],
        "pet_name": petName,
      },
      "template_id": Session.env.onesignalTemplateReapply,
      "btn1": {
        "id": "btn_ok",
        "text": "Ok",
      },
      "btn2": {
        "id": "btn_reapply",
        "text": FlutterI18n.translate(Session.globalContext.currentContext!, "notifications.btn_reapply"),
      },
      "send_after": "$month ${date.day}th ${date.year}, 07:00:00 am UTC${date.timeZoneName}:00",
    };

    Uri url = Uri.https(Session.env.baseUrl, "send-notification");
    final metric = Session.performance.newHttpMetric(url.host, HttpMethod.Post);
    await metric.start();

    final response = await client.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(params),
    );

    await metric.stop();

    if ( response.statusCode == 200 ) {
      Session.appEvents.sharedEvent("reapply_notification");
      return;
    }

    throw ServerExceptions(response.body);

  }

  @override
  Future<void> requestInfoData() async {

    String? playerId = Session.notifications.getPlayerId();

    final body = {
      "app_id": Session.env.onesignalAppId,
      "header": {
        "en": _titleInfoData,
      },
      "content": {
        "en": "O usuário ${Session.user.name}, ID: ${Session.user.id}, do aplicativo Meus Animais. Solicitou que seja enviado um relatório de todos os seus dados cadastrais existentes no sistema!\n\n Data da solicitação: ${DateTime.now()}",
      },
      "include_player_ids": [playerId],
      // "included_segments": ["only admins"],
      "data": {},
      "template_id": Session.env.onesignalTemplateInfoData,
    };

    Uri url = Uri.https(Session.env.baseUrl, "send-notification");
    final metric = Session.performance.newHttpMetric(url.host, HttpMethod.Post);
    await metric.start();

    final response = await client.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );

    await metric.stop();

    _requestInfoSendEmail();

    if ( response.statusCode == 200 ) {
      Session.appEvents.sharedEvent("reapply_notification");
      return;
    }

    throw ServerExceptions(response.body);

  }

  Future<void> _requestInfoSendEmail() async {

    Map<String, dynamic> params = {
      "subject": _titleInfoData,
      "body": "O usuário ${Session.user.name}, ID: ${Session.user.id}, do aplicativo Meus Animais. Solicitou que seja enviado um relatório de todos os seus dados cadastrais existentes no sistema!\n\n Data da solicitação: ${DateTime.now()}",
    };

    Uri url = Uri.https(Session.env.baseUrl, "send_email");
    final metric = Session.performance.newHttpMetric(url.host, HttpMethod.Post);
    await metric.start();

    final response = await client.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(params),
    );

    await metric.stop();

    if ( response.statusCode == 204 ) {
      Session.appEvents.sharedEvent("send_email_request_info");
      return;
    }

    throw ServerExceptions(response.body);

  }

}