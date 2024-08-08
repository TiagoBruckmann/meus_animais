// pacotes nativos do flutter
import 'package:flutter/material.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import das telas
import 'package:meus_animais/app/core/widgets/custom_snack_bar.dart';

// import dos domain
import 'package:meus_animais/domain/source/local/injection/injection.dart';
import 'package:meus_animais/domain/usecases/pet_use_case.dart';
import 'package:meus_animais/domain/entities/vaccine.dart';

// import dos pacotes
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';

part 'vaccine.g.dart';

class VaccineMobx extends _VaccineMobx with _$VaccineMobx {}

abstract class _VaccineMobx with Store {

  final _currentContext = Session.globalContext.currentContext!;
  final _petUseCase = PetUseCase(getIt());

  @observable
  bool isLoading = false;

  @observable
  TextEditingController controllerName = TextEditingController();

  @observable
  TextEditingController controllerType = TextEditingController();

  @observable
  TextEditingController controllerDescription = TextEditingController();

  @observable
  MaskedTextController controllerDate = MaskedTextController(mask: "00/00/0000");

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

    int length = 3;
    if ( typeTime == "Dia(s)" ) {
      length = 32;
    } else if ( typeTime == "Semana(s)" ) {
      length = 4;
    } else if ( typeTime == "Mês/Meses" ) {
      length = 12;
    }

    List<String> list = [];
    for ( int i = 1; i < length; i++ ) {
      list.add("$i - $typeTime");
    }

    return list;
  }

  @action
  void setIsLoading( bool value ) => isLoading = value;

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
  Future<void> validateFields( String petId, bool isUpdate ) async {

    setIsLoading(true);
    Session.appEvents.sharedEvent("validate_vaccines");
    String name = controllerName.text.trim();
    String type = controllerType.text.trim();
    String date = controllerDate.text.trim();

    final List<VaccineEntity> listVaccines = [];

    if ( name.isEmpty || name.length < 3 ) {
      setIsLoading(false);
      CustomSnackBar(messageKey: "custom_message.vaccines.validate.name");
      return;
    }

    if ( type.isEmpty || type.length < 3 ) {
      setIsLoading(false);
      CustomSnackBar(messageKey: "custom_message.vaccines.validate.type");
      return;
    }

    if ( date.isEmpty || date.length != 10 ) {
      setIsLoading(false);
      CustomSnackBar(messageKey: "custom_message.vaccines.validate.day");
      return;
    }

    if ( !reapply ) {

      listVaccines.add(
        VaccineEntity(
          DateFormat('yyyyMMddkkmmss').format(DateTime.now()),
          name,
          type,
          controllerDescription.text.trim(),
          date,
          reapply,
          DateTime.now().toString(),
          petId: petId,
        ),
      );

    } else {

      if ( typeTime.trim().isEmpty ) {
        setIsLoading(false);
        CustomSnackBar(messageKey: "custom_message.vaccines.validate.type_time");
        return;
      }

      if ( time.trim().isEmpty ) {
        setIsLoading(false);
        CustomSnackBar(messageKey: "custom_message.vaccines.validate.time");
        return;
      }

      listVaccines.add(
        VaccineEntity(
          DateFormat('yyyyMMddkkmmss').format(DateTime.now()),
          name,
          type,
          controllerDescription.text.trim(),
          date,
          reapply,
          DateTime.now().toString(),
          petId: petId,
          typeTime: typeTime.trim(),
          time: time.trim(),
          laboratory: controllerLaboratory.text.trim(),
        ),
      );

      await Future.delayed(const Duration(milliseconds: 500));

      listVaccines.add(
        VaccineEntity(
          DateFormat('yyyyMMddkkmmss').format(DateTime.now()),
          name,
          type,
          controllerDescription.text.trim(),
          date,
          reapply,
          Session.sharedServices.calculateDate(date, time, typeTime),
          petId: petId,
          typeTime: typeTime.trim(),
          time: time.trim(),
          laboratory: controllerLaboratory.text.trim(),
        ),
      );

    }

    Session.appEvents.logSetVaccines(listVaccines, isUpdate);

    print("isUpdate vaccines => $isUpdate");
    if ( isUpdate ) {
      return await _setVaccines(listVaccines);
    }

    _goToPop(listVaccines);
  }

  @action
  Future<void> _setVaccines( List<VaccineEntity> list ) async {

    final successOrFailure = await _petUseCase.createVaccines(list);

    successOrFailure.fold(
      (failure) => Session.logs.errorLog(failure.message),
      (success) => _goToPop(list),
    );

  }

  @action
  void clear() {
    controllerName.dispose();
    controllerType.dispose();
    controllerDescription.dispose();
    controllerDate.dispose();
    controllerLaboratory.dispose();
    setIsLoading(false);
  }

  @action
  void _goToPop( List<VaccineEntity>? list ) => Navigator.pop(_currentContext, list);

}