// imports nativos do flutter
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import dos estilos
import 'package:meus_animais/ui/styles/app_colors.dart';

class CardPetsWidget extends StatelessWidget {

  final String title;
  const CardPetsWidget({ Key? key, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: AppColors.barossa,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric( vertical: 15 ),
          child: Row(
            mainAxisAlignment: ( title == "Dados do pet" )
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
            children: [

              const Text(""),

              Text(
                title,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
                  color: AppColors.whiteSmoke,
                ),
              ),

              ( title == "Dados do pet" )
              ? const Padding(padding: EdgeInsets.zero)
              : GestureDetector(
                onTap: () {

                },
                child: const Padding(
                  padding: EdgeInsets.only( right: 10 ),
                  child: FaIcon(
                    FontAwesomeIcons.circlePlus,
                    color: AppColors.whiteSmoke,
                  ),
                ),
              ),

            ],
          )
        ),
      ),
    );
  }
}