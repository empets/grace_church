import 'package:grace_church/core/data_process/success.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/home/data/model/home_model.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart'
    hide EmptyRequest;

abstract class DomaineServiceRepository {

  Future<FirebaseResult<ProfileResponseModel>> getProfile(
    RequestGetProfile notParms,
  );
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
  
  Future<FirebaseResult<List<SecteurModel>>>
  getListResponsablesSecteurs(RequestSecteur params);
  
  Future<FirebaseResult<List<ZoneResponseModel>>>
  getListResponsablesZones(RequestZone params);
  Future<FirebaseResult<String>> sendRapportCelluleStepAdministration(RequestRapportCelluleAdministration params);
  Future<FirebaseResult<ProfileResponseModel>> sendImpliciteConnexion(RequestImpliciteConnexion params);
  Future<FirebaseResult<String>> sendRapportCelluleStepAssistance(RequestRapportCelluleAssistance params);
  Future<FirebaseResult<String>> sendRapportCelluleStepActivity(RequestRapportCelluleActivity params);
  Future<FirebaseResult<String>> sendRapportCelluleStepSuggestion(RequestRapportCelluleSuggestion params);
  Future<FirebaseResult<List<RapportCelluleResponseModel>>> getRapportCellule(RequestRapportCellule params);

}

