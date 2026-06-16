import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/feature/depatement/cellule/data/repositories/cellule_imple_repositories.dart';
import 'package:grace_church/feature/depatement/cellule/domaine/entities/request/cellule_request.dart';
import 'package:grace_church/feature/depatement/cellule/domaine/entities/response/cellule_response.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetListSecteurUsercase implements UseCase<List<SecteurResponse>, RequestSecteur> {
  GetListSecteurUsercase(this.repository);

  final CelluleImpleRepositories repository;

  @override
  Future<Either<Failure, List<SecteurResponse>>> call(RequestSecteur params) {
    return repository.getListResponsablesSecteurs(params);
  }
}
