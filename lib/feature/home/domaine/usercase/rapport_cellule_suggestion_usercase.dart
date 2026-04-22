import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart';
import 'package:grace_church/feature/home/domaine/repository/home_domain_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SendRapportCelluleStepSuggestionUsercase
    implements UseCase<String, RequestRapportCelluleSuggestion> {
  SendRapportCelluleStepSuggestionUsercase(this.repository);
  final HomeDomaineRepository repository;
  @override
  Future<Either<Failure, String>> call(
    RequestRapportCelluleSuggestion params,
  ) {
    return repository.sendRapportCelluleStepSuggestion(params);
  }
}