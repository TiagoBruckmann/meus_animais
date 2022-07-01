// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../../domain/repositories/get_user.dart' as _i3;
import '../../../../domain/repositories/login.dart' as _i4;
import '../../../../domain/repositories/register.dart' as _i5;
import '../manager/get_user.dart' as _i6;
import '../manager/login.dart' as _i7;
import '../manager/register.dart' as _i8;

const String _firebase = 'firebase';
const String _api = 'api';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.GetUserRepository>(() => _i3.GetUserFirebase(),
      registerFor: {_firebase});
  gh.factory<_i3.GetUserRepository>(() => _i3.GetUserApi(),
      registerFor: {_api});
  gh.factory<_i4.LoginRepository>(() => _i4.LoginFirebase(),
      registerFor: {_firebase});
  gh.factory<_i4.LoginRepository>(() => _i4.LoginApi(), registerFor: {_api});
  gh.factory<_i5.RegisterRepository>(() => _i5.RegisterFirebase(),
      registerFor: {_firebase});
  gh.factory<_i5.RegisterRepository>(() => _i5.RegisterApi(),
      registerFor: {_api});
  gh.lazySingleton<_i6.GetUserManager>(
      () => _i6.GetUserManager(get<_i3.GetUserRepository>()));
  gh.lazySingleton<_i7.LoginManager>(
      () => _i7.LoginManager(get<_i4.LoginRepository>()));
  gh.lazySingleton<_i8.RegisterManager>(
      () => _i8.RegisterManager(get<_i5.RegisterRepository>()));
  return get;
}
