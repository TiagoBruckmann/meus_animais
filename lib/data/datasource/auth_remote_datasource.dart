// imports globais
import 'package:meus_animais/session.dart';

// import dos data
import 'package:meus_animais/data/exceptions/exceptions.dart';
import 'package:meus_animais/data/models/user_model.dart';

// import dos pacotess
import 'package:firebase_performance/firebase_performance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

    final metric = Session.performance.newHttpMetric("register", HttpMethod.Post);
    await metric.start();

    final firebaseUser = await auth.createUserWithEmailAndPassword(
      email: json["email"],
      password: json["password"],
    )
    .onError((error, stackTrace) {
      metric.stop();
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

    await metric.stop();

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

    Session.notifications.login(userModel.id);
    Session.crash.userConnected(userModel.id);
    return userModel;
  }

  @override
  Future<UserModel> login( Map<String, dynamic> json ) async {

    final metric = Session.performance.newHttpMetric("login", HttpMethod.Post);
    await metric.start();

    final firebaseUser = await auth.signInWithEmailAndPassword(
      email: json["email"],
      password: json["password"],
    )
    .onError((error, stackTrace) {
      metric.stop();
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

    await metric.stop();

    UserModel userModel = UserModel(
      firebaseUser.user!.uid,
      firebaseUser.user!.displayName!,
      json["email"],
      picture: firebaseUser.user!.photoURL!,
    );

    await Session.notifications.login(userModel.id);
    Session.crash.userConnected(userModel.id);

    return userModel;

  }

  @override
  Future<void> forgotPassword( String email ) async {

    final metric = Session.performance.newHttpMetric("forgot-password", HttpMethod.Post);
    await metric.start();

    await auth.sendPasswordResetEmail(
      email: email,
    )
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

    return await metric.stop();

  }

}