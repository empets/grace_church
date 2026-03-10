import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/feature/authen/domaine/entities/request/authen_request.dart';

abstract class AuthenRepository {
  Future<Either<Failure, String?>> createProfile(RequestAuthenProfile request);
  Future<Either<Failure, String?>> createSocial(RequestAuthenSocial request);
  Future<Either<Failure, String?>> createSpiritualLife(RequestAuthenSpiritualLife request);
  Future<Either<Failure, String?>> createEngagement(RequestAuthenEngagement request);
}
