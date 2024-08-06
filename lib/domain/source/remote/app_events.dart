// imports nativos
import 'dart:io';

// imports globais
import 'package:meus_animais/domain/entities/hygiene.dart';
import 'package:meus_animais/domain/entities/vaccine.dart';
import 'package:meus_animais/session.dart';

// import dos pacotes
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:new_version_plus/new_version_plus.dart';

class AppEvents {

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> sendScreen( String screenName, { String? params }) async {
    await _analytics.logScreenView(
      screenName: screenName,
      parameters: {
        "params": params ?? "",
      }
    );
  }

  Future<void> sharedEvent( String eventName ) async => _logEvent(eventName, {});

  Future<void> sharedSuccessEvent( String eventName, String success ) async {
    final params = {
      "success": success,
    };

    _logEvent(eventName, params);
  }

  Future<void> sharedErrorEvent( String eventName, String error ) async {
    final params = {
      "error": error,
    };

    _logEvent(eventName, params);
  }

  Future<void> login( String loginMethod, Map<String, String> params ) async{
    Session.logs.successLog("auth_login => $params");
    return await _analytics.logSignUp(signUpMethod: loginMethod, parameters: params);
  }

  Future<void> logHygieneName( String hygiene ) async {
    const String eventName = "hygiene_selected";
    final params = { "hygiene": hygiene };

    await _logEvent(eventName, params);
  }

  Future<void> logSetHygiene( List<HygieneEntity> list, bool updatePet ) async {
    const String eventName = "set_hygiene";
    final params = {
      "hygiene": list.toString(),
      "update_pet": updatePet.toString(),
    };

    await _logEvent(eventName, params);
  }

  Future<void> logCameraOption( String imageSource ) async {
    const String eventName = "crop_selected_image";
    final params = { "camera_option": imageSource };

    await _logEvent(eventName, params);
  }

  Future<void> logSex( String sex ) async {
    const String eventName = "create_pet_select_sex";
    final params = { "sex": sex };

    await _logEvent(eventName, params);
  }

  Future<void> logSpecie( String specie ) async {
    const String eventName = "create_pet_select_specie";
    final params = { "specie": specie };

    await _logEvent(eventName, params);
  }

  Future<void> logDetailPet( String petId ) async {
    const String eventName = "pets_detail_pet";
    final params = {
      "pet_id": petId,
    };

    await _logEvent(eventName, params);
  }

  Future<void> logTypeTime( String prefixEvent, String typeSelected ) async {
    final String eventName = "${prefixEvent}_type_time";
    final params = {
      "type_time": typeSelected,
    };

    await _logEvent(eventName, params);
  }

  Future<void> logTime( String prefixEvent, String time ) async {
    final String eventName = "${prefixEvent}_time";
    final params = {
      "time": time,
    };

    await _logEvent(eventName, params);
  }

  Future<void> logSetVaccines( List<VaccineEntity> list, bool updatePet ) async {
    const String eventName = "set_vaccines";
    final params = {
      "vaccines": list.toString(),
      "update_pet": updatePet.toString(),
    };

    await _logEvent(eventName, params);
  }

  Future<void> logPopUp( String suffixEvent, String title, String body, bool accept ) async {
    final String eventName = "pop_up_$suffixEvent";
    final params = {
      "title": title,
      "body": body,
      "accept": accept.toString(),
    };

    await _logEvent(eventName, params);
  }

  Future<void> logDropDownError( String title ) async {
    const String eventName = "drop_down_error";
    final params = { "title": title };

    await _logEvent(eventName, params);
  }

  Future<void> requestData() async {
    const String eventName = "info_data_requested";
    final params = {
      "solicited_at": DateTime.now().toString(),
    };

    await _logEvent(eventName, params);
  }

  Future<void> _logEvent(String eventName, Map<String, String> params) async {

    /*
    NewVersionPlus versionPlus = NewVersionPlus();
    final version = await versionPlus.getVersionStatus();

    if ( version != null ) {
      params.addAll({
        'app_version': version.localVersion,
      });
    }
    */

    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    String platform = "Android";
    dynamic deviceInfo;
    if ( Platform.isIOS ) {
      deviceInfo = await deviceInfoPlugin.iosInfo;
      platform = "IOS";
    } else {
      deviceInfo = await deviceInfoPlugin.androidInfo;
    }

    params.addAll({
      'user_identifier': Session.user.id,
      'email': Session.user.email,
      'platform': platform,
      'device': deviceInfo.model,
      'device_version': ( Platform.isIOS ) ? deviceInfo.systemVersion : deviceInfo.version.release,
    });

    await _analytics.logEvent(
      name: eventName,
      parameters: params,
    );
  }

}