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

Map<String, String> _mapErrorAuthentication = {
  "week_password": "Password should be at least 6 characters",
  "used_email": "The email address is already in use by another account",
  "bad_email": "The email address is badly formatted",
  "user_pwd_not_found": "The password is invalid or the user does not have a password",
  "user_not_found": "There is no user record corresponding to this identifier. The user may have been deleted",
};

abstract class AuthRemoteDatasource {

  Future<bool> verifyConnection();
  Future<UserModel> register( Map<String, dynamic> json );
  Future<UserModel> login( Map<String, dynamic> json );
  Future<void> forgotPassword( String email );

}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final FirebaseFirestore db;
  final FirebaseAuth auth;
  AuthRemoteDatasourceImpl( this.db, this.auth );

  @override
  Future<bool> verifyConnection() async {
    bool connected = false;

    User? user = auth.currentUser;
    if ( user != null ) {
      connected = true;
    }

    return connected;
  }

  @override
  Future<UserModel> register( Map<String, dynamic> json ) async {

    final firebaseUser = await auth.createUserWithEmailAndPassword(
      email: json["email"],
      password: json["password"],
    )
    .onError((error, stackTrace) {
      if ( error.toString().contains(_mapErrorAuthentication["week_password"].toString()) ) {
        throw WeekPasswordException(_mapErrorAuthentication["week_password"].toString());
      } else if ( error.toString().contains(_mapErrorAuthentication["used_email"].toString()) ) {
        throw EmailUsedException(_mapErrorAuthentication["used_email"].toString());
      } else if ( error.toString().contains(_mapErrorAuthentication["bad_email"].toString()) ) {
        throw InvalidEmailException(_mapErrorAuthentication["bad_email"].toString());
      } else {
        Session.crash.onError(error.toString(), error: error, stackTrace: stackTrace);
        throw ServerExceptions(error.toString());
      }
    });

    final name = json["name"];
    String imageUrl = "https://ui-avatars.com/api/?name=$name";
    firebaseUser.user?.updateDisplayName(name);
    firebaseUser.user?.updatePhotoURL(imageUrl);

    UserModel userModel = UserModel(
      firebaseUser.user!.uid,
      name,
      json["email"],
      picture: imageUrl,
    );

    await db.collection("users").doc(userModel.id).set(userModel.toMap());

    return userModel;
  }

  @override
  Future<UserModel> login( Map<String, dynamic> json ) async {

    final firebaseUser = await auth.signInWithEmailAndPassword(
      email: json["email"],
      password: json["password"],
    )
    .onError((error, stackTrace) {
      if ( error.toString().contains(_mapErrorAuthentication["week_password"].toString()) ) {
        throw WeekPasswordException(_mapErrorAuthentication["week_password"].toString());
      } else if ( error.toString().contains(_mapErrorAuthentication["used_email"].toString()) ) {
        throw EmailUsedException(_mapErrorAuthentication["used_email"].toString());
      } else if ( error.toString().contains(_mapErrorAuthentication["bad_email"].toString()) ) {
        throw InvalidEmailException(_mapErrorAuthentication["bad_email"].toString());
      } else if ( error.toString().contains(_mapErrorAuthentication["user_pwd_not_found"].toString()) ) {
        throw UserPwdNotFoundException(_mapErrorAuthentication["user_pwd_not_found"].toString());
      } else if ( error.toString().contains(_mapErrorAuthentication["user_not_found"].toString()) ) {
        throw UserNotFoundException(_mapErrorAuthentication["user_not_found"].toString());
      } else {
        Session.crash.onError(error.toString(), error: error, stackTrace: stackTrace);
        throw ServerExceptions(error.toString());
      }
    });

    UserModel userModel = UserModel(
      firebaseUser.user!.uid,
      firebaseUser.user!.displayName!,
      json["email"],
      picture: firebaseUser.user!.photoURL!,
    );

    await Session.notifications.login(firebaseUser.user!.uid);

    return userModel;

  }

  @override
  Future<void> forgotPassword( String email ) async {

    await auth.sendPasswordResetEmail(
      email: email,
    )
    .onError((error, stackTrace) {
      Session.crash.onError(error.toString(), error: error, stackTrace: stackTrace);
      throw ServerExceptions(error.toString());
    })
    .catchError((onError) {
      Session.crash.log(onError);
      throw ServerExceptions(onError.toString());
    });

    return;

  }

}