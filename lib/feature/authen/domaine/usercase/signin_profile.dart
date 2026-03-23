import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/authen/domaine/entities/request/authen_request.dart';
import 'package:grace_church/feature/authen/domaine/repository/authen_repository.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreateSignInProfileUsercase
    implements UseCase<ProfileResponse, RequestAuthenSignIn> {
  CreateSignInProfileUsercase(this.repository);

  final AuthenRepository repository;

  @override
  Future<Either<Failure, ProfileResponse>> call(RequestAuthenSignIn params) {
    return repository.createSignIn(params);
  }
}
