// imports nativos
import 'dart:io';

// imports globais
import 'package:meus_animais/session.dart';

// import dos domain
import 'package:meus_animais/domain/entities/vaccine.dart';
import 'package:meus_animais/domain/entities/hygiene.dart';

// import dos data
import 'package:meus_animais/data/models/life_time_model.dart';
import 'package:meus_animais/data/exceptions/exceptions.dart';
import 'package:meus_animais/data/models/vaccine_model.dart';
import 'package:meus_animais/data/models/hygiene_model.dart';
import 'package:meus_animais/data/models/pet_model.dart';

// import dos pacotess
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_performance/firebase_performance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

abstract class PetRemoteDatasource {

  Future<List<PetModel>> getPets();
  Future<void> setPet( Map<String, dynamic> json, XFile picture );
  Future<PetModel> updatePet( Map<String, dynamic> json, XFile? picture );
  Future<List<LifeTimeModel>> getLifeTime();
  Future<List<HygieneModel>> getHygiene( String petId );
  Future<void> setHygiene( List<HygieneEntity> list );
  Future<List<VaccineModel>> getVaccines( String petId );
  Future<void> setVaccines( List<VaccineEntity> list );

}

class PetRemoteSourceImpl implements PetRemoteDatasource {
  final FirebaseFirestore db;
  final FirebaseAuth auth;
  PetRemoteSourceImpl( this.db, this.auth );

  @override
  Future<List<PetModel>> getPets() async {

    final user = auth.currentUser;
    if ( user == null ) {
      const errorMessage = "NULL user - Get Pets";
      Session.crash.onError("get_pets", error: errorMessage);
      throw ServerExceptions(errorMessage);
    }

    final metric = Session.performance.newHttpMetric("get-pets", HttpMethod.Get);
    await metric.start();

    final List<PetModel> list = [];

    await db.collection("pets")
      .where("user_id", isEqualTo: auth.currentUser!.uid)
      .get()
      .then((value) {

        metric.stop();
        for ( final item in value.docs ) {
          list.add(PetModel.fromJson(item));
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

    return list;
  }

  @override
  Future<void> setPet( Map<String, dynamic> json, XFile picture ) async {

    final user = auth.currentUser;
    if ( user == null ) {
      const errorMessage = "NULL user - Set Pet";
      Session.crash.onError("set_pet", error: errorMessage);
      throw ServerExceptions(errorMessage);
    }

    final metric = Session.performance.newHttpMetric("set-pet", HttpMethod.Post);
    await metric.start();
    
    final pet = json["pet"] as Map<String, dynamic>;
    final List<VaccineEntity> vaccines = [];
    final List<HygieneEntity> hygiene = [];

    for ( final item in json["vaccine"] ) {
      vaccines.add(VaccineModel.fromJson(item, item["pet_id"]));
    }

    for ( final item in json["hygiene"] ) {
      hygiene.add(HygieneModel.fromJson(item, item["pet_id"]));
    }

    await db.collection("pets")
      .doc(pet["id"])
      .set(pet)
      .then((value) async {

        await metric.stop();

        if ( vaccines.isNotEmpty ) {
          await setVaccines(vaccines);
        }

        if ( hygiene.isNotEmpty ) {
          await setHygiene(hygiene);
        }

        return await _uploadPicture(pet, picture);

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

    return;
  }

  @override
  Future<PetModel> updatePet( Map<String, dynamic> json, XFile? picture ) async {

    final user = auth.currentUser;
    if ( user == null ) {
      const errorMessage = "NULL user - Update Pet";
      Session.crash.onError("update_pet", error: errorMessage);
      throw ServerExceptions(errorMessage);
    }

    if ( picture != null ) {
      return await _uploadPicture(json, picture);
    }

    final pet = PetModel.fromJson(json);

    final metric = Session.performance.newHttpMetric("update-pet", HttpMethod.Put);
    await metric.start();

    await db.collection("pets")
      .doc(pet.id)
      .update(pet.updateToMap())
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

    await metric.stop();

    return pet;
  }

  @override
  Future<List<LifeTimeModel>> getLifeTime() async {

    String locale = "en_US";
    if ( Platform.localeName == "pt_BR" ) {
      locale = Platform.localeName;
    }

    final metric = Session.performance.newHttpMetric("get-life-time", HttpMethod.Get);
    await metric.start();

    final List<LifeTimeModel> list = [];

    await db.collection("life_time")
      .doc("languages")
      .collection(locale)
      .get()
      .then((value) {

        metric.stop();

        for ( final item in value.docs ) {
          list.add(LifeTimeModel.fromJson(item));
        }

        return list;
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

    return list;
  }

  @override
  Future<List<HygieneModel>> getHygiene( String petId ) async {

    final metric = Session.performance.newHttpMetric("get-hygiene-pet-$petId", HttpMethod.Get);
    await metric.start();

    final List<HygieneModel> list = [];

    await db.collection("pets")
      .doc(petId)
      .collection("hygiene")
      .get()
      .then((value) {

        metric.stop();

        for ( final item in value.docs ) {
          list.add(HygieneModel.fromJson(item, petId));
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

    return list;
  }

  @override
  Future<void> setHygiene( List<HygieneEntity> list ) async {

    for ( final item in list ) {

      if ( item.petId != null ) {

        final metric = Session.performance.newHttpMetric("set-hygiene-pet-${item.id}", HttpMethod.Post);
        await metric.start();

        await db.collection("pets")
          .doc(item.petId)
          .collection("hygiene")
          .doc(item.id)
          .set(item.toMap( item.petId! ));

        await metric.stop();

      }

    }

  }

  @override
  Future<List<VaccineModel>> getVaccines( String petId ) async {

    final metric = Session.performance.newHttpMetric("get-vaccines-$petId", HttpMethod.Get);
    await metric.start();

    final List<VaccineModel> list = [];

    await db.collection("pets")
      .doc(petId)
      .collection("vaccines")
      .get()
      .then((value) {

        metric.stop();

        for ( final item in value.docs ) {
          list.add(VaccineModel.fromJson(item, petId));
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

    await metric.stop();

    return list;
  }

  @override
  Future<void> setVaccines( List<VaccineEntity> list ) async {

    for ( final item in list ) {

      if ( item.petId != null ) {

        final metric = Session.performance.newHttpMetric("set-vaccine-${item.id}", HttpMethod.Post);
        await metric.start();

        await db.collection("pets")
          .doc(item.petId)
          .collection("vaccines")
          .doc(item.id)
          .set(item.toMap( item.petId! ));

        await metric.stop();

      }

    }

  }

  Future<PetModel> _uploadPicture( Map<String, dynamic> json , XFile? file ) async {

    PetModel pet = PetModel.fromJson(json);
    if ( file == null ) {
      return pet;
    }

    final metric = Session.performance.newHttpMetric("upload-image", HttpMethod.Post);
    await metric.start();

    String animalName = json["name"].toString().replaceAll(" ", "_");

    firebase_storage.Reference archive = firebase_storage
      .FirebaseStorage.instance
      .ref()
      .child("documents/pets/${json["id"]}/$animalName/");

    await metric.stop();

    final metadata = firebase_storage.SettableMetadata(
      contentType: "jpg",
      customMetadata: {'picked-file-path': animalName},
    );

    final uploadTask = archive.putData(await file.readAsBytes(), metadata);

    uploadTask.snapshotEvents.listen((event) async {
      await event.ref.getDownloadURL().then((value) async {

        await metric.stop();

        json["picture"] = value;

        pet = PetModel.fromJson(json);
        return await updatePet(pet.toMap(image: value), null);

      });
    })
    .onError((handleError) {
      metric.stop();
      Session.crash.onError(handleError);
      throw ServerExceptions(handleError.toString());
    });

    return pet;

  }
}