import 'package:grace_church/core/data_process/success.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/home/data/model/home_model.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart'
    hide EmptyRequest;

abstract class DomaineServiceRepository {
  Future<FirebaseResult<ProfileResponseModel>> getProfile(
    EmptyRequest notParms,
  );
  Stream<FirebaseResult<ProfileResponseModel>> getProfileStream();
  // Future<FirebaseResult<String>> sendNotifications(RequestNotification params);
  Future<FirebaseResult<List<NotificationResponseModel>>> getListNotifications(
    EmptyRequest notParms,
  );
  Future<FirebaseResult<List<NotificationResponseModel>>>
  getListNotificationsByCriteria(RequestNotification params);
  Future<FirebaseResult<List<CelluleResponseModel>>> getListCellules(
    RequestCellule params,
  );
  Future<FirebaseResult<List<ReponsableCelluleResponseModel>>>
  getListResponsablesCellules(RequestReponsableCellule params);
  
  Future<FirebaseResult<List<ReponsableResponseSecteurModel>>>
  getListResponsablesSecteurs(RequestReponsableSecteur params);
  
  Future<FirebaseResult<List<ReponsableZoneResponseModel>>>
  getListResponsablesZones(RequestReponsableZone params);
}
