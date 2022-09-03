// import dos pacotes
import 'package:facebook_app_events/facebook_app_events.dart';

// import dos servicos
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/domain/models/hygiene/hygiene_pets.dart';
import 'package:meus_animais/domain/models/users/user.dart';
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';

class EventsApp {

  static final faceSDK = FacebookAppEvents();

  Future<void> sendScreen( String screenName ) async {
    await analytics.setCurrentScreen(
      screenName: screenName,
      screenClassOverride: screenName,
    );
    await faceSDK.logEvent(name: screenName);
  }

  Future<void> sharedEvent( String eventName ) async {
    await analytics.logEvent(name: eventName);
    await faceSDK.logEvent(name: eventName);
  }

  Future<void> logHygieneName( String hygiene ) async {
    const String eventName = "hygiene_selected";
    final params = { "hygiene": hygiene };

    await analytics.logEvent(
      name: eventName,
      parameters: params,
    );
    await faceSDK.logEvent(
      name: eventName,
      parameters: params,
    );
  }

  Future<void> logSetHygiene( List<ModelHygienePets> list, bool updatePet ) async {
    const String eventName = "set_hygiene";
    final params = {
      "hygiene": list,
      "update_pet": updatePet,
    };

    await analytics.logEvent(
      name: eventName,
      parameters: params,
    );
    await faceSDK.logEvent(
      name: eventName,
      parameters: params,
    );
  }

  Future<void> logCameraOption( String imageSource ) async {
    const String eventName = "crop_selected_image";
    final params = { "camera_option": imageSource };

    await analytics.logEvent(
      name: eventName,
      parameters: params,
    );
    await faceSDK.logEvent(
      name: eventName,
      parameters: params,
    );
  }

  Future<void> logSex( String sex ) async {
    const String eventName = "create_pet_select_sex";
    final params = { "sex": sex };

    await analytics.logEvent(
      name: eventName,
      parameters: params,
    );
    await faceSDK.logEvent(
      name: eventName,
      parameters: params,
    );
  }

  Future<void> logSpecie( String specie ) async {
    const String eventName = "create_pet_select_specie";
    final params = { "specie": specie };

    await analytics.logEvent(
      name: eventName,
      parameters: params,
    );
    await faceSDK.logEvent(
      name: eventName,
      parameters: params,
    );
  }

  Future<void> logDetailPet( String petId ) async {
    const String eventName = "pets_detail_pet";
    final params = {
      "pet_id": petId,
    };

    await analytics.logEvent(
      name: eventName,
      parameters: params,
    );
    await faceSDK.logEvent(
      name: eventName,
      parameters: params,
    );
  }

  Future<void> logTypeTime( String prefixEvent, String typeSelected ) async {
    final String eventName = "${prefixEvent}_type_time";
    final params = {
      "type_time": typeSelected,
    };

    await analytics.logEvent(
      name: eventName,
      parameters: params,
    );
    await faceSDK.logEvent(
      name: eventName,
      parameters: params,
    );
  }

  Future<void> logTime( String prefixEvent, String time ) async {
    final String eventName = "${prefixEvent}_time";
    final params = {
      "time": time,
    };

    await analytics.logEvent(
      name: eventName,
      parameters: params,
    );
    await faceSDK.logEvent(
      name: eventName,
      parameters: params,
    );
  }

  Future<void> logSetVaccines( List<ModelVaccines> list, bool updatePet ) async {
    const String eventName = "set_vaccines";
    final params = {
      "vaccines": [list],
      "update_pet": updatePet,
    };

    await analytics.logEvent(
      name: eventName,
      parameters: params,
    );
    await faceSDK.logEvent(
      name: eventName,
      parameters: params,
    );
  }

  Future<void> logPopUp( String suffixEvent, String title, String body, bool accept ) async {
    final String eventName = "pop_up_$suffixEvent";
    final params = {
      "title": title,
      "body": body,
      "accept": accept,
    };

    await analytics.logEvent(
      name: eventName,
      parameters: params,
    );
    await faceSDK.logEvent(
      name: eventName,
      parameters: params,
    );
  }

  Future<void> logDropDownError( String title ) async {
    const String eventName = "drop_down_error";
    final params = { "title": title };

    await analytics.logEvent(
      name: eventName,
      parameters: params,
    );
    await faceSDK.logEvent(
      name: eventName,
      parameters: params,
    );
  }

  Future<void> requestData( ModelUser user ) async {
    const String eventName = "info_data_requested";
    final params = {
      "user_id": user.id,
      "name": user.name,
      "email": user.email,
      "solicited_at": DateTime.now().toString(),
    };

    await analytics.logEvent(
      name: eventName,
      parameters: params,
    );
    await faceSDK.logEvent(
      name: eventName,
      parameters: params,
    );
  }

}