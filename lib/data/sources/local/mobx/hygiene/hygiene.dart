// imports nativos do flutter
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/manager/set_hygiene.dart';
import 'package:meus_animais/data/sources/local/injection/injection.dart';

// import dos pacotes
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:meus_animais/domain/models/hygiene/hygiene_pets.dart';
import 'package:meus_animais/ui/pages/widgets/message.dart';
import 'package:mobx/mobx.dart';
part 'hygiene.g.dart';

class HygieneMobx extends _HygieneMobx with _$HygieneMobx{}

abstract class _HygieneMobx with Store {

  final hygieneManager = getIt.get<SetHygieneManager>();

  @observable
  String name = "";

  @observable
  TextEditingController controllerPlace = TextEditingController();

  @observable
  MaskedTextController controllerDay = MaskedTextController(mask: "00/00/0000");

  @observable
  MoneyMaskedTextController controllerValue = MoneyMaskedTextController(leftSymbol: "R\$ ", initialValue: 0.00, precision: 2, decimalSeparator: ",", thousandSeparator: ".");

  @action
  setName( String value ) => name = value;

  @action
  validateFields( context, String petId ) {

    String date = controllerDay.text;
    String place = controllerPlace.text;
    String value = controllerValue.text;

    if ( name.trim().isNotEmpty ) {
      if ( date.isNotEmpty && date.length != 10 ) {
        if ( place.trim().isNotEmpty ) {
          if ( value != "0,00" ) {
            hygieneManager.listHygiene.add(
              ModelHygienePets(
                DateFormat('yyyyMMddkkmmss').format(DateTime.now()),
                petId,
                name,
                date,
                place,
                value,
                DateTime.now().toString(),
              ),
            );

            Navigator.pop(
              context,
              hygieneManager.listHygiene,
            );
          } else {
            CustomSnackBar(
              context,
              "Insira um valor válido",
              Colors.red,
            );
          }
        } else {
          CustomSnackBar(
            context,
            "Informe o estabelecimento.",
            Colors.red,
          );
        }
      } else {
        CustomSnackBar(
          context,
          "Informe a data do serviço.",
          Colors.red,
        );
      }
    } else {
      CustomSnackBar(
        context,
        "Selecione uma categoria de serviços.",
        Colors.red,
      );
    }
  }

  @action
  void clear() {
    setName("");
    controllerDay.dispose();
    controllerPlace.dispose();
    controllerValue.dispose();
  }

}