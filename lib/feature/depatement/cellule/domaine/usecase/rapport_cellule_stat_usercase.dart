
import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/depatement/cellule/data/repositories/cellule_imple_repositories.dart';
import 'package:grace_church/feature/depatement/cellule/domaine/entities/request/cellule_request.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SendRapportCelluleStepStatUsercase
    implements UseCase<String, RequestRapportCelluleAssistance> {
  SendRapportCelluleStepStatUsercase(this.repository);
  final CelluleImpleRepositories repository;
  @override
  Future<Either<Failure, String>> call(
    RequestRapportCelluleAssistance params,
  ) {
    return repository.sendRapportCelluleStepAssistance(params);
  }
}
