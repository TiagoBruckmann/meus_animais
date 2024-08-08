// import dos domain
import 'package:meus_animais/domain/repositories/pet_repo.dart';
import 'package:meus_animais/domain/entities/life_time.dart';
import 'package:meus_animais/domain/failures/failures.dart';
import 'package:meus_animais/domain/entities/vaccine.dart';
import 'package:meus_animais/domain/entities/hygiene.dart';
import 'package:meus_animais/domain/entities/pet.dart';

// import dos pacotes
import 'package:image_picker/image_picker.dart';
import 'package:dartz/dartz.dart';

class PetUseCase {
  final PetRepo petRepo;
  PetUseCase( this.petRepo );

  Future<Either<Failure, List<PetEntity>>> getPets() async {
    return await petRepo.getPets();
  }

  Future<Either<Failure, void>> createPet( Map<String, dynamic> json, XFile picture ) async {
    return await petRepo.setPet( json, picture );
  }

  Future<Either<Failure, PetEntity>> updatePet( Map<String, dynamic> json, XFile? picture ) async {
    return await petRepo.updatePet( json, picture );
  }

  Future<Either<Failure, List<LifeTimeEntity>>> getLifeTimePets() async {
    return await petRepo.getLifeTime();
  }

  Future<Either<Failure, List<HygieneEntity>>> getHygienePets( String petId ) async {
    return await petRepo.getHygiene( petId );
  }

  Future<Either<Failure, void>> createHygienePets( List<HygieneEntity> list ) async {
    return await petRepo.setHygiene( list );
  }

  Future<Either<Failure, List<VaccineEntity>>> getVaccines( String petId ) async {
    return await petRepo.getVaccines( petId );
  }

  Future<Either<Failure, void>> createVaccines( List<VaccineEntity> list ) async {
    return await petRepo.setVaccines( list );
  }

}