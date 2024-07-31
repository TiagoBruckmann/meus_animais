// import do domain
import 'package:meus_animais/domain/repositories/auth_repo.dart';
import 'package:meus_animais/domain/repositories/user_repo.dart';
import 'package:meus_animais/domain/usecases/auth_use_case.dart';
import 'package:meus_animais/domain/usecases/user_usecase.dart';

// import do data
import 'package:meus_animais/data/datasource/auth_remote_datasource.dart';
import 'package:meus_animais/data/datasource/user_remote_datasource.dart';
import 'package:meus_animais/data/repositories/auth_repo_impl.dart';
import 'package:meus_animais/data/repositories/user_repo_impl.dart';

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
  getIt.registerFactory(() => AuthUseCase(getIt()));
  getIt.registerFactory(() => UserUseCase(getIt()));

  // data
  getIt.registerFactory<UserRemoteDatasource>(() => UserRemoteSourceImpl(getIt(), getIt(), getIt()));
  getIt.registerFactory<AuthRemoteDatasource>(() => AuthRemoteDatasourceImpl(getIt(), getIt()));
  getIt.registerFactory<AuthRepo>(() => AuthRepoImpl(getIt()));
  getIt.registerFactory<UserRepo>(() => UserRepoImpl(getIt()));

  // extern
  getIt.registerFactory(() => FirebaseFirestore.instance);
  getIt.registerFactory(() => FirebaseAuth.instance);
  getIt.registerFactory(() => http.Client());

}