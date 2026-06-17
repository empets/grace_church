import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/depatement/cellule/data/repositories/cellule_imple_repositories.dart';
import 'package:grace_church/feature/depatement/cellule/domaine/entities/request/cellule_request.dart';
import 'package:grace_church/feature/depatement/cellule/domaine/entities/response/cellule_response.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCelluleUsercase implements UseCase<List<CelluleResponse>, RequestCellule> {
  GetCelluleUsercase(this.repository);
  final CelluleImpleRepositories repository;
  @override
  Future<Either<Failure, List<CelluleResponse>>> call(RequestCellule params) {
    return repository.getListCellules(params);
  }
}
