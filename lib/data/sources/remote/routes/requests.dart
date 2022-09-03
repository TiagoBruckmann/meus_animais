// imports nativos
import 'dart:convert';
import 'dart:io';

// import dos pacotes
import 'package:http/http.dart' as http;

// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/domain/models/requests/requests.dart';

class Requests {

  late ModelRequests requests;
  constructHeader() async {
    final token = await Services().getToken("apiToken");
    Map<String, String> header = {
      "content-type" : "application/json",
      // "Authorization": "Bearer $token"
    };
    return header;
  }

  Map<String, String> errorResponse = {
    "en_US": "Have an error with your request, try again.",
    "pt_BR": "Houve um problema com a sua solicitação, tente novamente."
  };

  Map<String, String> timeoutResponse = {
    "en_US": "Timeout.",
    "pt_BR": "Timeout."
  };

  httpGetDefault( Uri url ) async {
    final header = await constructHeader();
    print("header => $header");
    await http.get(url, headers: header).then((value) {
      defaultResponse( value );
    }).timeout(const Duration(seconds: 5), onTimeout: () {
      crash.log("Error, timeout expended");
      http.Response response = http.Response(jsonEncode(timeoutResponse), 408);
      defaultResponse( response );
    }).onError((error, stackTrace) {
      crash.recordError(error, stackTrace);
      crash.log(error.toString());
      http.Response response = http.Response(jsonEncode(errorResponse), 500);
      defaultResponse( response );
    });
    return requests;
  }

  httpPutDefault( Uri url, Map<String, dynamic> body ) async {
    await http.put(url, headers: await constructHeader(), body: jsonEncode(body)).then((value) {
      return defaultResponse( value );
    }).timeout(const Duration(seconds: 5), onTimeout: () {
      crash.log("Error, timeout expended");
      http.Response response = http.Response(jsonEncode(timeoutResponse), 408);
      return defaultResponse( response );
    }).onError((error, stackTrace) {
      crash.recordError(error, stackTrace);
      crash.log(error.toString());
      http.Response response = http.Response(jsonEncode(errorResponse), 500);
      return defaultResponse( response );
    });
  }

  httpPostDefault( Uri url, Map<String, dynamic> body, { Map<String, String>? customHeader } ) async {
    http.post(url, headers: customHeader ?? await constructHeader(), body: jsonEncode(body)).then((value) {
      return defaultResponse( value );
    }).timeout(const Duration(seconds: 5), onTimeout: () {
      crash.log("Error, timeout expended");
      http.Response response = http.Response(jsonEncode(timeoutResponse), 408);
      return defaultResponse( response );
    }).onError((error, stackTrace) {
      crash.recordError(error, stackTrace);
      crash.log(error.toString());
      http.Response response = http.Response(jsonEncode(errorResponse), 500);
      return defaultResponse( response );
    });
  }

  httpPatchDefault( Uri url, Map<String, dynamic> body ) async {
    await http.patch(url, headers: await constructHeader(), body: jsonEncode(body)).then((value) {
      return defaultResponse( value );
    }).timeout(const Duration(seconds: 5), onTimeout: () {
      crash.log("Error, timeout expended");
      http.Response response = http.Response(jsonEncode(timeoutResponse), 408);
      return defaultResponse( response );
    }).onError((error, stackTrace) {
      crash.recordError(error, stackTrace);
      crash.log(error.toString());
      http.Response response = http.Response(jsonEncode(errorResponse), 500);
      return defaultResponse( response );
    });
  }

  httpDeleteDefault( Uri url ) async {
    await http.delete(url, headers: await constructHeader()).then((value) {
      return defaultResponse( value );
    }).timeout(const Duration(seconds: 5), onTimeout: () {
      crash.log("Error, timeout expended");
      http.Response response = http.Response(jsonEncode(timeoutResponse), 408);
      return defaultResponse( response );
    }).onError((error, stackTrace) {
      crash.recordError(error, stackTrace);
      crash.log(error.toString());
      http.Response response = http.Response(jsonEncode(errorResponse), 500);
      return defaultResponse( response );
    });
  }

  defaultResponse( http.Response response ) {

    final responseParse = jsonDecode(response.body);
    if ( responseParse["message"].toString().contains("Internal Server Error") ) {}
    print("responseParse => $responseParse");
    String message = responseParse["en_US"];
    if ( Platform.localeName == "pt_BR" ) {
      message = responseParse["pt_BR"];
    }

    requests = ModelRequests(response.statusCode, message);
    print("requests => $requests");
  }

}