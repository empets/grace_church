

import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart';
import 'package:grace_church/feature/home/domaine/repository/home_domain_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SendRapportCelluleStepAssistantUsercase
    implements UseCase<String, RequestRapportCelluleActivity> {
  SendRapportCelluleStepAssistantUsercase(this.repository);
  final HomeDomaineRepository repository;
  @override
  Future<Either<Failure, String>> call(
    RequestRapportCelluleActivity params,
  ) {
    return repository.sendRapportCelluleStepActivity(params);
  }
}