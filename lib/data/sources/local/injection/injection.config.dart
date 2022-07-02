// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../../domain/repositories/get_pets.dart' as _i3;
import '../../../../domain/repositories/get_user.dart' as _i4;
import '../../../../domain/repositories/get_vaccines.dart' as _i5;
import '../../../../domain/repositories/login.dart' as _i6;
import '../../../../domain/repositories/register.dart' as _i7;
import '../../../../domain/repositories/set_pet.dart' as _i8;
import '../../../../domain/repositories/set_vaccines.dart' as _i9;
import '../manager/get_pets.dart' as _i10;
import '../manager/get_user.dart' as _i11;
import '../manager/get_vaccines.dart' as _i12;
import '../manager/login.dart' as _i13;
import '../manager/register.dart' as _i14;
import '../manager/set_pet.dart' as _i15;
import '../manager/set_vaccines.dart' as _i16;

const String _firebase = 'firebase';
const String _api = 'api';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.GetPetsRepository>(() => _i3.GetPetsFirebase(),
      registerFor: {_firebase});
  gh.factory<_i3.GetPetsRepository>(() => _i3.GetPetsApi(),
      registerFor: {_api});
  gh.factory<_i4.GetUserRepository>(() => _i4.GetUserFirebase(),
      registerFor: {_firebase});
  gh.factory<_i4.GetUserRepository>(() => _i4.GetUserApi(),
      registerFor: {_api});
  gh.factory<_i5.GetVaccinesRepository>(() => _i5.GetPetsFirebase(),
      registerFor: {_firebase});
  gh.factory<_i5.GetVaccinesRepository>(() => _i5.GetVaccinesApi(),
      registerFor: {_api});
  gh.factory<_i6.LoginRepository>(() => _i6.LoginFirebase(),
      registerFor: {_firebase});
  gh.factory<_i6.LoginRepository>(() => _i6.LoginApi(), registerFor: {_api});
  gh.factory<_i7.RegisterRepository>(() => _i7.RegisterFirebase(),
      registerFor: {_firebase});
  gh.factory<_i7.RegisterRepository>(() => _i7.RegisterApi(),
      registerFor: {_api});
  gh.factory<_i8.SetPetRepository>(() => _i8.SetPetFirebase(),
      registerFor: {_firebase});
  gh.factory<_i8.SetPetRepository>(() => _i8.SetPetApi(), registerFor: {_api});
  gh.factory<_i9.SetVaccinesRepository>(() => _i9.SetVaccinesFirebase(),
      registerFor: {_firebase});
  gh.factory<_i9.SetVaccinesRepository>(() => _i9.SetVaccinesApi(),
      registerFor: {_api});
  gh.lazySingleton<_i10.GetPetsManager>(
      () => _i10.GetPetsManager(get<_i3.GetPetsRepository>()));
  gh.lazySingleton<_i11.GetUserManager>(
      () => _i11.GetUserManager(get<_i4.GetUserRepository>()));
  gh.lazySingleton<_i12.GetVaccinesManager>(
      () => _i12.GetVaccinesManager(get<_i5.GetVaccinesRepository>()));
  gh.lazySingleton<_i13.LoginManager>(
      () => _i13.LoginManager(get<_i6.LoginRepository>()));
  gh.lazySingleton<_i14.RegisterManager>(
      () => _i14.RegisterManager(get<_i7.RegisterRepository>()));
  gh.lazySingleton<_i15.SetPetManager>(
      () => _i15.SetPetManager(get<_i8.SetPetRepository>()));
  gh.lazySingleton<_i16.SetVaccineManager>(
      () => _i16.SetVaccineManager(get<_i9.SetVaccinesRepository>()));
  return get;
}
