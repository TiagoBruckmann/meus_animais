// imports nativos
import 'dart:io' show Platform;

// import dos pacotes
import 'package:firebase_performance/firebase_performance.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/update_pets.dart';
import 'package:meus_animais/domain/models/pets/pets.dart';

final FirebaseCrashlytics crash = FirebaseCrashlytics.instance;
final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
final FirebaseFirestore db = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
final FirebasePerformance perf = FirebasePerformance.instance;
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
    analytics.logEvent(name: "delete_all_tokens");
  }

  getToken( String name ) async {
    return await storage.read(key: name);
  }

  // deletar token especifico
  void deleteOnlyToken( String keyName ) async {
    await storage.delete(key: keyName);
    analytics.logEvent(name: "delete_only_token");
  }

  uploadPicture( ModelPets modelPets, XFile picture, context ) async {

    firebase_storage.UploadTask uploadTask;
    firebase_storage.Reference archive = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child("documents/pets/${modelPets.id}/")
        .child(picture.name);

    final metadata = firebase_storage.SettableMetadata(
      contentType: '${picture.mimeType}',
      customMetadata: {'picked-file-path': picture.path},
    );

    uploadTask = archive.putData(await picture.readAsBytes(), metadata);

    uploadTask.snapshotEvents.listen((event) async {
      event.ref.getDownloadURL().then((value) async {

        modelPets.picture = value;
        final updatePet = getIt.get<UpdatePetManager>();
        updatePet.context = context;
        updatePet.modelPets = modelPets;
        updatePet.setData();

      });
    });

  }

  rateApp() async {

    analytics.logEvent(name: "rateApp");
    Uri url;
    if ( Platform.isAndroid ) {
      url = Uri.https("play.google.com", "/store/apps/details", {"id": "com.sega.sprint"});
    } else {
      url = Uri.https("www.apple.com", "/br/app-store/");
    }

    await launchUrl(url);
  }

}