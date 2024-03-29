// imports nativos do flutter
import 'package:flutter/material.dart';
import 'package:meus_animais/data/sources/remote/services/events.dart';

// import dos pacotes
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

// import das telas
import 'package:meus_animais/ui/styles/app_images.dart';

class LoadingSettings extends StatelessWidget {
  const LoadingSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EventsApp().sendScreen("loading_settings");
    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.grey,
                child: Shimmer(
                  duration: const Duration(seconds: 5),
                  color: Colors.grey,
                  colorOpacity: 0.6,
                  enabled: true,
                  direction: const ShimmerDirection.fromLTRB(),
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
                duration: const Duration(seconds: 5),
                color: Colors.grey,
                colorOpacity: 0.6,
                enabled: true,
                direction: const ShimmerDirection.fromLTRB(),
                child: Text(
                  FlutterI18n.translate(context, "widgets.settings.title"),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              subtitle: Shimmer(
                duration: const Duration(seconds: 5),
                color: Colors.grey,
                colorOpacity: 0.6,
                enabled: true,
                direction: const ShimmerDirection.fromLTRB(),
                child: Text(
                  FlutterI18n.translate(context, "widgets.settings.subtitle"),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            Shimmer(
              duration: const Duration(seconds: 5),
              color: Colors.grey,
              colorOpacity: 0.6,
              enabled: true,
              direction: const ShimmerDirection.fromLTRB(),
              child: Divider(
                height: 30,
                thickness: 1,
                color: Theme.of(context).unselectedWidgetColor,
                indent: 16,
                endIndent: 16,
              ),
            ),

            // geral
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 16 ),
                  child: Text(
                    FlutterI18n.translate(context, "widgets.settings.main"),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),

            Shimmer(
              duration: const Duration(seconds: 5),
              color: Colors.grey,
              colorOpacity: 0.6,
              enabled: true,
              direction: const ShimmerDirection.fromLTRB(),
              child: Divider(
                height: 30,
                thickness: 1,
                color: Theme.of(context).unselectedWidgetColor,
                indent: 16,
                endIndent: 16,
              ),
            ),

            // Sugestões
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 16, 0),
                  child: Text(
                    FlutterI18n.translate(context, "widgets.settings.rate"),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),

            Shimmer(
              duration: const Duration(seconds: 5),
              color: Colors.grey,
              colorOpacity: 0.6,
              enabled: true,
              direction: const ShimmerDirection.fromLTRB(),
              child: Divider(
                height: 30,
                thickness: 1,
                color: Theme.of(context).unselectedWidgetColor,
                indent: 16,
                endIndent: 16,
              ),
            ),

            // desconectar
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 16, 0),
                  child: Text(
                    FlutterI18n.translate(context, "widgets.settings.logout.title"),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            Shimmer(
              duration: const Duration(seconds: 5),
              color: Colors.grey,
              colorOpacity: 0.6,
              enabled: true,
              direction: const ShimmerDirection.fromLTRB(),
              child: Divider(
                height: 30,
                thickness: 1,
                color: Theme.of(context).unselectedWidgetColor,
                indent: 16,
                endIndent: 16,
              ),
            ),

            // FAQ
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 16 ),
                  child: Text(
                    FlutterI18n.translate(context, "widgets.settings.faq"),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),

            Shimmer(
              duration: const Duration(seconds: 5),
              color: Colors.grey,
              colorOpacity: 0.6,
              enabled: true,
              direction: const ShimmerDirection.fromLTRB(),
              child: Divider(
                height: 30,
                thickness: 1,
                color: Theme.of(context).unselectedWidgetColor,
                indent: 16,
                endIndent: 16,
              ),
            ),

            // solicitar conta
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 16, 0),
                  child: Shimmer(
                    duration: const Duration(seconds: 5),
                    color: Colors.grey,
                    colorOpacity: 0.6,
                    enabled: true,
                    direction: const ShimmerDirection.fromLTRB(),
                    child: Text(
                      FlutterI18n.translate(context, "widgets.settings.info_account.name"),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Shimmer(
              duration: const Duration(seconds: 5),
              color: Colors.grey,
              colorOpacity: 0.6,
              enabled: true,
              direction: const ShimmerDirection.fromLTRB(),
              child: Divider(
                height: 30,
                thickness: 1,
                color: Theme.of(context).unselectedWidgetColor,
                indent: 16,
                endIndent: 16,
              ),
            ),

            // termos
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 16, 0),
                  child: Shimmer(
                    duration: const Duration(seconds: 5),
                    color: Colors.grey,
                    colorOpacity: 0.6,
                    enabled: true,
                    direction: const ShimmerDirection.fromLTRB(),
                    child: Text(
                      FlutterI18n.translate(context, "widgets.settings.terms.terms"),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Shimmer(
              duration: const Duration(seconds: 5),
              color: Colors.grey,
              colorOpacity: 0.6,
              enabled: true,
              direction: const ShimmerDirection.fromLTRB(),
              child: Divider(
                height: 30,
                thickness: 1,
                color: Theme.of(context).unselectedWidgetColor,
                indent: 16,
                endIndent: 16,
              ),
            ),

            // politica de privacidade
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 16, 0),
                  child: Shimmer(
                    duration: const Duration(seconds: 5),
                    color: Colors.grey,
                    colorOpacity: 0.6,
                    enabled: true,
                    direction: const ShimmerDirection.fromLTRB(),
                    child: Text(
                      FlutterI18n.translate(context, "widgets.settings.terms.policy"),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Shimmer(
              duration: const Duration(seconds: 5),
              color: Colors.grey,
              colorOpacity: 0.6,
              enabled: true,
              direction: const ShimmerDirection.fromLTRB(),
              child: Divider(
                height: 30,
                thickness: 1,
                color: Theme.of(context).unselectedWidgetColor,
                indent: 16,
                endIndent: 16,
              ),
            ),

            // deletar conta
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 16, 0),
                  child: Shimmer(
                    duration: const Duration(seconds: 5),
                    color: Colors.grey,
                    colorOpacity: 0.6,
                    enabled: true,
                    direction: const ShimmerDirection.fromLTRB(),
                    child: Text(
                      FlutterI18n.translate(context, "widgets.settings.destroy.destroy"),
                      style: const TextStyle(
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
