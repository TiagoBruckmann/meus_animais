// imports nativos do flutter
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/manager/set_hygiene.dart';
import 'package:meus_animais/data/sources/local/injection/injection.dart';

// import dos pacotes
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:meus_animais/data/sources/remote/services/services.dart';
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
  validateFields( context, String petId, bool updatePet ) {

    analytics.logEvent(name: "validate_hygiene");
    String date = controllerDay.text;
    String place = controllerPlace.text;
    String value = controllerValue.text;
    int day = int.parse(date.split("/")[0]);
    int month = int.parse(date.split("/")[1]);
    int year = int.parse(date.split("/")[2]);

    if ( name.trim().isEmpty ) {
      CustomSnackBar(
        context,
        "Selecione uma categoria de serviços.",
        Colors.red,
      );
      return;
    }
    if ( date.isEmpty && date.length != 10 ) {
      CustomSnackBar(
        context,
        "Informe a data do serviço.",
        Colors.red,
      );
      return;
    }
    if ( day > 31 && month > 12 && year > DateTime.now().year ) {
      CustomSnackBar(
        context,
        "Informe uma data válida!",
        Colors.red,
      );
      return;
    }
    if ( place.trim().isEmpty ) {
      CustomSnackBar(
        context,
        "Informe o estabelecimento.",
        Colors.red,
      );
      return;
    }

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

    if ( updatePet == true ) {
      hygieneManager.setData();
    }

    Navigator.pop(
      context,
      hygieneManager.listHygiene,
    );
  }

  @action
  void clear() {
    setName("");
    controllerDay.dispose();
    controllerPlace.dispose();
    controllerValue.dispose();
  }

}