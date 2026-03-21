import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/domaine/repository/home_domain_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProfileUsercase implements UseCase<ProfileResponse, EmptyRequest> {
  GetProfileUsercase(this.repository);

  final HomeDomaineRepository repository;

  @override
  Future<Either<Failure, ProfileResponse>> call(EmptyRequest params) {
    return repository.getProfile(params);
  }
}


@lazySingleton
class GetProfileStreamUsercase implements UseCaseStream<ProfileResponse, String> {
  GetProfileStreamUsercase(this.repository);

  final HomeDomaineRepository repository;

  @override
  Stream<Either<Failure, ProfileResponse>> call(String menerId) {
    return repository.getProfileStream();
  }
}