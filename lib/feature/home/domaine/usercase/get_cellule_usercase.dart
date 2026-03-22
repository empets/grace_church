import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/domaine/repository/home_domain_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCelluleUsercase implements UseCase<List<CelluleResponse>, RequestCellule> {
  GetCelluleUsercase(this.repository);
  final HomeDomaineRepository repository;
  @override
  Future<Either<Failure, List<CelluleResponse>>> call(RequestCellule params) {
    return repository.getListCellules(params);
  }
}
