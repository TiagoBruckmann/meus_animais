// import do domain
import 'package:meus_animais/domain/usecases/service_use_case.dart';
import 'package:meus_animais/domain/repositories/service_repo.dart';
import 'package:meus_animais/domain/repositories/user_repo.dart';
import 'package:meus_animais/domain/usecases/auth_use_case.dart';
import 'package:meus_animais/domain/repositories/auth_repo.dart';
import 'package:meus_animais/domain/usecases/pet_use_case.dart';
import 'package:meus_animais/domain/repositories/pet_repo.dart';
import 'package:meus_animais/domain/usecases/user_usecase.dart';

// import do data

import 'package:meus_animais/data/datasource/service_remote_datasource.dart';
import 'package:meus_animais/data/datasource/auth_remote_datasource.dart';
import 'package:meus_animais/data/datasource/user_remote_datasource.dart';
import 'package:meus_animais/data/datasource/pet_remote_datasource.dart';
import 'package:meus_animais/data/repositories/service_repo_impl.dart';
import 'package:meus_animais/data/repositories/auth_repo_impl.dart';
import 'package:meus_animais/data/repositories/user_repo_impl.dart';
import 'package:meus_animais/data/repositories/pet_repo_impl.dart';

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
  getIt.registerFactory(() => ServiceUseCase(getIt()));
  getIt.registerFactory(() => AuthUseCase(getIt()));
  getIt.registerFactory(() => UserUseCase(getIt()));
  getIt.registerFactory(() => PetUseCase(getIt()));

  // data
  getIt.registerFactory<UserRemoteDatasource>(() => UserRemoteSourceImpl(getIt(), getIt(), getIt()));
  getIt.registerFactory<AuthRemoteDatasource>(() => AuthRemoteDatasourceImpl(getIt(), getIt()));
  getIt.registerFactory<ServiceRemoteDatasource>(() => ServiceRemoteDatasourceImpl(getIt()));
  getIt.registerFactory<PetRemoteDatasource>(() => PetRemoteSourceImpl(getIt(), getIt()));
  getIt.registerFactory<ServiceRepo>(() => ServiceRepoImpl(getIt()));
  getIt.registerFactory<AuthRepo>(() => AuthRepoImpl(getIt()));
  getIt.registerFactory<UserRepo>(() => UserRepoImpl(getIt()));
  getIt.registerFactory<PetRepo>(() => PetRepoImpl(getIt()));

  // extern
  getIt.registerFactory(() => FirebaseFirestore.instance);
  getIt.registerFactory(() => FirebaseAuth.instance);
  getIt.registerFactory(() => http.Client());

}