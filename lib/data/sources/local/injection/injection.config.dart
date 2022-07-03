// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../../domain/repositories/get_pets.dart' as _i3;
import '../../../../domain/repositories/get_user.dart' as _i4;
import '../../../../domain/repositories/get_vaccines.dart' as _i5;
import '../../../../domain/repositories/life_time.dart' as _i6;
import '../../../../domain/repositories/login.dart' as _i7;
import '../../../../domain/repositories/register.dart' as _i8;
import '../../../../domain/repositories/set_pet.dart' as _i9;
import '../../../../domain/repositories/set_vaccines.dart' as _i10;
import '../manager/get_pets.dart' as _i11;
import '../manager/get_user.dart' as _i12;
import '../manager/get_vaccines.dart' as _i13;
import '../manager/life_time.dart' as _i14;
import '../manager/login.dart' as _i15;
import '../manager/register.dart' as _i16;
import '../manager/set_pet.dart' as _i17;
import '../manager/set_vaccines.dart' as _i18;

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
  gh.factory<_i6.LifeTimeRepository>(() => _i6.LifeTimeFirebase(),
      registerFor: {_firebase});
  gh.factory<_i6.LifeTimeRepository>(() => _i6.LifeTimeApi(),
      registerFor: {_api});
  gh.factory<_i7.LoginRepository>(() => _i7.LoginFirebase(),
      registerFor: {_firebase});
  gh.factory<_i7.LoginRepository>(() => _i7.LoginApi(), registerFor: {_api});
  gh.factory<_i8.RegisterRepository>(() => _i8.RegisterFirebase(),
      registerFor: {_firebase});
  gh.factory<_i8.RegisterRepository>(() => _i8.RegisterApi(),
      registerFor: {_api});
  gh.factory<_i9.SetPetRepository>(() => _i9.SetPetFirebase(),
      registerFor: {_firebase});
  gh.factory<_i9.SetPetRepository>(() => _i9.SetPetApi(), registerFor: {_api});
  gh.factory<_i10.SetVaccinesRepository>(() => _i10.SetVaccinesFirebase(),
      registerFor: {_firebase});
  gh.factory<_i10.SetVaccinesRepository>(() => _i10.SetVaccinesApi(),
      registerFor: {_api});
  gh.lazySingleton<_i11.GetPetsManager>(
      () => _i11.GetPetsManager(get<_i3.GetPetsRepository>()));
  gh.lazySingleton<_i12.GetUserManager>(
      () => _i12.GetUserManager(get<_i4.GetUserRepository>()));
  gh.lazySingleton<_i13.GetVaccinesManager>(
      () => _i13.GetVaccinesManager(get<_i5.GetVaccinesRepository>()));
  gh.lazySingleton<_i14.LifeTimeManager>(
      () => _i14.LifeTimeManager(get<_i6.LifeTimeRepository>()));
  gh.lazySingleton<_i15.LoginManager>(
      () => _i15.LoginManager(get<_i7.LoginRepository>()));
  gh.lazySingleton<_i16.RegisterManager>(
      () => _i16.RegisterManager(get<_i8.RegisterRepository>()));
  gh.lazySingleton<_i17.SetPetManager>(
      () => _i17.SetPetManager(get<_i9.SetPetRepository>()));
  gh.lazySingleton<_i18.SetVaccineManager>(
      () => _i18.SetVaccineManager(get<_i10.SetVaccinesRepository>()));
  return get;
}
