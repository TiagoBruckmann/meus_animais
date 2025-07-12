// pacotes nativos flutter
import 'package:flutter/material.dart';

// imports globais
import 'package:meus_animais/session.dart';

class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final String message;
  final bool isLoading;
  final bool exitApp;
  final Function? function;
  const LoadingOverlay({super.key, required this.child, this.message = "", this.isLoading = false, this.exitApp = false, this.function });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: ( bool? canPop, object ) async {
        if ( function != null ) {
          return function!.call();
        }

        if ( exitApp ) {
          return await Session.sharedServices.exitApp();
        }

        if ( !isLoading && canPop == false ) {
          return Navigator.pop(context);
        }
      },
      child: Stack(
        children: [
          child,

          if ( isLoading )
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withValues(alpha: 0.7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  const CircularProgressIndicator(),

                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      message,
                      style: theme.textTheme.bodyMedium?.apply(
                        color: theme.scaffoldBackgroundColor,
                      ),
                    ),
                  ),

                ],
              ),
            ),
        ],
      ),
    );
  }
}