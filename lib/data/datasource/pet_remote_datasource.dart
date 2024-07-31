// imports globais
import 'package:meus_animais/session.dart';
import 'dart:io';

// import dos domain
import 'package:meus_animais/domain/entities/hygiene_pet.dart';

// import dos data
import 'package:meus_animais/data/models/hygiene_pet_model.dart';
import 'package:meus_animais/data/models/life_time_model.dart';
import 'package:meus_animais/data/exceptions/exceptions.dart';
import 'package:meus_animais/data/models/pet_model.dart';

// import dos pacotess
import 'package:firebase_performance/firebase_performance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class PetRemoteDatasource {

  Future<List<PetModel>> getPets();
  Future<void> setPet( Map<String, dynamic> json );
  Future<void> updatePet( Map<String, dynamic> json );
  Future<List<LifeTimeModel>> getLifeTime();
  Future<List<HygienePetModel>> getHygiene( String petId );
  Future<void> setHygiene( List<HygienePetEntity> list );

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
  Future<void> setPet( Map<String, dynamic> json ) async {

  }

  @override
  Future<void> updatePet( Map<String, dynamic> json ) async {

    final user = auth.currentUser;
    if ( user == null ) {
      const errorMessage = "NULL user - Update Pet";
      Session.crash.onError("update_pet", error: errorMessage);
      throw ServerExceptions(errorMessage);
    }

    final metric = Session.performance.newHttpMetric("update-pet", HttpMethod.Put);
    await metric.start();

    await db.collection("pets")
      .doc(json["id"])
      .update(json)
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
  Future<List<HygienePetModel>> getHygiene( String petId ) async {

    final metric = Session.performance.newHttpMetric("get-hygiene-pet-$petId", HttpMethod.Get);
    await metric.start();

    final List<HygienePetModel> list = [];

    await db.collection("pets")
      .doc(petId)
      .collection("hygiene")
      .get()
      .then((value) {

        metric.stop();

        for ( final item in value.docs ) {
          list.add(HygienePetModel.fromJson(item));
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
  Future<void> setHygiene( List<HygienePetEntity> list ) async {

    for ( final item in list ) {

      final metric = Session.performance.newHttpMetric("set-hygiene-pet-${item.id}", HttpMethod.Post);
      await metric.start();

      await db.collection("pets")
        .doc(item.petId)
        .collection("hygiene")
        .doc(item.id)
        .set(item.toMap());

      await metric.stop();

    }

  }

}