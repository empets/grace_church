import 'package:grace_church/core/data_process/success.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/notification/data/model/notification_model.dart';
import 'package:grace_church/feature/notification/domaine/entities/request/notification_request.dart';

abstract class NotificationRepositorieRemotService {

  
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
  // Methode: readNotification                                    
  // Paramètre: RequestReadNotification
  // Retour: String
  // Description: Cette methode permet de lire une notification
  // ----------------------------------------------------------------------------------------------------------------------------
    Future<FirebaseResult<String>> readNotification( RequestReadNotification params) ;

}