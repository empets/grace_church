import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/feature/notification/domaine/entities/request/notification_request.dart';
import 'package:grace_church/feature/notification/domaine/entities/response/notification_response.dart';
import 'package:grace_church/core/usercase/usercase.dart';

abstract class NotificationDomaineRepositories {

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
  Future<Either<Failure, List<NotificationResponse>>> getListNotifications(EmptyRequest notParms);
  // -------------------------------------------------------------
  //  cette methode permet de recuperer la liste des notifications par critere
  //  elle prend en parametre un objet RequestNotification qui contient les criteres de recherche
  //  elle retourne un objet List<NotificationResponse> qui contient la liste des notifications
  // -------------------------------------------------------------
  Future<Either<Failure, List<NotificationResponse>>>getListNotificationsByCriteria(RequestNotification params);

  
  // Methode: readNotification                                    
  // Paramètre: RequestReadNotification
  // Retour: String
  // Description: Cette methode permet de lire une notification
  // ----------------------------------------------------------------------------------------------------------------------------
    Future<Either<Failure ,String>> readNotification( RequestReadNotification params) ;

}