// imports globais
import 'package:meus_animais/session.dart';

// import dos data
import 'package:meus_animais/data/exceptions/exceptions.dart';
import 'package:meus_animais/data/models/service_model.dart';

// import dos pacotess
import 'package:firebase_performance/firebase_performance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ServiceRemoteDatasource {

  Future<List<ServiceModel>> getServices();

}

class ServiceRemoteDatasourceImpl implements ServiceRemoteDatasource {
  final FirebaseFirestore db;
  ServiceRemoteDatasourceImpl( this.db );

  @override
  Future<List<ServiceModel>> getServices() async {

    final List<ServiceModel> list = [];

    final metric = Session.performance.newHttpMetric("get-services", HttpMethod.Get);
    await metric.start();

    await db.collection("hygiene")
      .get()
      .then((value) {

        metric.stop();
        for ( final item in value.docs ) {
          list.add(ServiceModel.fromJson(item));
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

}