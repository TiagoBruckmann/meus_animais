// imports nativos
import 'package:flutter/material.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import dos domain
import 'package:meus_animais/domain/source/local/injection/injection.dart';
import 'package:meus_animais/domain/usecases/pet_use_case.dart';
import 'package:meus_animais/domain/entities/pet.dart';

// import dos pacotes
import 'package:mobx/mobx.dart';

part 'pet.g.dart';

class PetMobx extends _PetMobx with _$PetMobx {}

abstract class _PetMobx with Store {

  final _currentContext = Session.globalContext.currentContext!;
  final _petUseCase = PetUseCase(getIt());

  ObservableList<PetEntity> listPets = ObservableList();

  @observable
  bool isLoading = true;

  @observable
  String? errorMessage;

  @action
  void setIsLoading( bool value ) => isLoading = value;

  @action
  void setErrorMessage( String? value ) => errorMessage = value;

  @action
  Future<void> getPets() async {
    if ( listPets.isNotEmpty ) {
      setIsLoading(false);
      return;
    }

    Session.appEvents.sharedEvent("get_all_pets");

    final successOrFailure = await _petUseCase.getPets();

    successOrFailure.fold(
      (failure) {
        Session.logs.errorLog(failure.message);
        setErrorMessage(failure.message);
      },
      (success) => _setList(success),
    );

  }

  @action
  void _setList( List<PetEntity> list ) {
    if ( listPets.isNotEmpty ) return;

    setErrorMessage(null);
    listPets.addAll(list);
    setIsLoading(false);
  }

  @action
  Future<void> refresh() async {
    await Future.delayed(const Duration(seconds: 1, milliseconds: 500));
    setIsLoading(true);
    listPets.clear();
  }

  @action
  void clear() {
    refresh();
    setErrorMessage(null);
  }

  @action
  void goToDetail( PetEntity pet ) => Navigator.pushNamed(_currentContext, "/pet-detail", arguments: pet);

}