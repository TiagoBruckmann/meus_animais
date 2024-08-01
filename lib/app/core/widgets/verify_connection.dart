// imports nativos
import 'package:flutter/material.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import das telas
import 'package:meus_animais/app/core/widgets/loading_connection.dart';

// import dos domain
import 'package:meus_animais/domain/source/local/mobx/connection/connection.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class VerifyConnection extends StatelessWidget {

  final String keyAppBar;
  final Map<String, String>? appBarParams;
  final List<Widget>? actionWidgets;
  final Widget page;
  const VerifyConnection({ super.key, required this.keyAppBar, this.appBarParams, this.actionWidgets, required this.page });

  @override
  Widget build(BuildContext context) {

    final connectionMobx = Provider.of<ConnectionMobx>(context);
    connectionMobx.listenChangeConnectivityState();

    return Observer(
      builder: (builder) {

        return SafeArea(
          child: Scaffold(
            appBar: ( keyAppBar.trim().isEmpty )
                ? null
                : AppBar(
              title: Text(
                FlutterI18n.translate(context, keyAppBar, translationParams: appBarParams),
              ),
              actions: actionWidgets ?? [],
            ),
            body: ( !Session.sharedServices.validateConnection(connectionMobx) )
              ? const LoadingConnection()
              : page,
          ),
        );

      },
    );
  }
}