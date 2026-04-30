import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/core/data_process/success.dart';
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
    EmptyRequest notParms,
  ) async {
    final response = await domaineServiceRepository.getProfile(notParms);

    if (response is FirebaseSuccess<ProfileResponseModel>) {
      return Right(ProfileResponseModel.domaine(response.data));
    } else if (response is FirebaseError) {
      return Left(Failure(message: response.toString()));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }

  @override
  Stream<Either<Failure, ProfileResponse>> getProfileStream() {
    return domaineServiceRepository.getProfileStream().map((event) {
      if (event is FirebaseSuccess<ProfileResponseModel>) {
        return Right(ProfileResponseModel.domaine(event.data));
      } else if (event is FirebaseError) {
        return Left(Failure(message: event.toString()));
      }
      return Left(Failure(message: "Erreur inconnue"));
    });
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
    } else if (response is FirebaseError) {
      return Left(Failure(message: response.toString()));
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
    } else if (response is FirebaseError) {
      return Left(Failure(message: response.toString()));
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
    } else if (response is FirebaseError) {
      return Left(Failure(message: response.toString()));
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
    } else if (response is FirebaseError) {
      return Left(Failure(message: response.toString()));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }

  @override
  Future<Either<Failure, List<ReponsableSecteurResponse>>>
  getListResponsablesSecteurs(RequestReponsableSecteur params) async {
    final response = await domaineServiceRepository.getListResponsablesSecteurs(
      params,
    );
    if (response is FirebaseSuccess<List<ReponsableResponseSecteurModel>>) {
      return Right(
        response.data.map(ReponsableResponseSecteurModel.toDomain).toList(),
      );
    } else if (response is FirebaseError) {
      return Left(Failure(message: response.toString()));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }

  @override
  Future<Either<Failure, List<ReponsableZoneResponse>>>
  getListResponsablesZones(RequestReponsableZone params) async {
    final response = await domaineServiceRepository.getListResponsablesZones(
      params,
    );
    if (response is FirebaseSuccess<List<ReponsableZoneResponseModel>>) {
      return Right(
        response.data.map(ReponsableZoneResponseModel.toDomain).toList(),
      );
    } else if (response is FirebaseError) {
      return Left(Failure(message: response.toString()));
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
    } else if (response is FirebaseError) {
      return Left(Failure(message: response.toString()));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }
  
  @override
  Future<Either<Failure, ProfileResponse>> sendImpliciteConnexion(RequestImpliciteConnexion params) async {
    final response = await domaineServiceRepository.sendImpliciteConnexion(params);
    if (response is FirebaseSuccess<ProfileResponseModel>) {
      return Right(ProfileResponseModel.domaine(response.data));
    } else if (response is FirebaseError) {
      return Left(Failure(message: response.toString()));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }
  
  @override
  Future<Either<Failure, String>> sendRapportCelluleStepAssistance(RequestRapportCelluleAssistance params) async {
    final response = await domaineServiceRepository.sendRapportCelluleStepAssistance(params);
    if (response is FirebaseSuccess<String>) {
      return Right(response.data);
    } else if (response is FirebaseError) {
      return Left(Failure(message: response.toString()));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }
  
  @override
  Future<Either<Failure, String>> sendRapportCelluleStepActivity(RequestRapportCelluleActivity params) async {
    final response = await domaineServiceRepository.sendRapportCelluleStepActivity(params);
    if (response is FirebaseSuccess<String>) {
      return Right(response.data);
    } else if (response is FirebaseError) {
      return Left(Failure(message: response.toString()));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }
  
  @override
  Future<Either<Failure, String>> sendRapportCelluleStepSuggestion(RequestRapportCelluleSuggestion params)async {
    final response = await domaineServiceRepository.sendRapportCelluleStepSuggestion(params);
    if (response is FirebaseSuccess<String>) {
      return Right(response.data);
    } else if (response is FirebaseError) {
      return Left(Failure(message: response.toString()));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }
}
