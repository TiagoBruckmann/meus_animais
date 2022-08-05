// imports nativos
import 'dart:io' show Platform;

// import dos pacotes
import 'package:firebase_performance/firebase_performance.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_version/new_version.dart';
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

  void deleteAllTokens() async {
    await storage.deleteAll();
    analytics.logEvent(name: "delete_all_tokens");
  }

  getToken( String name ) async {
    return await storage.read(key: name);
  }

  void deleteOnlyToken( String keyName ) async {
    await storage.delete(key: keyName);
    analytics.logEvent(name: "delete_only_token");
  }

  uploadPicture( ModelPets modelPets, XFile? picture, context ) async {

    final updatePet = getIt.get<UpdatePetManager>();

    if ( picture != null ) {
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
          updatePet.context = context;
          updatePet.modelPets = modelPets;
          updatePet.setData();

        });
      });
    } else {
      updatePet.context = context;
      updatePet.modelPets = modelPets;
      updatePet.setData();
    }
  }

  rateApp() async {
    analytics.logEvent(name: "rateApp");
    Uri url;
    if ( Platform.isAndroid ) {
      url = Uri.https("play.google.com", "/store/apps/details", {"id": "br.com.meus_animais"});
    } else {
      url = Uri.https("www.apple.com", "/br/app-store/");
    }

    if ( await canLaunchUrl(url) ) {
      await launchUrl(
        url,
        mode: LaunchMode.externalNonBrowserApplication,
      );
    } else {
      crash.log("Could not launch appStoreLink");
      throw 'Could not launch appStoreLink';
    }
  }

  verifyVersion( context ) async {

    final newVersion = NewVersion();

    final versionStatus = await newVersion.getVersionStatus();
    if ( versionStatus != null ) {

      int storeVersion = int.parse(versionStatus.storeVersion.replaceAll(".", ""));
      int localVersion = int.parse(versionStatus.localVersion.replaceAll(".", ""));

      if ( localVersion < storeVersion && versionStatus.canUpdate == true ) {

        Map<String, String> params = {
          "store_version": versionStatus.storeVersion,
        };

        newVersion.showUpdateDialog(
          context: context,
          versionStatus: versionStatus,
          dialogTitle: FlutterI18n.translate(context, "update.title"),
          dialogText: FlutterI18n.translate(context, "update.body", translationParams: params),
          updateButtonText: FlutterI18n.translate(context, "btn_update"),
          allowDismissal: false,
        );
      }
    }

  }

}