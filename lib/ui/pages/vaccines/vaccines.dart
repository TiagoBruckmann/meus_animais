// pacotes nativos flutter
import 'package:flutter/material.dart';

// import dos modelos
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';

// imports das telas
import 'package:meus_animais/ui/styles/app_colors.dart';

class Vaccines extends StatelessWidget {

  final ModelVaccines modelVaccines;
  const Vaccines({ Key? key, required this.modelVaccines }) : super(key: key);

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
                  modelVaccines.name,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),

                Text(
                  modelVaccines.day,
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
            padding: const EdgeInsets.only( left: 16 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text.rich(
                  TextSpan(
                    text: "Tipo: ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: modelVaccines.type,
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

          ( modelVaccines.reapply == false )
          ? const Padding(padding: EdgeInsets.zero)
          : Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text.rich(
                  TextSpan(
                    text: "reaplicar: ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: "Sim, em ${modelVaccines.time} ${modelVaccines.typeTime}",
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

        ],
      ),
    );
  }
}
