import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/domaine/repository/home_domain_repository.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetListSecteurUsercase implements UseCase<List<ReponsableSecteurResponse>, RequestReponsableSecteur> {
  GetListSecteurUsercase(this.repository);

  final HomeDomaineRepository repository;

  @override
  Future<Either<Failure, List<ReponsableSecteurResponse>>> call(RequestReponsableSecteur params) {
    return repository.getListResponsablesSecteurs(params);
  }
}
