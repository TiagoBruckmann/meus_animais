// imports nativos do flutter
import 'package:flutter/material.dart';

// import dos pacotes
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

// import das telas
import 'package:meus_pets/ui/styles/app_images.dart';

class LoadingSettings extends StatelessWidget {
  LoadingSettings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.grey,
                child: Shimmer(
                  duration: Duration(seconds: 5),
                  color: Colors.grey,
                  enabled: true,
                  direction: ShimmerDirection.fromLTRB(),
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: Theme.of(context).primaryColor,
                    backgroundImage: AssetImage(
                      AppImages.defaultUser,
                    ),
                  ),
                ),
              ),
              title: Shimmer(
                duration: Duration(seconds: 5),
                color: Colors.grey,
                enabled: true,
                direction: ShimmerDirection.fromLTRB(),
                child: Text(
                  FlutterI18n.translate(context, "widgets.settings.title"),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              subtitle: Shimmer(
                duration: Duration(seconds: 5),
                color: Colors.grey,
                enabled: true,
                direction: ShimmerDirection.fromLTRB(),
                child: Text(
                  FlutterI18n.translate(context, "widgets.settings.subtitle"),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            Shimmer(
              duration: Duration(seconds: 5),
              color: Colors.grey,
              enabled: true,
              direction: ShimmerDirection.fromLTRB(),
              child: Divider(
                height: 30,
                thickness: 1,
                color: Colors.black,
                indent: 16,
                endIndent: 16,
              ),
            ),

            // geral
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric( horizontal: 16 ),
                  child: Text(
                    FlutterI18n.translate(context, "widgets.settings.main"),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),

            Shimmer(
              duration: Duration(seconds: 5),
              color: Colors.grey,
              enabled: true,
              direction: ShimmerDirection.fromLTRB(),
              child: Divider(
                height: 30,
                thickness: 1,
                color: Colors.black,
                indent: 16,
                endIndent: 16,
              ),
            ),

            // Sugestões
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 16, 0),
                  child: Text(
                    FlutterI18n.translate(context, "widgets.settings.rate"),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            Shimmer(
              duration: Duration(seconds: 5),
              color: Colors.grey,
              enabled: true,
              direction: ShimmerDirection.fromLTRB(),
              child: Divider(
                height: 30,
                thickness: 1,
                color: Colors.black,
                indent: 16,
                endIndent: 16,
              ),
            ),

            // desconectar
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 16, 0),
                  child: Text(
                    FlutterI18n.translate(context, "widgets.settings.logout.title"),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            Shimmer(
              duration: Duration(seconds: 5),
              color: Colors.grey,
              enabled: true,
              direction: ShimmerDirection.fromLTRB(),
              child: Divider(
                height: 30,
                thickness: 1,
                color: Colors.black,
                indent: 16,
                endIndent: 16,
              ),
            ),

            // FAQ
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric( horizontal: 16 ),
                  child: Text(
                    FlutterI18n.translate(context, "widgets.settings.faq"),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),

            /*
            Divider(
              height: 30,
              thickness: 1,
              color: Colors.black,
              indent: 16,
              endIndent: 16,
            ),

            // Estou com duvidas
            GestureDetector(
              onTap: () {
                // _questions();
              },
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 16, 0),
                    child: Text(
                      "Estou com duvidas",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Divider(
              height: 30,
              thickness: 1,
              color: Colors.black,
              indent: 25,
              endIndent: 16,
            ),

            // perguntas frequentes
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 16, 0),
                  child: GestureDetector(
                    onTap: () {
                      // RoutesApp().goToFrequently( context );
                    },
                    child: Text(
                      "Perguntas frequentes",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
           */

            Shimmer(
              duration: Duration(seconds: 5),
              color: Colors.grey,
              enabled: true,
              direction: ShimmerDirection.fromLTRB(),
              child: Divider(
                height: 30,
                thickness: 1,
                color: Colors.black,
                indent: 16,
                endIndent: 16,
              ),
            ),

            // excluir conta
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 16, 0),
                  child: Shimmer(
                    duration: Duration(seconds: 5),
                    color: Colors.grey,
                    enabled: true,
                    direction: ShimmerDirection.fromLTRB(),
                    child: Text(
                      FlutterI18n.translate(context, "widgets.settings.destroy.destroy"),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
