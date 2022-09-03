// pacotes nativos do flutter
import 'package:flutter/material.dart';
import 'package:meus_animais/data/sources/remote/services/events.dart';
import 'dart:async';

// import dos estilos
import 'package:meus_animais/ui/styles/app_colors.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';

class LoadingConnection extends StatefulWidget {
  const LoadingConnection({ Key? key }) : super(key: key);

  @override
  State<LoadingConnection> createState() => _LoadingConnectionState();
}

class _LoadingConnectionState extends State<LoadingConnection> {

  bool _status = true;
  double _opacity = 1;
  Timer? _timer;

  _changeStatus() {

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer t) {
      if ( _opacity == 0 ) {
        setState(() {
          _status = !_status;
          _opacity = 1;
        });
      } else {
        setState(() {
          _opacity = 0;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    EventsApp().sendScreen("loading_connection");
    _changeStatus();
  }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        padding: const EdgeInsets.only( top: 20, bottom: 100 ),
        color: AppColors.bossanova,
        alignment: Alignment.center,
        duration: const Duration(
          seconds: 4,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            AnimatedOpacity(
              duration: const Duration(
                seconds: 2,
              ),
              opacity: _opacity,
              child: SizedBox(
                height: 50,
                child: Icon(
                  ( _status == true )
                  ? Icons.wifi
                  : Icons.wifi_off,
                  size: 80,
                  color: AppColors.amber,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(22, 60, 22, 10),
              child: Text(
                FlutterI18n.translate(context, "widgets.connection.title"),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
                  color: AppColors.whiteSmoke,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}