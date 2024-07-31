// import dos pacotes
import 'package:dartz/dartz.dart';

// import dos domain
import 'package:meus_animais/domain/entities/hygiene_pet.dart';
import 'package:meus_animais/domain/entities/life_time.dart';
import 'package:meus_animais/domain/failures/failures.dart';
import 'package:meus_animais/domain/entities/pet.dart';

abstract class PetRepo {
  Future<Either<Failure, List<PetEntity>>> getPets();
  Future<Either<Failure, void>> setPet( Map<String, dynamic> json );
  Future<Either<Failure, void>> updatePet( Map<String, dynamic> json );
  Future<Either<Failure, List<LifeTimeEntity>>> getLifeTime();
  Future<Either<Failure, List<HygienePetEntity>>> getHygiene( String petId );
  Future<Either<Failure, void>> setHygiene( List<HygienePetEntity> list );
}