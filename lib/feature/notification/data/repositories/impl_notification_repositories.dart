import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/core/data_process/success.dart';
import 'package:grace_church/feature/notification/data/model/notification_model.dart';
import 'package:grace_church/feature/notification/data/services/notification_imple_repositories_remote_service.dart';
import 'package:grace_church/feature/notification/domaine/entities/request/notification_request.dart';
import 'package:grace_church/feature/notification/domaine/entities/response/notification_response.dart';
import 'package:grace_church/feature/notification/domaine/repositories/i_notification_repositories.dart';
import 'package:injectable/injectable.dart';
import 'package:grace_church/core/usercase/usercase.dart';



@LazySingleton(as: NotificationDomaineRepositories)
class ImplNotificationRepositories implements NotificationDomaineRepositories {
      ImplNotificationRepositories({required this.notificationImpleRepositoriesRemoteService});

      final NotificationImpleRepositoriesRemoteService notificationImpleRepositoriesRemoteService;


      
   // ----------------------------------------------------------------------------------------------------------------------------
  // Methode: getListNotifications                                    
  // Paramètre: EmptyRequest
  // Retour: List<NotificationResponse> (qui contient les informations des notifications)
  // Description: Cette methode permet de récupérer la liste des notifications
  // ----------------------------------------------------------------------------------------------------------------------------

  @override
  Future<Either<Failure, List<NotificationResponse>>> getListNotifications(
    EmptyRequest notParms,
  ) async {
    final response = await notificationImpleRepositoriesRemoteService.getListNotifications(
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



  // ----------------------------------------------------------------------------------------------------------------------------
  // Methode: getListNotificationsByCriteria                                    
  // Paramètre: RequestNotification
  // Retour: List<NotificationResponse> (qui contient les informations des notifications)
  // Description: Cette methode permet de récupérer la liste des notifications par critères
  // ----------------------------------------------------------------------------------------------------------------------------
  @override
  Future<Either<Failure, List<NotificationResponse>>>
  getListNotificationsByCriteria(RequestNotification params) async {
    final response = await notificationImpleRepositoriesRemoteService
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



  // -------------------------------------------------------------
  // Methode: readNotification
  // Paramètre: RequestReadNotification
  // Retour: id de la requête
  // Description: Cette methode permet de lire une notification
  // -------------------------------------------------------------
  @override
  Future<Either<Failure, String>> readNotification(RequestReadNotification params) async {
    final response = await notificationImpleRepositoriesRemoteService.readNotification(params);
    if (response is FirebaseSuccess<String>) {
      return Right(response.data);
    } else if (response is FirebaseError<String>) {
      return Left(Failure(message: response.message));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }

    
  @override
  Future<Either<Failure, String>> sendNotifications(RequestNotification params) {
    // TODO: implement sendNotifications
    throw UnimplementedError();
  }
  
 
 
  
}