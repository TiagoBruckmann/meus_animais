// imports nativos do flutter
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/data/sources/local/manager/set_hygiene.dart';
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/domain/models/hygiene/hygiene_pets.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/message.dart';

// import dos pacotes
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intl/intl.dart';
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

    Services().analyticsEvent("validate_hygiene");
    Services().facebookEvent("validate_hygiene");
    String date = controllerDay.text;
    String place = controllerPlace.text;
    String value = controllerValue.text;
    int day = int.parse(date.split("/")[0]);
    int month = int.parse(date.split("/")[1]);
    int year = int.parse(date.split("/")[2]);

    if ( name.trim().isEmpty ) {
      return CustomSnackBar(
        context,
        FlutterI18n.translate(context, "custom_message.hygiene.validate.name"),
        Colors.red,
      );
    }
    if ( date.isEmpty && date.length != 10 ) {
      return CustomSnackBar(
        context,
        FlutterI18n.translate(context, "custom_message.hygiene.validate.date"),
        Colors.red,
      );
    }
    if ( day > 31 && month > 12 && year > DateTime.now().year ) {
      return CustomSnackBar(
        context,
        FlutterI18n.translate(context, "custom_message.hygiene.validate.day"),
        Colors.red,
      );
    }
    if ( place.trim().isEmpty ) {
      return CustomSnackBar(
        context,
        FlutterI18n.translate(context, "custom_message.hygiene.validate.place"),
        Colors.red,
      );
    }

    List<ModelHygienePets> modelHygienePets = [];
    modelHygienePets.add(
      ModelHygienePets(
        DateFormat('yyyyMMddkkmmss').format(DateTime.now()),
        name,
        date,
        place,
        value,
        DateTime.now().toString(),
        petId: petId,
      ),
    );

    hygieneManager.listHygiene.addAll(
      modelHygienePets,
    );

    if ( updatePet == true ) {
      hygieneManager.setData();
    }

    Navigator.pop(
      context,
      modelHygienePets,
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