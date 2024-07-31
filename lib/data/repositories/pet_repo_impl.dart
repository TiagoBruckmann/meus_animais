// imports globais
import 'package:meus_animais/session.dart';

// import dos domain
import 'package:meus_animais/domain/repositories/pet_repo.dart';
import 'package:meus_animais/domain/entities/life_time.dart';
import 'package:meus_animais/domain/failures/failures.dart';
import 'package:meus_animais/domain/entities/hygiene.dart';
import 'package:meus_animais/domain/entities/vaccine.dart';
import 'package:meus_animais/domain/entities/pet.dart';

// import dos data
import 'package:meus_animais/data/datasource/pet_remote_datasource.dart';
import 'package:meus_animais/data/exceptions/exceptions.dart';

// import dos pacotes
import 'package:image_picker/image_picker.dart';
import 'package:dartz/dartz.dart';

class PetRepoImpl implements PetRepo {
  final PetRemoteDatasource petRemoteDatasource;
  PetRepoImpl( this.petRemoteDatasource );

  @override
  Future<Either<Failure, List<PetEntity>>> getPets() async {
    try {
      final result = await petRemoteDatasource.getPets();
      return right(result);
    } on ServerExceptions catch (e) {
      Session.crash.onError("get_pets_server_error", error: e.message);
      return left(ServerFailure(e.message));
    } catch (e) {
      Session.crash.onError("get_pets_error", error: e);
      return left(GeneralFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setPet( Map<String, dynamic> json, XFile? picture ) async {
    try {
      final result = await petRemoteDatasource.setPet( json, picture );
      return right(result);
    } on ServerExceptions catch (e) {
      Session.crash.onError("set_pet_server_error", error: e.message);
      return left(ServerFailure(e.message));
    } catch (e) {
      Session.crash.onError("set_pet_error", error: e);
      return left(GeneralFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updatePet( Map<String, dynamic> json ) async {
    try {
      final result = await petRemoteDatasource.updatePet( json );
      return right(result);
    } on ServerExceptions catch (e) {
      Session.crash.onError("update_pet_server_error", error: e.message);
      return left(ServerFailure(e.message));
    } catch (e) {
      Session.crash.onError("update_pet_error", error: e);
      return left(GeneralFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LifeTimeEntity>>> getLifeTime() async {
    try {
      final result = await petRemoteDatasource.getLifeTime();
      return right(result);
    } on ServerExceptions catch (e) {
      Session.crash.onError("get_life_time_pets_server_error", error: e.message);
      return left(ServerFailure(e.message));
    } catch (e) {
      Session.crash.onError("get_life_time_pets_error", error: e);
      return left(GeneralFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HygieneEntity>>> getHygiene( String petId ) async {
    try {
      final result = await petRemoteDatasource.getHygiene( petId );
      return right(result);
    } on ServerExceptions catch (e) {
      Session.crash.onError("get_hygiene_pets_server_error", error: e.message);
      return left(ServerFailure(e.message));
    } catch (e) {
      Session.crash.onError("get_hygiene_pets_error", error: e);
      return left(GeneralFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setHygiene( List<HygieneEntity> list ) async {
    try {
      final result = await petRemoteDatasource.setHygiene( list );
      return right(result);
    } on ServerExceptions catch (e) {
      Session.crash.onError("set_hygiene_server_error", error: e.message);
      return left(ServerFailure(e.message));
    } catch (e) {
      Session.crash.onError("set_hygiene_error", error: e);
      return left(GeneralFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<VaccineEntity>>> getVaccines( String petId ) async {
    try {
      final result = await petRemoteDatasource.getVaccines( petId );
      return right(result);
    } on ServerExceptions catch (e) {
      Session.crash.onError("get_vaccines_server_error", error: e.message);
      return left(ServerFailure(e.message));
    } catch (e) {
      Session.crash.onError("get_vaccines_error", error: e);
      return left(GeneralFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setVaccines( List<VaccineEntity> list ) async {
    try {
      final result = await petRemoteDatasource.setVaccines( list );
      return right(result);
    } on ServerExceptions catch (e) {
      Session.crash.onError("set_vaccines_server_error", error: e.message);
      return left(ServerFailure(e.message));
    } catch (e) {
      Session.crash.onError("set_vaccines_error", error: e);
      return left(GeneralFailure(e.toString()));
    }
  }

}