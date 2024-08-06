// import dos domain
import 'package:meus_animais/domain/entities/hygiene.dart';
import 'package:meus_animais/domain/entities/life_time.dart';
import 'package:meus_animais/domain/failures/failures.dart';
import 'package:meus_animais/domain/entities/vaccine.dart';
import 'package:meus_animais/domain/entities/pet.dart';

// import dos pacotes
import 'package:image_picker/image_picker.dart';
import 'package:dartz/dartz.dart';

abstract class PetRepo {
  Future<Either<Failure, List<PetEntity>>> getPets();
  Future<Either<Failure, void>> setPet( Map<String, dynamic> json, XFile? picture );
  Future<Either<Failure, void>> updatePet( Map<String, dynamic> json );
  Future<Either<Failure, List<LifeTimeEntity>>> getLifeTime();
  Future<Either<Failure, List<HygieneEntity>>> getHygiene( String petId );
  Future<Either<Failure, void>> setHygiene( List<HygieneEntity> list );
  Future<Either<Failure, List<VaccineEntity>>> getVaccines( String petId );
  Future<Either<Failure, void>> setVaccines( List<VaccineEntity> list );
}