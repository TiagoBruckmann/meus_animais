// pacotes nativos flutter
import 'package:flutter/material.dart';

// import dos modelos
import 'package:meus_pets/domain/models/hygiene/hygiene_pets.dart';

// imports das telas
import 'package:meus_pets/ui/styles/app_colors.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';

class Hygiene extends StatelessWidget {

  final ModelHygienePets modelHygiene;
  Hygiene({ Key key, @required this.modelHygiene }) : super(key: key);

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
                  modelHygiene.name,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),

                Text(
                  modelHygiene.day,
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
                    text: FlutterI18n.translate(context, "pages.hygiene.hygiene.place"),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: modelHygiene.place,
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

          Padding(
            padding: EdgeInsets.only( left: 16, bottom: 8 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text.rich(
                  TextSpan(
                    text: FlutterI18n.translate(context, "pages.hygiene.hygiene.value"),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: modelHygiene.value,
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

        ],
      ),
    );
  }
}
