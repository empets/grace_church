import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart' hide EmptyRequest;
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';

abstract class HomeDomaineRepository {
  // -------------------------------------------------------------
  //  cette methode permet de recuperer le profile d'un utilisateur
  //  elle prend en parametre un objet EmptyRequest qui ne contient rien
  //  elle retourne un objet ProfileResponse qui contient le profile de l'utilisateur
  // -------------------------------------------------------------
  Future<Either<Failure, ProfileResponse>> getProfile(RequestGetProfile notParms);
 
  //  cette methode permet d'envoyer une notification
  //  elle prend en parametre un objet RequestNotification qui contient les parametres de la requete 
  //  elle retourne un objet String qui contient le message de reponse
  // -------------------------------------------------------------
  Future<Either<Failure, String>> sendNotifications(RequestNotification params);
  // -------------------------------------------------------------
  //  cette methode permet de recuperer la liste des notifications
  //  elle prend en parametre un objet EmptyRequest qui ne contient rien
  //  elle retourne un objet List<NotificationResponse> qui contient la liste des notifications
  // -------------------------------------------------------------
  Future<Either<Failure, List<NotificationResponse>>> getListNotifications(
    EmptyRequest notParms,
  );
  // -------------------------------------------------------------
  //  cette methode permet de recuperer la liste des notifications par critere
  //  elle prend en parametre un objet RequestNotification qui contient les criteres de recherche
  //  elle retourne un objet List<NotificationResponse> qui contient la liste des notifications
  // -------------------------------------------------------------
  Future<Either<Failure, List<NotificationResponse>>>
  getListNotificationsByCriteria(RequestNotification params);
  // -------------------------------------------------------------
  //  cette methode permet de recuperer la liste des cellules
  //  elle prend en parametre un objet RequestCellule qui contient les criteres de recherche
  //  elle retourne un objet List<CelluleResponse> qui contient la liste des cellules
  // -------------------------------------------------------------
  Future<Either<Failure, List<CelluleResponse>>> getListCellules(
    RequestCellule params,
  );
  // -------------------------------------------------------------
  //  cette methode permet de recuperer la liste des responsables de cellules
  //  elle prend en parametre un objet RequestReponsableCellule qui contient les criteres de recherche
  //  elle retourne un objet List<ReponsableCelluleResponse> qui contient la liste des responsables de cellules
  // -------------------------------------------------------------
  Future<Either<Failure, List<ReponsableCelluleResponse>>>
  getListResponsablesCellules(RequestReponsableCellule params);
  // -------------------------------------------------------------
  //  cette methode permet de recuperer la liste des responsables de secteurs
  //  elle prend en parametre un objet RequestSecteur qui contient les criteres de recherche
  //  elle retourne un objet List<SecteurResponse> qui contient la liste des responsables de secteurs
  // -------------------------------------------------------------
  Future<Either<Failure, List<SecteurResponse>>>
  getListResponsablesSecteurs(RequestSecteur params);
  // -------------------------------------------------------------
  //  cette methode permet de recuperer la liste des responsables de zones
  //  elle prend en parametre un objet RequestZone qui contient les criteres de recherche
  //  elle retourne un objet List<ZoneResponse> qui contient la liste des responsables de zones
  // -------------------------------------------------------------
  Future<Either<Failure, List<ZoneResponse>>>
  getListResponsablesZones(RequestZone params);

  // -------------------------------------------------------------
  //  cette methode permet d'envoyer le rapport de la cellule
  //  elle prend en parametre un objet RequestRapportCelluleAdministration qui contient les criteres de recherche
  //  elle retourne un objet String qui contient le message de reponse
  // -------------------------------------------------------------
  Future<Either<Failure, String>> sendRapportCelluleStepAdministration(RequestRapportCelluleAdministration params);
  // -------------------------------------------------------------
  //  cette methode permet d'envoyer le rapport de la cellule
  //  elle prend en parametre un objet RequestRapportCelluleAssistance qui contient les criteres de recherche
  //  elle retourne un objet String qui contient le message de reponse
  // -------------------------------------------------------------
  Future<Either<Failure, String>> sendRapportCelluleStepAssistance(RequestRapportCelluleAssistance params);
  // -------------------------------------------------------------
  //  cette methode permet d'envoyer le rapport de la cellule
  //  elle prend en parametre un objet RequestRapportCelluleActivity qui contient les criteres de recherche
  //  elle retourne un objet String qui contient le message de reponse
  // -------------------------------------------------------------
  Future<Either<Failure, String>> sendRapportCelluleStepActivity(RequestRapportCelluleActivity params);
  // -------------------------------------------------------------
  //  cette methode permet d'envoyer le rapport de la cellule
  //  elle prend en parametre un objet RequestRapportCelluleSuggestion qui contient les criteres de recherche
  //  elle retourne un objet String qui contient le message de reponse
  // -------------------------------------------------------------
  Future<Either<Failure, String>> sendRapportCelluleStepSuggestion(RequestRapportCelluleSuggestion params);
  // -------------------------------------------------------------
  //  cette methode permet d'envoyer l'implicite connexion
  //  elle prend en parametre un objet RequestImpliciteConnexion qui contient les criteres de recherche
  //  elle retourne un objet ProfileResponse qui contient le profil de l'utilisateur
  // -------------------------------------------------------------
  Future<Either<Failure, ProfileResponse>> sendImpliciteConnexion(RequestImpliciteConnexion params);

  // -------------------------------------------------------------
  //  cette methode permet de recuperer le rapport de la cellule
  //  elle prend en parametre un objet RequestRapportCellule qui contient les criteres de recherche
  //  elle retourne une liste de RapportCelluleResponse qui contient les rapport de la cellule
  // -------------------------------------------------------------
  Future<Either<Failure, List<RapportCelluleResponse>>> getRapportCellule(RequestRapportCellule params);


  // -------------------------------------------------------------
  //  cette methode permet de recuperer le rapport de la cellule par responsable cellule id
  //  elle prend en parametre un objet RequestRapportCellule qui contient les criteres de recherche
  //  elle retourne une liste de RapportCelluleResponse qui contient les rapport de la cellule
  // -------------------------------------------------------------
  Future<Either<Failure, List<RapportCelluleResponse>>> getRapportCelluleByResponsableCelluleId(RequestRapportCellule params);

  // -------------------------------------------------------------
  //  cette methode permet de valider de confimer qu'il a lue la notification
  //  elle prend en parametre un objet RequestReadNotification qui contient les criteres de recherche
  //  elle retourne une String qui contient le message de reponse
  // -------------------------------------------------------------
  Future<Either<Failure, String>> readNotification(RequestReadNotification params);

}
