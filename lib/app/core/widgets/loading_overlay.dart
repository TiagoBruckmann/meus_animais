import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final String message;
  final bool isLoading;
  const LoadingOverlay({super.key, required this.child, this.message = "", this.isLoading = false});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return PopScope(
      canPop: false,
      onPopInvoked: (bool? canPop) {
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
              color: Colors.black.withOpacity(0.7),
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