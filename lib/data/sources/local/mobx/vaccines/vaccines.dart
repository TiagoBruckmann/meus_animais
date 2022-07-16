// imports nativos do flutter
import 'package:flutter/material.dart';

// import das telas
import 'package:meus_animais/ui/pages/widgets/message.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/manager/set_vaccines.dart';
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/data/sources/remote/services/services.dart';
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';

// import dos pacotes
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';
part 'vaccines.g.dart';

class VaccinesMobx extends _VaccinesMobx with _$VaccinesMobx{}

abstract class _VaccinesMobx with Store {

  final vaccineManager = getIt.get<SetVaccineManager>();

  @observable
  TextEditingController controllerName = TextEditingController();

  @observable
  TextEditingController controllerType = TextEditingController();

  @observable
  TextEditingController controllerDescription = TextEditingController();

  @observable
  MaskedTextController controllerDay = MaskedTextController(mask: "00/00/0000");

  @observable
  bool reapply = true;

  @observable
  String typeTime = "";

  @observable
  String time = "";

  @observable
  TextEditingController controllerLaboratory = TextEditingController();

  @computed
  List<String> get listTime {

    List<String> list = [];
    for ( int i = 1; i < 32; i++ ) {
      list.add("$i - $typeTime");
    }

    return list;
  }

  @action
  void setReapply( bool value ) => reapply = value;

  @action
  void setTypeTime( String value ) {
    typeTime = value;
    if ( time.trim().isNotEmpty ) {
      String number = time.split(" - ")[0];
      setTime("$number - $typeTime");
    }
  }

  @action
  void setTime( String value ) => time = value;

  @action
  validateFields( context, String petId, bool updatePet ) {

    analytics.logEvent(name: "validate_vaccines");
    String name = controllerName.text;
    String type = controllerType.text;
    String day = controllerDay.text;

    if ( name.isEmpty && name.trim().length < 3 ) {
      CustomSnackBar(
        context,
        FlutterI18n.translate(context, "custom_message.vaccines.validate.name"),
        Colors.red,
      );
      return;
    }
    if ( type.isEmpty && type.trim().length < 3 ) {
      CustomSnackBar(
        context,
        FlutterI18n.translate(context, "custom_message.vaccines.validate.type"),
        Colors.red,
      );
      return;
    }
    if ( day.isEmpty && day.length != 10 ) {
      CustomSnackBar(
        context,
        FlutterI18n.translate(context, "custom_message.vaccines.validate.day"),
        Colors.red,
      );
      return;
    }
    if ( reapply == true ) {
      if ( typeTime.isNotEmpty ) {
        if ( time.isNotEmpty ) {
          vaccineManager.listVaccines.add(
            ModelVaccines(
              DateFormat('yyyyMMddkkmmss').format(DateTime.now()),
              petId,
              name,
              type,
              controllerDescription.text,
              day,
              reapply,
              DateTime.now().toString(),
              typeTime: typeTime,
              time: time,
              laboratory: controllerLaboratory.text,
            ),
          );

        } else {
          CustomSnackBar(
            context,
            FlutterI18n.translate(context, "custom_message.vaccines.validate.time"),
            Colors.red,
          );
          return;
        }
      } else {
        CustomSnackBar(
          context,
          FlutterI18n.translate(context, "custom_message.vaccines.validate.type_time"),
          Colors.red,
        );
        return;
      }
    } else {
      vaccineManager.listVaccines.add(
        ModelVaccines(
          DateFormat('yyyyMMddkkmmss').format(DateTime.now()),
          petId,
          name,
          type,
          controllerDescription.text,
          day,
          reapply,
          DateTime.now().toString(),
        ),
      );
    }

    if ( updatePet == true ) {
      vaccineManager.setData();
    }

    return Navigator.pop(
      context,
      vaccineManager.listVaccines,
    );

  }

  @action
  void clear() {
    controllerName.dispose();
    controllerType.dispose();
    controllerDescription.dispose();
    controllerDay.dispose();
    controllerLaboratory.dispose();
  }

}