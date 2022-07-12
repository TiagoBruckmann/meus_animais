// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../../domain/repositories/destroy.dart' as _i3;
import '../../../../domain/repositories/forgot.dart' as _i4;
import '../../../../domain/repositories/get_hygiene.dart' as _i5;
import '../../../../domain/repositories/get_pets.dart' as _i6;
import '../../../../domain/repositories/get_user.dart' as _i7;
import '../../../../domain/repositories/get_vaccines.dart' as _i8;
import '../../../../domain/repositories/life_time.dart' as _i9;
import '../../../../domain/repositories/login.dart' as _i10;
import '../../../../domain/repositories/logout.dart' as _i11;
import '../../../../domain/repositories/register.dart' as _i12;
import '../../../../domain/repositories/set_hygiene.dart' as _i13;
import '../../../../domain/repositories/set_pet.dart' as _i14;
import '../../../../domain/repositories/set_vaccines.dart' as _i15;
import '../../../../domain/repositories/splash.dart' as _i16;
import '../manager/destroy.dart' as _i17;
import '../manager/forgot.dart' as _i18;
import '../manager/get_hygiene.dart' as _i19;
import '../manager/get_pets.dart' as _i20;
import '../manager/get_user.dart' as _i21;
import '../manager/get_vaccines.dart' as _i22;
import '../manager/life_time.dart' as _i23;
import '../manager/login.dart' as _i24;
import '../manager/logout.dart' as _i25;
import '../manager/register.dart' as _i26;
import '../manager/set_hygiene.dart' as _i27;
import '../manager/set_pet.dart' as _i28;
import '../manager/set_vaccines.dart' as _i29;
import '../manager/splash.dart' as _i30;

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
  gh.factory<_i4.ForgotRepository>(() => _i4.LoginFirebase(),
      registerFor: {_firebase});
  gh.factory<_i4.ForgotRepository>(() => _i4.LoginApi(), registerFor: {_api});
  gh.factory<_i5.GetHygieneRepository>(() => _i5.GetHygieneFirebase(),
      registerFor: {_firebase});
  gh.factory<_i5.GetHygieneRepository>(() => _i5.GetHygieneApi(),
      registerFor: {_api});
  gh.factory<_i6.GetPetsRepository>(() => _i6.GetPetsFirebase(),
      registerFor: {_firebase});
  gh.factory<_i6.GetPetsRepository>(() => _i6.GetPetsApi(),
      registerFor: {_api});
  gh.factory<_i7.GetUserRepository>(() => _i7.GetUserFirebase(),
      registerFor: {_firebase});
  gh.factory<_i7.GetUserRepository>(() => _i7.GetUserApi(),
      registerFor: {_api});
  gh.factory<_i8.GetVaccinesRepository>(() => _i8.GetPetsFirebase(),
      registerFor: {_firebase});
  gh.factory<_i8.GetVaccinesRepository>(() => _i8.GetVaccinesApi(),
      registerFor: {_api});
  gh.factory<_i9.LifeTimeRepository>(() => _i9.LifeTimeFirebase(),
      registerFor: {_firebase});
  gh.factory<_i9.LifeTimeRepository>(() => _i9.LifeTimeApi(),
      registerFor: {_api});
  gh.factory<_i10.LoginRepository>(() => _i10.LoginApi(), registerFor: {_api});
  gh.factory<_i10.LoginRepository>(() => _i10.LoginFirebase(),
      registerFor: {_firebase});
  gh.factory<_i11.LogoutRepository>(() => _i11.LogoutApi(),
      registerFor: {_api});
  gh.factory<_i11.LogoutRepository>(() => _i11.LogoutFirebase(),
      registerFor: {_firebase});
  gh.factory<_i12.RegisterRepository>(() => _i12.RegisterFirebase(),
      registerFor: {_firebase});
  gh.factory<_i12.RegisterRepository>(() => _i12.RegisterApi(),
      registerFor: {_api});
  gh.factory<_i13.SetHygieneRepository>(() => _i13.SetHygieneFirebase(),
      registerFor: {_firebase});
  gh.factory<_i13.SetHygieneRepository>(() => _i13.SetHygieneApi(),
      registerFor: {_api});
  gh.factory<_i14.SetPetRepository>(() => _i14.SetPetFirebase(),
      registerFor: {_firebase});
  gh.factory<_i14.SetPetRepository>(() => _i14.SetPetApi(),
      registerFor: {_api});
  gh.factory<_i15.SetVaccinesRepository>(() => _i15.SetVaccinesFirebase(),
      registerFor: {_firebase});
  gh.factory<_i15.SetVaccinesRepository>(() => _i15.SetVaccinesApi(),
      registerFor: {_api});
  gh.factory<_i16.SplashRepository>(() => _i16.SplashApi(),
      registerFor: {_api});
  gh.factory<_i16.SplashRepository>(() => _i16.SplashFirebase(),
      registerFor: {_firebase});
  gh.lazySingleton<_i17.DestroyManager>(
      () => _i17.DestroyManager(get<_i3.DestroyRepository>()));
  gh.lazySingleton<_i18.ForgotManager>(
      () => _i18.ForgotManager(get<_i4.ForgotRepository>()));
  gh.lazySingleton<_i19.GetHygieneManager>(
      () => _i19.GetHygieneManager(get<_i5.GetHygieneRepository>()));
  gh.lazySingleton<_i20.GetPetsManager>(
      () => _i20.GetPetsManager(get<_i6.GetPetsRepository>()));
  gh.lazySingleton<_i21.GetUserManager>(
      () => _i21.GetUserManager(get<_i7.GetUserRepository>()));
  gh.lazySingleton<_i22.GetVaccinesManager>(
      () => _i22.GetVaccinesManager(get<_i8.GetVaccinesRepository>()));
  gh.lazySingleton<_i23.LifeTimeManager>(
      () => _i23.LifeTimeManager(get<_i9.LifeTimeRepository>()));
  gh.lazySingleton<_i24.LoginManager>(
      () => _i24.LoginManager(get<_i10.LoginRepository>()));
  gh.lazySingleton<_i25.LogoutManager>(
      () => _i25.LogoutManager(get<_i11.LogoutRepository>()));
  gh.lazySingleton<_i26.RegisterManager>(
      () => _i26.RegisterManager(get<_i12.RegisterRepository>()));
  gh.lazySingleton<_i27.SetHygieneManager>(
      () => _i27.SetHygieneManager(get<_i13.SetHygieneRepository>()));
  gh.lazySingleton<_i28.SetPetManager>(
      () => _i28.SetPetManager(get<_i14.SetPetRepository>()));
  gh.lazySingleton<_i29.SetVaccineManager>(
      () => _i29.SetVaccineManager(get<_i15.SetVaccinesRepository>()));
  gh.lazySingleton<_i30.SplashManager>(
      () => _i30.SplashManager(get<_i16.SplashRepository>()));
  return get;
}
