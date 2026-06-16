

import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/feature/cellule/data/repositories/cellule_imple_repositories.dart';
import 'package:grace_church/feature/cellule/domaine/entities/request/cellule_request.dart';
import 'package:grace_church/feature/cellule/domaine/entities/response/cellule_response.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetListZoneUsercase implements UseCase<List<ZoneResponse>, RequestZone> {
  GetListZoneUsercase(this.repository);

  final CelluleImpleRepositories repository;

  @override
  Future<Either<Failure, List<ZoneResponse>>> call(RequestZone params) {
    return repository.getListResponsablesZones(params);
  }
}
