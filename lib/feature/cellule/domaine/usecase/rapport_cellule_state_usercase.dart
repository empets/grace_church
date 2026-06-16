

import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/cellule/data/repositories/cellule_imple_repositories.dart';
import 'package:grace_church/feature/cellule/domaine/entities/request/cellule_request.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SendRapportCelluleStepAssistantUsercase
    implements UseCase<String, RequestRapportCelluleActivity> {
  SendRapportCelluleStepAssistantUsercase(this.repository);
  final CelluleImpleRepositories repository;
  @override
  Future<Either<Failure, String>> call(
    RequestRapportCelluleActivity params,
  ) {
    return repository.sendRapportCelluleStepActivity(params);
  }
}