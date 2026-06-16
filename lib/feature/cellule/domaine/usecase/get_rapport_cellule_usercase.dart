import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/cellule/data/repositories/cellule_imple_repositories.dart';
import 'package:grace_church/feature/cellule/domaine/entities/request/cellule_request.dart';
import 'package:grace_church/feature/cellule/domaine/entities/response/cellule_response.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetRapportCelluleUsercase implements UseCase<List<RapportCelluleResponse>, RequestRapportCellule> {
  GetRapportCelluleUsercase(this.repository);

  final CelluleImpleRepositories repository;

  @override
  Future<Either<Failure, List<RapportCelluleResponse>>> call(RequestRapportCellule params) {
    return repository.getRapportCellule(params);
  }
}





