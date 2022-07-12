// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../../domain/repositories/destroy.dart' as _i3;
import '../../../../domain/repositories/forgot.dart' as _i4;
import '../../../../domain/repositories/get_hygiene.dart' as _i6;
import '../../../../domain/repositories/get_hygiene_pets.dart' as _i5;
import '../../../../domain/repositories/get_pets.dart' as _i7;
import '../../../../domain/repositories/get_user.dart' as _i8;
import '../../../../domain/repositories/get_vaccines.dart' as _i9;
import '../../../../domain/repositories/life_time.dart' as _i10;
import '../../../../domain/repositories/login.dart' as _i11;
import '../../../../domain/repositories/logout.dart' as _i12;
import '../../../../domain/repositories/register.dart' as _i13;
import '../../../../domain/repositories/set_hygiene.dart' as _i14;
import '../../../../domain/repositories/set_pet.dart' as _i15;
import '../../../../domain/repositories/set_vaccines.dart' as _i16;
import '../../../../domain/repositories/splash.dart' as _i17;
import '../../../../domain/repositories/update_pet.dart' as _i18;
import '../manager/destroy.dart' as _i19;
import '../manager/forgot.dart' as _i20;
import '../manager/get_hygiene.dart' as _i21;
import '../manager/get_hygiene_pets.dart' as _i22;
import '../manager/get_pets.dart' as _i23;
import '../manager/get_user.dart' as _i24;
import '../manager/get_vaccines.dart' as _i25;
import '../manager/life_time.dart' as _i26;
import '../manager/login.dart' as _i27;
import '../manager/logout.dart' as _i28;
import '../manager/register.dart' as _i29;
import '../manager/set_hygiene.dart' as _i30;
import '../manager/set_pet.dart' as _i31;
import '../manager/set_vaccines.dart' as _i32;
import '../manager/splash.dart' as _i33;
import '../manager/update_pets.dart' as _i34;

const String _firebase = 'firebase';
const String _api = 'api';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.DestroyRepository>(() => _i3.LoginFirebase(),
      registerFor: {_firebase});
  gh.factory<_i3.DestroyRepository>(() => _i3.LoginApi(), registerFor: {_api});
  gh.factory<_i4.ForgotRepository>(() => _i4.LoginFirebase(),
      registerFor: {_firebase});
  gh.factory<_i4.ForgotRepository>(() => _i4.LoginApi(), registerFor: {_api});
  gh.factory<_i5.GetHygienePetsRepository>(() => _i5.GetHygienePetsFirebase(),
      registerFor: {_firebase});
  gh.factory<_i5.GetHygienePetsRepository>(() => _i5.GetHygienePetsApi(),
      registerFor: {_api});
  gh.factory<_i6.GetHygieneRepository>(() => _i6.GetHygieneFirebase(),
      registerFor: {_firebase});
  gh.factory<_i6.GetHygieneRepository>(() => _i6.GetHygieneApi(),
      registerFor: {_api});
  gh.factory<_i7.GetPetsRepository>(() => _i7.GetPetsFirebase(),
      registerFor: {_firebase});
  gh.factory<_i7.GetPetsRepository>(() => _i7.GetPetsApi(),
      registerFor: {_api});
  gh.factory<_i8.GetUserRepository>(() => _i8.GetUserFirebase(),
      registerFor: {_firebase});
  gh.factory<_i8.GetUserRepository>(() => _i8.GetUserApi(),
      registerFor: {_api});
  gh.factory<_i9.GetVaccinesRepository>(() => _i9.GetVaccinesApi(),
      registerFor: {_api});
  gh.factory<_i9.GetVaccinesRepository>(() => _i9.GetPetsFirebase(),
      registerFor: {_firebase});
  gh.factory<_i10.LifeTimeRepository>(() => _i10.LifeTimeFirebase(),
      registerFor: {_firebase});
  gh.factory<_i10.LifeTimeRepository>(() => _i10.LifeTimeApi(),
      registerFor: {_api});
  gh.factory<_i11.LoginRepository>(() => _i11.LoginFirebase(),
      registerFor: {_firebase});
  gh.factory<_i11.LoginRepository>(() => _i11.LoginApi(), registerFor: {_api});
  gh.factory<_i12.LogoutRepository>(() => _i12.LogoutApi(),
      registerFor: {_api});
  gh.factory<_i12.LogoutRepository>(() => _i12.LogoutFirebase(),
      registerFor: {_firebase});
  gh.factory<_i13.RegisterRepository>(() => _i13.RegisterFirebase(),
      registerFor: {_firebase});
  gh.factory<_i13.RegisterRepository>(() => _i13.RegisterApi(),
      registerFor: {_api});
  gh.factory<_i14.SetHygieneRepository>(() => _i14.SetHygieneApi(),
      registerFor: {_api});
  gh.factory<_i14.SetHygieneRepository>(() => _i14.SetHygieneFirebase(),
      registerFor: {_firebase});
  gh.factory<_i15.SetPetRepository>(() => _i15.SetPetApi(),
      registerFor: {_api});
  gh.factory<_i15.SetPetRepository>(() => _i15.SetPetFirebase(),
      registerFor: {_firebase});
  gh.factory<_i16.SetVaccinesRepository>(() => _i16.SetVaccinesFirebase(),
      registerFor: {_firebase});
  gh.factory<_i16.SetVaccinesRepository>(() => _i16.SetVaccinesApi(),
      registerFor: {_api});
  gh.factory<_i17.SplashRepository>(() => _i17.SplashApi(),
      registerFor: {_api});
  gh.factory<_i17.SplashRepository>(() => _i17.SplashFirebase(),
      registerFor: {_firebase});
  gh.factory<_i18.UpdatePetRepository>(() => _i18.SetPetApi(),
      registerFor: {_api});
  gh.factory<_i18.UpdatePetRepository>(() => _i18.SetPetFirebase(),
      registerFor: {_firebase});
  gh.lazySingleton<_i19.DestroyManager>(
      () => _i19.DestroyManager(get<_i3.DestroyRepository>()));
  gh.lazySingleton<_i20.ForgotManager>(
      () => _i20.ForgotManager(get<_i4.ForgotRepository>()));
  gh.lazySingleton<_i21.GetHygieneManager>(
      () => _i21.GetHygieneManager(get<_i6.GetHygieneRepository>()));
  gh.lazySingleton<_i22.GetHygienePetsManager>(
      () => _i22.GetHygienePetsManager(get<_i5.GetHygienePetsRepository>()));
  gh.lazySingleton<_i23.GetPetsManager>(
      () => _i23.GetPetsManager(get<_i7.GetPetsRepository>()));
  gh.lazySingleton<_i24.GetUserManager>(
      () => _i24.GetUserManager(get<_i8.GetUserRepository>()));
  gh.lazySingleton<_i25.GetVaccinesManager>(
      () => _i25.GetVaccinesManager(get<_i9.GetVaccinesRepository>()));
  gh.lazySingleton<_i26.LifeTimeManager>(
      () => _i26.LifeTimeManager(get<_i10.LifeTimeRepository>()));
  gh.lazySingleton<_i27.LoginManager>(
      () => _i27.LoginManager(get<_i11.LoginRepository>()));
  gh.lazySingleton<_i28.LogoutManager>(
      () => _i28.LogoutManager(get<_i12.LogoutRepository>()));
  gh.lazySingleton<_i29.RegisterManager>(
      () => _i29.RegisterManager(get<_i13.RegisterRepository>()));
  gh.lazySingleton<_i30.SetHygieneManager>(
      () => _i30.SetHygieneManager(get<_i14.SetHygieneRepository>()));
  gh.lazySingleton<_i31.SetPetManager>(
      () => _i31.SetPetManager(get<_i15.SetPetRepository>()));
  gh.lazySingleton<_i32.SetVaccineManager>(
      () => _i32.SetVaccineManager(get<_i16.SetVaccinesRepository>()));
  gh.lazySingleton<_i33.SplashManager>(
      () => _i33.SplashManager(get<_i17.SplashRepository>()));
  gh.lazySingleton<_i34.UpdatePetManager>(
      () => _i34.UpdatePetManager(get<_i18.UpdatePetRepository>()));
  return get;
}
