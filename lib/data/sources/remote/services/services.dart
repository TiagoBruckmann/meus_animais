// import dos pacotes
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseCrashlytics crash = FirebaseCrashlytics.instance;
final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
final FirebaseFirestore db = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
const storage = FlutterSecureStorage();

class Services {

  // enviar tela atual para o analytics
  Future<void> sendScreen( String screenName ) async {
    await analytics.setCurrentScreen(
      screenName: screenName,
      screenClassOverride: screenName,
    );
  }

  void setToken( String tokenName, String token ) async {
    final String keyToken = tokenName;
    await storage.write( key: keyToken, value: token );
  }

  // deletar todos os tokens
  void deleteAllTokens() async {
    await storage.deleteAll();
  }

  // deletar token especifico
  void deleteOnlyToken( String keyName ) async {
    await storage.delete(key: keyName);
  }

}