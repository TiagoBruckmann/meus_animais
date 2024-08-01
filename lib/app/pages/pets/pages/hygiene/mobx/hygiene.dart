// pacotes nativos do flutter
import 'package:flutter/material.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import das telas
import 'package:meus_animais/app/core/widgets/custom_snack_bar.dart';

// import dos domain
import 'package:meus_animais/domain/source/local/injection/injection.dart';
import 'package:meus_animais/domain/usecases/service_use_case.dart';
import 'package:meus_animais/domain/usecases/pet_use_case.dart';
import 'package:meus_animais/domain/entities/service.dart';
import 'package:meus_animais/domain/entities/hygiene.dart';

// import dos pacotes
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'hygiene.g.dart';

class HygieneMobx extends _HygieneMobx with _$HygieneMobx {}

abstract class _HygieneMobx with Store {

  final _currentContext = Session.globalContext.currentContext!;
  final _serviceUseCase = ServiceUseCase(getIt());
  final _petUseCase = PetUseCase(getIt());

  @observable
  bool isLoading = false;

  @observable
  ServiceEntity selectedService = ServiceEntity.isEmpty();

  @observable
  TextEditingController controllerPlace = TextEditingController();

  @observable
  MaskedTextController controllerDay = MaskedTextController(mask: "00/00/0000");

  @observable
  MoneyMaskedTextController controllerValue = MoneyMaskedTextController(leftSymbol: "R\$ ", initialValue: 0.00, precision: 2, decimalSeparator: ",", thousandSeparator: ".");

  ObservableList<ServiceEntity> listService = ObservableList();

  @action
  void setIsLoading( bool value ) => isLoading = value;

  @action
  Future<void> getServices() async {

    final successOrFailure = await _serviceUseCase.getServices();

    successOrFailure.fold(
      (failure) {
        Session.logs.errorLog(failure.message);
        CustomSnackBar(messageKey: "pages.hygiene.error_services");
        return;
      },
      (success) => setListServices(success),
    );

  }

  @action
  void setListServices( Iterable<ServiceEntity> value ) => listService.addAll(value);

  @action
  void setSelectedService( ServiceEntity value ) => selectedService = value;

  @action
  Future<void> validateFields( String petId, bool isUpdate ) async {

    setIsLoading(true);

    Session.appEvents.sharedEvent("hygiene_validate_fields");
    String name = selectedService.name.trim();
    String date = controllerDay.text.trim();
    String place = controllerPlace.text.trim();
    String value = controllerValue.text.trim();
    int day = int.parse(date.split("/")[0]);
    int month = int.parse(date.split("/")[1]);
    int year = int.parse(date.split("/")[2]);

    if ( name.isEmpty || name.length < 3 ) {
      setIsLoading(false);
      CustomSnackBar(messageKey: "custom_message.hygiene.validate.name");
      return;
    }

    if ( date.isEmpty && date.length != 10 ) {
      setIsLoading(false);
      CustomSnackBar(messageKey: "custom_message.hygiene.validate.date");
      return;
    }

    if ( day > 31 && month > 12 && year > DateTime.now().year ) {
      setIsLoading(false);
      CustomSnackBar(messageKey: "custom_message.hygiene.validate.day");
      return;
    }

    if ( place.isEmpty ) {
      setIsLoading(false);
      CustomSnackBar(messageKey: "custom_message.hygiene.validate.place");
      return;
    }

    final hygiene = HygieneEntity(
      DateFormat('yyyyMMddkkmmss').format(DateTime.now()),
      name.trim(),
      date,
      place,
      value,
      DateTime.now().toString(),
      petId: petId,
    );

    final List<HygieneEntity> listHygiene = [hygiene];

    if ( isUpdate ) {
      return await _setHygiene( listHygiene );
    }

    _goToPop(listHygiene);

  }

  @action
  Future<void> _setHygiene( List<HygieneEntity> list ) async {

    final successOrFailure = await _petUseCase.createHygienePets(list);

    successOrFailure.fold(
      (failure) => Session.logs.errorLog(failure.message),
      (success) => _goToPop(list),
    );

  }

  @action
  void clear() {
    Session.appEvents.sharedEvent("create_hygiene_clear");
    setSelectedService(ServiceEntity.isEmpty());
    controllerDay.dispose();
    controllerPlace.dispose();
    controllerValue.dispose();
    setIsLoading(false);
  }

  @action
  void _goToPop( List<HygieneEntity> hygiene ) => Navigator.pop(_currentContext, hygiene);

}