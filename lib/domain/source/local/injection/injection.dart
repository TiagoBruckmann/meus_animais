// import do domain

// import do data

// import dos pacotes
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

@InjectableInit()
void configureDependencies() {

  // domain
  // getIt.registerFactory(() => UserUseCase(getIt()));

  // data
  // getIt.registerFactory<UserRemoteDatasource>(() => UserRemoteSourceImpl(getIt(), getIt(), getIt()));
  // getIt.registerFactory<UserRepo>(() => UserRepoImpl(getIt()));

  // extern
  getIt.registerFactory(() => FirebaseFirestore.instance);
  getIt.registerFactory(() => FirebaseAuth.instance);
  getIt.registerFactory(() => http.Client());

}