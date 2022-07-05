// imports nativos do flutter
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import dos sources
import 'package:meus_animais/data/sources/local/manager/set_vaccines.dart';
import 'package:meus_animais/data/sources/local/injection/injection.dart';
import 'package:meus_animais/domain/models/vaccines/vaccines.dart';

// import dos pacotes
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:mobx/mobx.dart';
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
  validateFields( context, String petId ) {

    String name = controllerName.text;
    String type = controllerType.text;
    String day = controllerDay.text;

    if ( name.isNotEmpty && name.trim().length > 2 ) {
      if ( type.isNotEmpty && type.trim().length > 2 ) {
        if ( day.isNotEmpty && day.length > 5 ) {
          if ( reapply == true ) {
            if ( typeTime.isNotEmpty ) {
              if ( time.isNotEmpty ) {
                vaccineManager.modelVaccines = ModelVaccines(
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
                );
              } else {
                vaccineManager.modelVaccines = ModelVaccines(
                  DateFormat('yyyyMMddkkmmss').format(DateTime.now()),
                  petId,
                  name,
                  type,
                  controllerDescription.text,
                  day,
                  reapply,
                  DateTime.now().toString(),
                );
              }
              vaccineManager.setData();

            } else {

            }
          } else {
            // reapply
          }
        } else {
          // day
        }
      } else {
        // type
      }
    } else {
      // name
    }
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