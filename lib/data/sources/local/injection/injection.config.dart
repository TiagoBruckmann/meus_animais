// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../../domain/repositories/get_hygiene.dart' as _i3;
import '../../../../domain/repositories/get_pets.dart' as _i4;
import '../../../../domain/repositories/get_user.dart' as _i5;
import '../../../../domain/repositories/get_vaccines.dart' as _i6;
import '../../../../domain/repositories/life_time.dart' as _i7;
import '../../../../domain/repositories/login.dart' as _i8;
import '../../../../domain/repositories/register.dart' as _i9;
import '../../../../domain/repositories/set_hygiene.dart' as _i10;
import '../../../../domain/repositories/set_pet.dart' as _i11;
import '../../../../domain/repositories/set_vaccines.dart' as _i12;
import '../../../../domain/repositories/splash.dart' as _i13;
import '../manager/get_hygiene.dart' as _i14;
import '../manager/get_pets.dart' as _i15;
import '../manager/get_user.dart' as _i16;
import '../manager/get_vaccines.dart' as _i17;
import '../manager/life_time.dart' as _i18;
import '../manager/login.dart' as _i19;
import '../manager/register.dart' as _i20;
import '../manager/set_hygiene.dart' as _i21;
import '../manager/set_pet.dart' as _i22;
import '../manager/set_vaccines.dart' as _i23;
import '../manager/splash.dart' as _i24;

const String _firebase = 'firebase';
const String _api = 'api';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.GetHygieneRepository>(() => _i3.GetHygieneFirebase(),
      registerFor: {_firebase});
  gh.factory<_i3.GetHygieneRepository>(() => _i3.GetHygieneApi(),
      registerFor: {_api});
  gh.factory<_i4.GetPetsRepository>(() => _i4.GetPetsFirebase(),
      registerFor: {_firebase});
  gh.factory<_i4.GetPetsRepository>(() => _i4.GetPetsApi(),
      registerFor: {_api});
  gh.factory<_i5.GetUserRepository>(() => _i5.GetUserFirebase(),
      registerFor: {_firebase});
  gh.factory<_i5.GetUserRepository>(() => _i5.GetUserApi(),
      registerFor: {_api});
  gh.factory<_i6.GetVaccinesRepository>(() => _i6.GetPetsFirebase(),
      registerFor: {_firebase});
  gh.factory<_i6.GetVaccinesRepository>(() => _i6.GetVaccinesApi(),
      registerFor: {_api});
  gh.factory<_i7.LifeTimeRepository>(() => _i7.LifeTimeFirebase(),
      registerFor: {_firebase});
  gh.factory<_i7.LifeTimeRepository>(() => _i7.LifeTimeApi(),
      registerFor: {_api});
  gh.factory<_i8.LoginRepository>(() => _i8.LoginFirebase(),
      registerFor: {_firebase});
  gh.factory<_i8.LoginRepository>(() => _i8.LoginApi(), registerFor: {_api});
  gh.factory<_i9.RegisterRepository>(() => _i9.RegisterFirebase(),
      registerFor: {_firebase});
  gh.factory<_i9.RegisterRepository>(() => _i9.RegisterApi(),
      registerFor: {_api});
  gh.factory<_i10.SetHygieneRepository>(() => _i10.SetHygieneFirebase(),
      registerFor: {_firebase});
  gh.factory<_i10.SetHygieneRepository>(() => _i10.SetHygieneApi(),
      registerFor: {_api});
  gh.factory<_i11.SetPetRepository>(() => _i11.SetPetFirebase(),
      registerFor: {_firebase});
  gh.factory<_i11.SetPetRepository>(() => _i11.SetPetApi(),
      registerFor: {_api});
  gh.factory<_i12.SetVaccinesRepository>(() => _i12.SetVaccinesFirebase(),
      registerFor: {_firebase});
  gh.factory<_i12.SetVaccinesRepository>(() => _i12.SetVaccinesApi(),
      registerFor: {_api});
  gh.factory<_i13.SplashRepository>(() => _i13.SplashFirebase(),
      registerFor: {_firebase});
  gh.factory<_i13.SplashRepository>(() => _i13.SplashApi(),
      registerFor: {_api});
  gh.lazySingleton<_i14.GetHygieneManager>(
      () => _i14.GetHygieneManager(get<_i3.GetHygieneRepository>()));
  gh.lazySingleton<_i15.GetPetsManager>(
      () => _i15.GetPetsManager(get<_i4.GetPetsRepository>()));
  gh.lazySingleton<_i16.GetUserManager>(
      () => _i16.GetUserManager(get<_i5.GetUserRepository>()));
  gh.lazySingleton<_i17.GetVaccinesManager>(
      () => _i17.GetVaccinesManager(get<_i6.GetVaccinesRepository>()));
  gh.lazySingleton<_i18.LifeTimeManager>(
      () => _i18.LifeTimeManager(get<_i7.LifeTimeRepository>()));
  gh.lazySingleton<_i19.LoginManager>(
      () => _i19.LoginManager(get<_i8.LoginRepository>()));
  gh.lazySingleton<_i20.RegisterManager>(
      () => _i20.RegisterManager(get<_i9.RegisterRepository>()));
  gh.lazySingleton<_i21.SetHygieneManager>(
      () => _i21.SetHygieneManager(get<_i10.SetHygieneRepository>()));
  gh.lazySingleton<_i22.SetPetManager>(
      () => _i22.SetPetManager(get<_i11.SetPetRepository>()));
  gh.lazySingleton<_i23.SetVaccineManager>(
      () => _i23.SetVaccineManager(get<_i12.SetVaccinesRepository>()));
  gh.lazySingleton<_i24.SplashManager>(
      () => _i24.SplashManager(get<_i13.SplashRepository>()));
  return get;
}
