// imports nativos
import 'package:flutter/material.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import das telas
import 'package:meus_animais/app/core/widgets/loading_connection.dart';

// import dos domain
import 'package:meus_animais/domain/source/local/mobx/connection/connection.dart';

// import dos pacotes
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class VerifyConnection extends StatelessWidget {

  final String keyAppBar;
  final Map<String, String>? appBarParams;
  final List<Widget>? actionWidgets;
  final Widget page;
  final bool floatingButtonOnLeft;
  final Function? function;
  const VerifyConnection({ super.key, required this.keyAppBar, this.appBarParams, this.actionWidgets, required this.page, this.function, this.floatingButtonOnLeft = false });

  @override
  Widget build(BuildContext context) {

    final connectionMobx = Provider.of<ConnectionMobx>(context);
    connectionMobx.listenChangeConnectivityState();
    final ThemeData theme = Theme.of(context);

    return Observer(
      builder: (builder) {

        return SafeArea(
          child: Scaffold(
            appBar: ( keyAppBar.trim().isEmpty )
                ? null
                : AppBar(
              title: Text(
                FlutterI18n.translate(context, keyAppBar, translationParams: appBarParams),
                style: theme.textTheme.bodyMedium,
              ),
              centerTitle: true,
              actions: actionWidgets ?? [],
            ),
            body: ( !Session.sharedServices.validateConnection(connectionMobx) )
                ? const LoadingConnection()
                : page,
            floatingActionButtonLocation: ( floatingButtonOnLeft )
                ? FloatingActionButtonLocation.startFloat
                : FloatingActionButtonLocation.endFloat,
            floatingActionButton: ( function == null )
                ? null
                : FloatingActionButton(
              onPressed: () => function!.call(),
              child: FaIcon(
                FontAwesomeIcons.plus,
                color: theme.colorScheme.surfaceContainer,
                size: 18,
              ),
            ),
          ),
        );

      },
    );
  }
}