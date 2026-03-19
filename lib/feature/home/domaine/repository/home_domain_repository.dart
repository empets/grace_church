import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';

abstract class HomeDomaineRepository {
  Future<Either<Failure, ProfileResponse>> getProfile(NoParams notParms);
}
