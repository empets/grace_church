import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/core/data_process/success.dart';
import 'package:grace_church/core/extension/extention.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/home/data/model/home_model.dart';
import 'package:grace_church/feature/home/data/service/repository_remote_service.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart'
    hide EmptyRequest;
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/domaine/repository/home_domain_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: HomeDomaineRepository)
class ImpleHomeDataRepositories implements HomeDomaineRepository {
  ImpleHomeDataRepositories({required this.domaineServiceRepository});

  final DomaineServiceRepository domaineServiceRepository;

  @override
  Future<Either<Failure, ProfileResponse>> getProfile(
    RequestGetProfile notParms,
  ) async {
    final response = await domaineServiceRepository.getProfile(notParms);

    if (response is FirebaseSuccess<ProfileResponseModel>) {
        final shared = await SharedPreferences.getInstance();
      await shared.setString('menberkey', response.data.menberId ?? "sdfdssdsdifhsdfsudk");
      return Right(ProfileResponseModel.domaine(response.data));
    } else if (response is FirebaseError<ProfileResponseModel>) {
      return Left(Failure(message: response.message));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }



  @override
  Future<Either<Failure, String>> sendNotifications(
    RequestNotification params,
  ) async {
    // final response = await domaineServiceRepository.sendNotifications(params);

    // if (response is FirebaseSuccess<String>) {
    //   return Right(response.data);
    // } else if (response is FirebaseError) {
    //   return Left(Failure(message: response.toString()));
    // }
    // return Left(Failure(message: "Erreur inconnue"));
    // TODO: implement sendNotifications
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<NotificationResponse>>> getListNotifications(
    EmptyRequest notParms,
  ) async {
    final response = await domaineServiceRepository.getListNotifications(
      notParms,
    );
    if (response is FirebaseSuccess<List<NotificationResponseModel>>) {
      return Right(
        response.data.map(NotificationResponseModel.toDomaine).toList(),
      );
    } else if (response is FirebaseError<List<NotificationResponseModel>>) {
      return Left(Failure(message: response.message));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }

  @override
  Future<Either<Failure, List<NotificationResponse>>>
  getListNotificationsByCriteria(RequestNotification params) async {
    final response = await domaineServiceRepository
        .getListNotificationsByCriteria(params);
    if (response is FirebaseSuccess<List<NotificationResponseModel>>) {
      return Right(
        response.data.map(NotificationResponseModel.toDomaine).toList(),
      );
    } else if (response is FirebaseError<List<NotificationResponseModel>>) {
      return Left(Failure(message: response.message));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }

  @override
  Future<Either<Failure, List<CelluleResponse>>> getListCellules(
    RequestCellule params,
  ) async {
    final response = await domaineServiceRepository.getListCellules(params);
    if (response is FirebaseSuccess<List<CelluleResponseModel>>) {
      return Right(response.data.map(CelluleResponseModel.domaine).toList());
    } else if (response is FirebaseError<List<CelluleResponseModel>>) {
      return Left(Failure(message: response.message));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }

  @override
  Future<Either<Failure, List<ReponsableCelluleResponse>>>
  getListResponsablesCellules(RequestReponsableCellule params) async {
    final response = await domaineServiceRepository.getListResponsablesCellules(
      params,
    );
    if (response is FirebaseSuccess<List<ReponsableCelluleResponseModel>>) {
      return Right(
        response.data.map(ReponsableCelluleResponseModel.domaine).toList(),
      );
    } else if (response is FirebaseError<List<ReponsableCelluleResponseModel>>) {
      
      return Left(Failure(message: response.message));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }

  @override
  Future<Either<Failure, List<SecteurResponse>>>
  getListResponsablesSecteurs(RequestSecteur params) async {
    final response = await domaineServiceRepository.getListResponsablesSecteurs(
      params,
    );
    if (response is FirebaseSuccess<List<SecteurModel>>) {
      return Right(
        response.data.map(SecteurModel.toDomain).toList(),
      );
    } else if (response is FirebaseError<List<SecteurModel>>) {
      return Left(Failure(message: response.message));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }

  @override
  Future<Either<Failure, List<ZoneResponse>>>
  getListResponsablesZones(RequestZone params) async {
    final response = await domaineServiceRepository.getListResponsablesZones(
      params,
    );
    if (response is FirebaseSuccess<List<ZoneResponseModel>>) {
      return Right(
        response.data.map(ZoneResponseModel.toDomain).toList(),
      );
    } else if (response is FirebaseError<List<ZoneResponseModel>>) {
      return Left(Failure(message: response.message));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }

    @override
  Future<Either<Failure, ProfileResponse>> sendImpliciteConnexion(RequestImpliciteConnexion params) async {
    final response = await domaineServiceRepository.sendImpliciteConnexion(params);
    if (response is FirebaseSuccess<ProfileResponseModel>) {
      return Right(ProfileResponseModel.domaine(response.data));
    } else if (response is FirebaseError<ProfileResponseModel>) {
      return Left(Failure(message: response.message));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }
  

  @override
  Future<Either<Failure, String>> sendRapportCelluleStepAdministration(
    RequestRapportCelluleAdministration params,
  ) async {
    final response = await domaineServiceRepository
        .sendRapportCelluleStepAdministration(params);
    if (response is FirebaseSuccess<String>) {
      final shared = await SharedPreferences.getInstance();
      await shared.setString('rapport_cellule_key', response.data);
      return Right(response.data);
    } else if (response is FirebaseError<String>) {
      return Left(Failure(message: response.message));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }
  

  @override
  Future<Either<Failure, String>> sendRapportCelluleStepAssistance(RequestRapportCelluleAssistance params) async {
    final response = await domaineServiceRepository.sendRapportCelluleStepAssistance(params);
    if (response is FirebaseSuccess<String>) {
      return Right(response.data);
    } else if (response is FirebaseError<String>) {
      return Left(Failure(message: response.message));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }
  
  @override
  Future<Either<Failure, String>> sendRapportCelluleStepActivity(RequestRapportCelluleActivity params) async {
    final response = await domaineServiceRepository.sendRapportCelluleStepActivity(params);
    if (response is FirebaseSuccess<String>) {
      return Right(response.data);
    } else if (response is FirebaseError<String>) {
      return Left(Failure(message: response.message));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }
  
  @override
  Future<Either<Failure, String>> sendRapportCelluleStepSuggestion(RequestRapportCelluleSuggestion params)async {
    final response = await domaineServiceRepository.sendRapportCelluleStepSuggestion(params);
    if (response is FirebaseSuccess<String>) {
      return Right(response.data);
    } else if (response is FirebaseError<String>) {
      return Left(Failure(message: response.message));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }

  @override
  Future<Either<Failure, List<RapportCelluleResponse>>> getRapportCellule(RequestRapportCellule params) async {
    final response = await domaineServiceRepository.getRapportCellule(params);
    if (response is FirebaseSuccess<List<RapportCelluleResponseModel>>) {
      return Right(response.data.map(RapportCelluleResponseModel.toDomain).toList());
    } else if (response is FirebaseError<List<RapportCelluleResponseModel>>) {
      return Left(Failure(message: response.message));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }
}
