// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
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
import '../../../../domain/repositories/show_notifications.dart' as _i17;
import '../../../../domain/repositories/splash.dart' as _i18;
import '../../../../domain/repositories/update_pet.dart' as _i19;
import '../manager/destroy.dart' as _i20;
import '../manager/forgot.dart' as _i21;
import '../manager/get_hygiene.dart' as _i22;
import '../manager/get_hygiene_pets.dart' as _i23;
import '../manager/get_pets.dart' as _i24;
import '../manager/get_user.dart' as _i25;
import '../manager/get_vaccines.dart' as _i26;
import '../manager/life_time.dart' as _i27;
import '../manager/login.dart' as _i28;
import '../manager/logout.dart' as _i29;
import '../manager/register.dart' as _i30;
import '../manager/set_hygiene.dart' as _i31;
import '../manager/set_pet.dart' as _i32;
import '../manager/set_vaccines.dart' as _i33;
import '../manager/show_notification.dart' as _i34;
import '../manager/splash.dart' as _i35;
import '../manager/update_pets.dart' as _i36;

const String _firebase = 'firebase';
const String _api = 'api';
const String _test = 'test';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.DestroyRepository>(() => _i3.DestroyFirebase(),
      registerFor: {_firebase});
  gh.factory<_i3.DestroyRepository>(() => _i3.DestroyApi(),
      registerFor: {_api});
  gh.factory<_i3.DestroyRepository>(() => _i3.DestroyDest(),
      registerFor: {_test});
  gh.factory<_i4.ForgotRepository>(() => _i4.ForgotFirebase(),
      registerFor: {_firebase});
  gh.factory<_i4.ForgotRepository>(() => _i4.ForgotApi(), registerFor: {_api});
  gh.factory<_i4.ForgotRepository>(() => _i4.ForgotTest(),
      registerFor: {_test});
  gh.factory<_i5.GetHygienePetsRepository>(() => _i5.GetHygienePetsFirebase(),
      registerFor: {_firebase});
  gh.factory<_i5.GetHygienePetsRepository>(() => _i5.GetHygienePetsApi(),
      registerFor: {_api});
  gh.factory<_i5.GetHygienePetsRepository>(() => _i5.GetHygienePetsTest(),
      registerFor: {_test});
  gh.factory<_i6.GetHygieneRepository>(() => _i6.GetHygieneFirebase(),
      registerFor: {_firebase});
  gh.factory<_i6.GetHygieneRepository>(() => _i6.GetHygieneApi(),
      registerFor: {_api});
  gh.factory<_i6.GetHygieneRepository>(() => _i6.GetHygieneTest(),
      registerFor: {_test});
  gh.factory<_i7.GetPetsRepository>(() => _i7.GetPetsFirebase(),
      registerFor: {_firebase});
  gh.factory<_i7.GetPetsRepository>(() => _i7.GetPetsApi(),
      registerFor: {_api});
  gh.factory<_i7.GetPetsRepository>(() => _i7.GetPetsTest(),
      registerFor: {_test});
  gh.factory<_i8.GetUserRepository>(() => _i8.GetUserApi(),
      registerFor: {_api});
  gh.factory<_i8.GetUserRepository>(() => _i8.GetUserTest(),
      registerFor: {_test});
  gh.factory<_i8.GetUserRepository>(() => _i8.GetUserFirebase(),
      registerFor: {_firebase});
  gh.factory<_i9.GetVaccinesRepository>(() => _i9.GetVaccinesFirebase(),
      registerFor: {_firebase});
  gh.factory<_i9.GetVaccinesRepository>(() => _i9.GetVaccinesTest(),
      registerFor: {_test});
  gh.factory<_i9.GetVaccinesRepository>(() => _i9.GetVaccinesApi(),
      registerFor: {_api});
  gh.factory<_i10.LifeTimeRepository>(() => _i10.LifeTimeFirebase(),
      registerFor: {_firebase, _api, _test});
  gh.factory<_i11.LoginRepository>(() => _i11.LoginFirebase(),
      registerFor: {_firebase});
  gh.factory<_i11.LoginRepository>(() => _i11.LoginApi(), registerFor: {_api});
  gh.factory<_i11.LoginRepository>(() => _i11.LoginTest(),
      registerFor: {_test});
  gh.factory<_i12.LogoutRepository>(() => _i12.LogoutApi(),
      registerFor: {_api});
  gh.factory<_i12.LogoutRepository>(() => _i12.LogoutTest(),
      registerFor: {_test});
  gh.factory<_i12.LogoutRepository>(() => _i12.LogoutFirebase(),
      registerFor: {_firebase});
  gh.factory<_i13.RegisterRepository>(() => _i13.RegisterApi(),
      registerFor: {_api});
  gh.factory<_i13.RegisterRepository>(() => _i13.RegisterFirebase(),
      registerFor: {_firebase});
  gh.factory<_i13.RegisterRepository>(() => _i13.RegisterTest(),
      registerFor: {_test});
  gh.factory<_i14.SetHygieneRepository>(() => _i14.SetHygieneFirebase(),
      registerFor: {_firebase});
  gh.factory<_i14.SetHygieneRepository>(() => _i14.SetHygieneApi(),
      registerFor: {_api});
  gh.factory<_i14.SetHygieneRepository>(() => _i14.SetHygieneTest(),
      registerFor: {_test});
  gh.factory<_i15.SetPetRepository>(() => _i15.SetPetFirebase(),
      registerFor: {_firebase});
  gh.factory<_i15.SetPetRepository>(() => _i15.SetPetApi(),
      registerFor: {_api});
  gh.factory<_i15.SetPetRepository>(() => _i15.SetPetTest(),
      registerFor: {_test});
  gh.factory<_i16.SetVaccinesRepository>(() => _i16.SetVaccinesApi(),
      registerFor: {_api});
  gh.factory<_i16.SetVaccinesRepository>(() => _i16.SetVaccinesTest(),
      registerFor: {_test});
  gh.factory<_i16.SetVaccinesRepository>(() => _i16.SetVaccinesFirebase(),
      registerFor: {_firebase});
  gh.factory<_i17.ShowNotificationRepository>(() => _i17.ShowNotification(),
      registerFor: {_firebase, _api, _test});
  gh.factory<_i18.SplashRepository>(() => _i18.SplashTest(),
      registerFor: {_test});
  gh.factory<_i18.SplashRepository>(() => _i18.SplashApi(),
      registerFor: {_api});
  gh.factory<_i18.SplashRepository>(() => _i18.SplashFirebase(),
      registerFor: {_firebase});
  gh.factory<_i19.UpdatePetRepository>(() => _i19.UpdatePetTest(),
      registerFor: {_test});
  gh.factory<_i19.UpdatePetRepository>(() => _i19.UpdatePetApi(),
      registerFor: {_api});
  gh.factory<_i19.UpdatePetRepository>(() => _i19.UpdatePetFirebase(),
      registerFor: {_firebase});
  gh.lazySingleton<_i20.DestroyManager>(
      () => _i20.DestroyManager(get<_i3.DestroyRepository>()));
  gh.lazySingleton<_i21.ForgotManager>(
      () => _i21.ForgotManager(get<_i4.ForgotRepository>()));
  gh.lazySingleton<_i22.GetHygieneManager>(
      () => _i22.GetHygieneManager(get<_i6.GetHygieneRepository>()));
  gh.lazySingleton<_i23.GetHygienePetsManager>(
      () => _i23.GetHygienePetsManager(get<_i5.GetHygienePetsRepository>()));
  gh.lazySingleton<_i24.GetPetsManager>(
      () => _i24.GetPetsManager(get<_i7.GetPetsRepository>()));
  gh.lazySingleton<_i25.GetUserManager>(
      () => _i25.GetUserManager(get<_i8.GetUserRepository>()));
  gh.lazySingleton<_i26.GetVaccinesManager>(
      () => _i26.GetVaccinesManager(get<_i9.GetVaccinesRepository>()));
  gh.lazySingleton<_i27.LifeTimeManager>(
      () => _i27.LifeTimeManager(get<_i10.LifeTimeRepository>()));
  gh.lazySingleton<_i28.LoginManager>(
      () => _i28.LoginManager(get<_i11.LoginRepository>()));
  gh.lazySingleton<_i29.LogoutManager>(
      () => _i29.LogoutManager(get<_i12.LogoutRepository>()));
  gh.lazySingleton<_i30.RegisterManager>(
      () => _i30.RegisterManager(get<_i13.RegisterRepository>()));
  gh.lazySingleton<_i31.SetHygieneManager>(
      () => _i31.SetHygieneManager(get<_i14.SetHygieneRepository>()));
  gh.lazySingleton<_i32.SetPetManager>(
      () => _i32.SetPetManager(get<_i15.SetPetRepository>()));
  gh.lazySingleton<_i33.SetVaccineManager>(
      () => _i33.SetVaccineManager(get<_i16.SetVaccinesRepository>()));
  gh.lazySingleton<_i34.ShowNotificationManager>(() =>
      _i34.ShowNotificationManager(get<_i17.ShowNotificationRepository>()));
  gh.lazySingleton<_i35.SplashManager>(
      () => _i35.SplashManager(get<_i18.SplashRepository>()));
  gh.lazySingleton<_i36.UpdatePetManager>(
      () => _i36.UpdatePetManager(get<_i19.UpdatePetRepository>()));
  return get;
}
