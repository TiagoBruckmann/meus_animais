// import dos pacotes
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meus_animais/session.dart';

class LocalStorage {

  static const _storage = FlutterSecureStorage();

  void setStorage( String key, String token ) async {
    Session.logs.successLog("save_key => $key");
    await _storage.write( key: key, value: token );
  }

  void deleteAllTokens() async {
    Session.logs.successLog("delete_all_tokens => ");
    await _storage.deleteAll();
  }

  void getKey( String key ) async => await _storage.read(key: key);

  void deleteOnlyToken( String key ) async {
    Session.logs.successLog("delete_only_token => $key");
    await _storage.delete(key: key);
  }

}