// import dos domains
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/local/manager/login.dart';
import 'package:meus_animais/domain/models/users/user.dart';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/events.dart';
import 'package:meus_animais/data/sources/remote/routes/requests.dart';
import 'package:meus_animais/data/sources/remote/credentials.dart';

class RoutesApi {

  // rotas get
  getUser() async {
    Uri url = Uri.https(Credentials().apiUrl, Credentials().userRoute);
    await Requests().httpGetDefault(url);
  }

  allPets() async {
    Uri url = Uri.https(Credentials().apiUrl, Credentials().petsRoute);
    await Requests().httpGetDefault(url);
  }

  detailPet( String petId ) async {
    Uri url = Uri.https(Credentials().apiUrl, "${Credentials().petsRoute}/$petId");
    await Requests().httpGetDefault(url);
  }

  createPet( String petId ) async {
    Uri url = Uri.https(Credentials().apiUrl, "${Credentials().petsRoute}/$petId");
    await Requests().httpGetDefault(url);
  }

  // rotas put
  updatePet() async {
    Map<String, String> body = {
      "": "",
    };


  }

  // rotas post
  sendInfoData( ModelUser modelUser ) async {

    final user = getIt.get<LoginManager>();
    Uri url = Uri.https(Credentials().onesignalUrl, Credentials().createNotification);

    final body = {
      "app_id": Credentials().onesignalAppId,
      "headings": {
        "en": "💣Solicitação de dados efetuada💥",
      },
      "contents": {
        "en": "O usuário ${modelUser.name}, ID: ${modelUser.id}. Solicitou que seja enviado um relatório de todos os seus dados cadastrais existentes no sistema!\n\n Data da solicitação: ${DateTime.now()}",
      },
      "included_segments": ["only admins"],
      "template_id": Credentials().infoDataTemplateId,
    };

    EventsApp().requestData( modelUser );
    await Requests().httpPostDefault( url, body, customHeader: user.headerOnesignal );
  }

  // rotas patch

  // rotas delete
}