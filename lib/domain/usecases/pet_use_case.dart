// import dos domain
import 'package:meus_animais/domain/repositories/pet_repo.dart';
import 'package:meus_animais/domain/entities/hygiene_pet.dart';
import 'package:meus_animais/domain/entities/life_time.dart';
import 'package:meus_animais/domain/failures/failures.dart';
import 'package:meus_animais/domain/entities/pet.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

class PetUseCase {
  final PetRepo petRepo;
  PetUseCase( this.petRepo );

  Future<Either<Failure, List<PetEntity>>> getPets() async {
    return await petRepo.getPets();
  }

  Future<Either<Failure, void>> setPet( Map<String, dynamic> json ) async {
    return await petRepo.setPet( json );
  }

  Future<Either<Failure, void>> updatePet( Map<String, dynamic> json ) async {
    return await petRepo.updatePet( json );
  }

  Future<Either<Failure, List<LifeTimeEntity>>> getLifeTimePets() async {
    return await petRepo.getLifeTime();
  }

  Future<Either<Failure, List<HygienePetEntity>>> getHygienePets( String petId ) async {
    return await petRepo.getHygiene( petId );
  }

  Future<Either<Failure, void>> setHygienePets( List<HygienePetEntity> list ) async {
    return await petRepo.setHygiene( list );
  }

}