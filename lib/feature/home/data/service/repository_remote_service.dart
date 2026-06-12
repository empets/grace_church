import 'package:grace_church/core/data_process/success.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/home/data/model/home_model.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart'
    hide EmptyRequest;
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';

abstract class DomaineServiceRepository {
  

  // ----------------------------------------------------------------------------------------------------------------------------
  // Methode: getProfile                                    
  // Paramètre: RequestGetProfile
  // Retour: ProfileResponse
  // Description: Cette methode permet de récupérer le profil de l'utilisateur
  // ----------------------------------------------------------------------------------------------------------------------------
  Future<FirebaseResult<ProfileResponseModel>> getProfile(
    RequestGetProfile notParms,
  );

  // ----------------------------------------------------------------------------------------------------------------------------
  // Methode: getListNotifications                                    
  // Paramètre: EmptyRequest
  // Retour: List<NotificationResponse> (qui contient les informations des notifications)
  // Description: Cette methode permet de récupérer la liste des notifications
  // ----------------------------------------------------------------------------------------------------------------------------
  Future<FirebaseResult<List<NotificationResponseModel>>> getListNotifications(
    EmptyRequest notParms,
  );

  // ----------------------------------------------------------------------------------------------------------------------------
  // Methode: getListNotificationsByCriteria                                    
  // Paramètre: RequestNotification
  // Retour: List<NotificationResponseModel>
  // Description: Cette methode permet de récupérer la liste des notifications par critères
  // ----------------------------------------------------------------------------------------------------------------------------
  Future<FirebaseResult<List<NotificationResponseModel>>>getListNotificationsByCriteria(RequestNotification params);

   // ----------------------------------------------------------------------------------------------------------------------------
  // Methode: [getListResponsablesCellules]                                    
  // Paramètre: RequestReponsableCellule
  // Retour: List<ReponsableCelluleResponse> (qui contient les informations des cellules)
  // Description: Cette methode permet de récupérer la liste des responsables de cellules
  // ----------------------------------------------------------------------------------------------------------------------------
  Future<FirebaseResult<List<CelluleResponseModel>>> getListCellules(RequestCellule params);

  // ----------------------------------------------------------------------------------------------------------------------------
  // Methode: [getListResponsablesCellules]                                    
  // Paramètre: RequestReponsableCellule
  // Retour: List<ReponsableCelluleResponse> (qui contient les informations des cellules)
  // Description: Cette methode permet de récupérer la liste des responsables de cellules
  // ----------------------------------------------------------------------------------------------------------------------------
  Future<FirebaseResult<List<ReponsableCelluleResponseModel>>>getListResponsablesCellules(RequestReponsableCellule params);
  

 
 // ----------------------------------------------------------------------------------------------------------------------------
  // Methode: getListResponsablesSecteurs                                    
  // Paramètre: RequestSecteur
  // Retour: List<SecteurResponse> (qui contient les informations des secteurs)
  // Description: Cette methode permet de récupérer la liste des responsables de secteurs
  // ----------------------------------------------------------------------------------------------------------------------------

  Future<FirebaseResult<List<SecteurModel>>>getListResponsablesSecteurs(RequestSecteur params);
  
  // ----------------------------------------------------------------------------------------------------------------------------
  // Methode: getListResponsablesZones                                    
  // Paramètre: RequestZone
  // Retour: List<ZoneResponse> (qui contient les informations des zones)
  // Description: Cette methode permet de récupérer la liste des responsables de zones
  // ----------------------------------------------------------------------------------------------------------------------------
  Future<FirebaseResult<List<ZoneResponseModel>>>getListResponsablesZones(RequestZone params);
  
  // ----------------------------------------------------------------------------------------------------------------------------
  // Methode: sendRapportCelluleStepAdministration                                    
  // Paramètre: RequestRapportCelluleAdministration
  // Retour: String (clé du rapport de cellule)
  // Description: Cette methode permet d'envoyer une administration pour un rapport de cellule en fonction de l'id du rapport
  // ----------------------------------------------------------------------------------------------------------------------------
  Future<FirebaseResult<String>> sendRapportCelluleStepAdministration(RequestRapportCelluleAdministration params);

  // ----------------------------------------------------------------------------------------------------------------------------
  // Methode: sendImpliciteConnexion                                    
  // Paramètre: RequestImpliciteConnexion
  // Retour: ProfileResponseModel
  // Description: Cette methode permet d'envoyer une connexion implicite
  // ----------------------------------------------------------------------------------------------------------------------------
  Future<FirebaseResult<ProfileResponseModel>> sendImpliciteConnexion(RequestImpliciteConnexion params);

  // ----------------------------------------------------------------------------------------------------------------------------
  // Methode: sendRapportCelluleStepAssistance                                    
  // Paramètre: RequestRapportCelluleAssistance
  // Retour: String (clé du rapport de cellule)
  // Description: Cette methode permet d'envoyer une assistance pour un rapport de cellule en fonction de l'id du rapport
  // ----------------------------------------------------------------------------------------------------------------------------
  Future<FirebaseResult<String>> sendRapportCelluleStepAssistance(RequestRapportCelluleAssistance params);

  // ----------------------------------------------------------------------------------------------------------------------------
  // Methode: sendRapportCelluleStepActivity                                    
  // Paramètre: RequestRapportCelluleActivity
  // Retour: String (clé du rapport de cellule)
  // Description: Cette methode permet d'envoyer une activité pour un rapport de cellule en fonction de l'id du rapport
  // ----------------------------------------------------------------------------------------------------------------------------
  Future<FirebaseResult<String>> sendRapportCelluleStepActivity(RequestRapportCelluleActivity params);

  // ----------------------------------------------------------------------------------------------------------------------------
  // Methode: sendRapportCelluleStepSuggestion                                    
  // Paramètre: RequestRapportCelluleSuggestion
  // Retour: String (clé du rapport de cellule)
  // Description: Cette methode permet d'envoyer une suggestion pour un rapport de cellule en fonction de l'id du rapport
  // ----------------------------------------------------------------------------------------------------------------------------
  Future<FirebaseResult<String>> sendRapportCelluleStepSuggestion(RequestRapportCelluleSuggestion params);

  // ----------------------------------------------------------------------------------------------------------------------------
  // Methode: getRapportCellule                                    
  // Paramètre: RequestRapportCellule
  // Retour: List<RapportCelluleResponse>
  // Description: Cette methode permet de récupérer une liste de rapports de cellule en fonction de l'id du responsable de cellule
  // ----------------------------------------------------------------------------------------------------------------------------
  Future<FirebaseResult<List<RapportCelluleResponseModel>>> getRapportCellule(RequestRapportCellule params);
  
  // -------------------------------------------------------------
  // Methode: readNotification
  // Paramètre: RequestReadNotification
  // Retour: id de la requête
  // Description: Cette methode permet de lire une notification
  // -------------------------------------------------------------
  Future<FirebaseResult<String>> readNotification(RequestReadNotification params);

  // -------------------------------------------------------------
  //  cette methode permet de recuperer le rapport de la cellule par responsable cellule id
  //  elle prend en parametre un objet RequestRapportCellule qui contient les criteres de recherche
  //  elle retourne une liste de RapportCelluleResponse qui contient les rapport de la cellule
  // -------------------------------------------------------------
  Future<FirebaseResult<List<RapportCelluleResponse>>> getRapportCelluleByResponsableCelluleId(RequestRapportCellule params);


}

