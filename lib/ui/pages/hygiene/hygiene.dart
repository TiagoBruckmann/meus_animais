// pacotes nativos flutter
import 'package:flutter/material.dart';

// import dos modelos
import 'package:meus_animais/domain/models/hygiene/hygiene_pets.dart';

// imports das telas
import 'package:meus_animais/ui/styles/app_colors.dart';

class Hygiene extends StatelessWidget {

  final ModelHygienePets modelHygiene;
  const Hygiene({ Key? key, required this.modelHygiene }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.blueSolitude,
      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.fromLTRB( 16, 12, 16, 0 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  modelHygiene.name,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),

                Text(
                  modelHygiene.day,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),

              ],
            ),
          ),

          const Divider(
            indent: 16,
            endIndent: 16,
            thickness: 2.5,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text.rich(
                  TextSpan(
                    text: "Local: ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: modelHygiene.place,
                        style: const TextStyle(
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
            padding: const EdgeInsets.only( left: 16, bottom: 8 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text.rich(
                  TextSpan(
                    text: "Valor: ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: modelHygiene.value,
                        style: const TextStyle(
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
