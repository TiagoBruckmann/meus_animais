// pacotes nativos flutter
import 'package:flutter/material.dart';

// import dos modelos
import 'package:meus_pets/domain/models/vaccines/vaccines.dart';

// imports das telas
import 'package:meus_pets/ui/styles/app_colors.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';

class Vaccines extends StatelessWidget {

  final ModelVaccines modelVaccines;
  Vaccines({ Key key, @required this.modelVaccines }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.blueSolitude,
      child: Column(
        children: [

          Padding(
            padding: EdgeInsets.fromLTRB( 16, 12, 16, 0 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  modelVaccines.name,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),

                Text(
                  modelVaccines.day,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

              ],
            ),
          ),

          Divider(
            indent: 16,
            endIndent: 16,
            thickness: 2.5,
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 0, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text.rich(
                  TextSpan(
                    text: FlutterI18n.translate(context, "pages.vaccines.type"),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: modelVaccines.type,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),

          ( modelVaccines.reapply == false )
          ? Padding(padding: EdgeInsets.zero)
          : Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 0, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text.rich(
                  TextSpan(
                    text: FlutterI18n.translate(context, "pages.vaccines.reapply"),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: FlutterI18n.translate(context, "pages.vaccines.time", translationParams: <String, String>{"time": modelVaccines.time, "type_time": modelVaccines.typeTime}),
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                      ),
                    ],
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
