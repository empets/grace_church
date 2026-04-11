import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart'
    hide EmptyRequest;
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';

abstract class HomeDomaineRepository {
  Future<Either<Failure, ProfileResponse>> getProfile(EmptyRequest notParms);
  Stream<Either<Failure, ProfileResponse>> getProfileStream();
  Future<Either<Failure, String>> sendNotifications(RequestNotification params);
  Future<Either<Failure, List<NotificationResponse>>> getListNotifications(
    EmptyRequest notParms,
  );
  Future<Either<Failure, List<NotificationResponse>>>
  getListNotificationsByCriteria(RequestNotification params);
  Future<Either<Failure, List<CelluleResponse>>> getListCellules(
    RequestCellule params,
  );
  Future<Either<Failure, List<ReponsableCelluleResponse>>>
  getListResponsablesCellules(RequestReponsableCellule params);

  Future<Either<Failure, List<ReponsableSecteurResponse>>>
  getListResponsablesSecteurs(RequestReponsableSecteur params);

  Future<Either<Failure, List<ReponsableZoneResponse>>>
  getListResponsablesZones(RequestReponsableZone params);
}
