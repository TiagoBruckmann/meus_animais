// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../../domain/repositories/destroy.dart' as _i3;
import '../../../../domain/repositories/get_hygiene.dart' as _i4;
import '../../../../domain/repositories/get_pets.dart' as _i5;
import '../../../../domain/repositories/get_user.dart' as _i6;
import '../../../../domain/repositories/get_vaccines.dart' as _i7;
import '../../../../domain/repositories/life_time.dart' as _i8;
import '../../../../domain/repositories/login.dart' as _i9;
import '../../../../domain/repositories/logout.dart' as _i10;
import '../../../../domain/repositories/register.dart' as _i11;
import '../../../../domain/repositories/set_hygiene.dart' as _i12;
import '../../../../domain/repositories/set_pet.dart' as _i13;
import '../../../../domain/repositories/set_vaccines.dart' as _i14;
import '../../../../domain/repositories/splash.dart' as _i15;
import '../manager/destroy.dart' as _i16;
import '../manager/get_hygiene.dart' as _i17;
import '../manager/get_pets.dart' as _i18;
import '../manager/get_user.dart' as _i19;
import '../manager/get_vaccines.dart' as _i20;
import '../manager/life_time.dart' as _i21;
import '../manager/login.dart' as _i22;
import '../manager/logout.dart' as _i23;
import '../manager/register.dart' as _i24;
import '../manager/set_hygiene.dart' as _i25;
import '../manager/set_pet.dart' as _i26;
import '../manager/set_vaccines.dart' as _i27;
import '../manager/splash.dart' as _i28;

const String _api = 'api';
const String _firebase = 'firebase';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.DestroyRepository>(() => _i3.LoginApi(), registerFor: {_api});
  gh.factory<_i3.DestroyRepository>(() => _i3.LoginFirebase(),
      registerFor: {_firebase});
  gh.factory<_i4.GetHygieneRepository>(() => _i4.GetHygieneFirebase(),
      registerFor: {_firebase});
  gh.factory<_i4.GetHygieneRepository>(() => _i4.GetHygieneApi(),
      registerFor: {_api});
  gh.factory<_i5.GetPetsRepository>(() => _i5.GetPetsApi(),
      registerFor: {_api});
  gh.factory<_i5.GetPetsRepository>(() => _i5.GetPetsFirebase(),
      registerFor: {_firebase});
  gh.factory<_i6.GetUserRepository>(() => _i6.GetUserFirebase(),
      registerFor: {_firebase});
  gh.factory<_i6.GetUserRepository>(() => _i6.GetUserApi(),
      registerFor: {_api});
  gh.factory<_i7.GetVaccinesRepository>(() => _i7.GetPetsFirebase(),
      registerFor: {_firebase});
  gh.factory<_i7.GetVaccinesRepository>(() => _i7.GetVaccinesApi(),
      registerFor: {_api});
  gh.factory<_i8.LifeTimeRepository>(() => _i8.LifeTimeFirebase(),
      registerFor: {_firebase});
  gh.factory<_i8.LifeTimeRepository>(() => _i8.LifeTimeApi(),
      registerFor: {_api});
  gh.factory<_i9.LoginRepository>(() => _i9.LoginFirebase(),
      registerFor: {_firebase});
  gh.factory<_i9.LoginRepository>(() => _i9.LoginApi(), registerFor: {_api});
  gh.factory<_i10.LogoutRepository>(() => _i10.LoginApi(), registerFor: {_api});
  gh.factory<_i10.LogoutRepository>(() => _i10.LoginFirebase(),
      registerFor: {_firebase});
  gh.factory<_i11.RegisterRepository>(() => _i11.RegisterFirebase(),
      registerFor: {_firebase});
  gh.factory<_i11.RegisterRepository>(() => _i11.RegisterApi(),
      registerFor: {_api});
  gh.factory<_i12.SetHygieneRepository>(() => _i12.SetHygieneFirebase(),
      registerFor: {_firebase});
  gh.factory<_i12.SetHygieneRepository>(() => _i12.SetHygieneApi(),
      registerFor: {_api});
  gh.factory<_i13.SetPetRepository>(() => _i13.SetPetApi(),
      registerFor: {_api});
  gh.factory<_i13.SetPetRepository>(() => _i13.SetPetFirebase(),
      registerFor: {_firebase});
  gh.factory<_i14.SetVaccinesRepository>(() => _i14.SetVaccinesFirebase(),
      registerFor: {_firebase});
  gh.factory<_i14.SetVaccinesRepository>(() => _i14.SetVaccinesApi(),
      registerFor: {_api});
  gh.factory<_i15.SplashRepository>(() => _i15.SplashApi(),
      registerFor: {_api});
  gh.factory<_i15.SplashRepository>(() => _i15.SplashFirebase(),
      registerFor: {_firebase});
  gh.lazySingleton<_i16.DestroyManager>(
      () => _i16.DestroyManager(get<_i3.DestroyRepository>()));
  gh.lazySingleton<_i17.GetHygieneManager>(
      () => _i17.GetHygieneManager(get<_i4.GetHygieneRepository>()));
  gh.lazySingleton<_i18.GetPetsManager>(
      () => _i18.GetPetsManager(get<_i5.GetPetsRepository>()));
  gh.lazySingleton<_i19.GetUserManager>(
      () => _i19.GetUserManager(get<_i6.GetUserRepository>()));
  gh.lazySingleton<_i20.GetVaccinesManager>(
      () => _i20.GetVaccinesManager(get<_i7.GetVaccinesRepository>()));
  gh.lazySingleton<_i21.LifeTimeManager>(
      () => _i21.LifeTimeManager(get<_i8.LifeTimeRepository>()));
  gh.lazySingleton<_i22.LoginManager>(
      () => _i22.LoginManager(get<_i9.LoginRepository>()));
  gh.lazySingleton<_i23.LogoutManager>(
      () => _i23.LogoutManager(get<_i10.LogoutRepository>()));
  gh.lazySingleton<_i24.RegisterManager>(
      () => _i24.RegisterManager(get<_i11.RegisterRepository>()));
  gh.lazySingleton<_i25.SetHygieneManager>(
      () => _i25.SetHygieneManager(get<_i12.SetHygieneRepository>()));
  gh.lazySingleton<_i26.SetPetManager>(
      () => _i26.SetPetManager(get<_i13.SetPetRepository>()));
  gh.lazySingleton<_i27.SetVaccineManager>(
      () => _i27.SetVaccineManager(get<_i14.SetVaccinesRepository>()));
  gh.lazySingleton<_i28.SplashManager>(
      () => _i28.SplashManager(get<_i15.SplashRepository>()));
  return get;
}
