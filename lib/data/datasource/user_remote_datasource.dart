// imports globais
import 'package:meus_animais/session.dart';
import 'dart:convert';

// import dos data
import 'package:meus_animais/data/exceptions/exceptions.dart';
import 'package:meus_animais/data/models/user_model.dart';

// import dos pacotess
import 'package:firebase_performance/firebase_performance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDatasource {

  Future<UserModel> getUserData();
  Future<void> logOut();
  Future<void> sendEmailDeleteAccount( Map<String, dynamic> json );

}

class UserRemoteSourceImpl implements UserRemoteDatasource {
  final FirebaseFirestore db;
  final FirebaseAuth auth;
  final http.Client client;
  UserRemoteSourceImpl( this.db, this.auth, this.client );

  @override
  Future<UserModel> getUserData() async {

    late UserModel userModel;
    final user = auth.currentUser;
    if ( user == null ) {
      const errorMessage = "NULL user Get User Data";
      Session.crash.onError("get_user_data", error: errorMessage);
      throw ServerExceptions(errorMessage);
    }

    final metric = Session.performance.newHttpMetric("get-user-data", HttpMethod.Get);
    await metric.start();

    await db.collection("users")
      .where("id", isEqualTo: user.uid)
      .get()
      .then((value) {
        metric.stop();
        for ( final item in value.docs ) {
          userModel = UserModel.fromJson(item.data());
        }
      })
      .onError((error, stackTrace) {
        metric.stop();
        Session.crash.onError(error.toString(), error: error, stackTrace: stackTrace);
        throw ServerExceptions(error.toString());
      })
      .catchError((onError) {
        metric.stop();
        Session.crash.log(onError);
        throw ServerExceptions(onError.toString());
      });

    Session.notifications.login(user.uid);

    return userModel;
  }

  @override
  Future<void> logOut() async {

    final metric = Session.performance.newHttpMetric("logout", HttpMethod.Get);
    await metric.start();

    await auth.signOut()
      .onError((error, stackTrace) {
        metric.stop();
        Session.crash.onError(error.toString(), error: error, stackTrace: stackTrace);
        throw ServerExceptions(error.toString());
      })
      .catchError((onError) {
        metric.stop();
        Session.crash.log(onError);
        throw ServerExceptions(onError.toString());
      });

    metric.stop();

    Session.notifications.logout();

  }

  @override
  Future<void> sendEmailDeleteAccount( Map<String, dynamic> json ) async {

    Uri url = Uri.https(Session.env.baseUrl, "send_email");
    final metric = Session.performance.newHttpMetric(url.host, HttpMethod.Post);
    await metric.start();

    final response = await client.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(json),
    );

    await metric.stop();

    if ( response.statusCode == 204 ) {
      return await _deleteAccount(json);
    }

    throw ServerExceptions(response.body);

  }

  Future<void> _deleteAccount( Map<String, dynamic> json ) async {

    final user = auth.currentUser;
    if ( user == null ) {
      const errorMessage = "NULL user - Delete Account";
      Session.crash.onError("delete_user", error: errorMessage);
      throw ServerExceptions(errorMessage);
    }

    final metric = Session.performance.newHttpMetric("delete-user", HttpMethod.Delete);
    await metric.start();

    await user.delete().then((value) async {

      await metric.stop();
      Session.localStorage.deleteAllTokens();

      await db.collection("users").doc(json["id"]).update(json["delete_user"]);

      return;

    })
    .onError((error, stackTrace) {
      metric.stop();
      Session.crash.onError(error.toString(), error: error, stackTrace: stackTrace);
      throw ServerExceptions(error.toString());
    })
    .catchError((onError) {
      metric.stop();
      Session.crash.log(onError);
      throw ServerExceptions(onError.toString());
    });

  }

}