

import 'dart:developer';
import 'package:firebase_database/firebase_database.dart' as databaseReference;
import 'package:grace_church/core/data_process/success.dart';
import 'package:grace_church/core/extension/extention.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/notification/data/model/notification_model.dart';
import 'package:grace_church/feature/notification/data/services/notification_repositorie_remot_service.dart';
import 'package:grace_church/feature/notification/domaine/entities/request/notification_request.dart';
import 'package:injectable/injectable.dart';



@LazySingleton(as: NotificationRepositorieRemotService)
class NotificationImpleRepositoriesRemoteService implements NotificationRepositorieRemotService {
     NotificationImpleRepositoriesRemoteService({required this.db});

   final databaseReference.DatabaseReference db;
 
 
/// -------------------------- Method:[getListNotifications] --------------------------------------------
/// Description:
/// Récupère la liste des notifications depuis Firebase Realtime Database
/// et convertit les données en objets [NotificationResponseModel].
///
/// Parameters:
/// • [notParms] : Requête vide.
///
/// Returns:
/// • [FirebaseSuccess<List<NotificationResponseModel>>] si l'opération
///   réussit.
/// • [FirebaseError] si aucune donnée n'est trouvée ou en cas d'échec.
///
/// Throws (capturées et encapsulées):
/// • Erreurs Firebase.
/// • Erreurs de conversion des données.
/// • Exceptions inattendues.
///
/// Process:
/// • Lecture du nœud `notfications`.
/// • Transformation des données Firebase.
/// • Normalisation du champ `clicks`.
/// • Désérialisation vers [NotificationResponseModel]. 
   @override
  Future<FirebaseResult<List<NotificationResponseModel>>> getListNotifications(
    EmptyRequest notParms,
  ) async {
    try {
      final snapshot = await db.child('notfications').get();
      log('------snapshot: ${snapshot.value}');

      if (snapshot.exists) {
        final notifications = snapshot.value as Map<dynamic, dynamic>;

        final parsedNotifications = notifications.values.map((e) {
          final parsed = parseFirebaseMap(e);
          // ✅ clicks est un Map de Maps => convertir en List manuellement
          if (parsed['clicks'] is Map<String, dynamic>) {
            parsed['clicks'] = (parsed['clicks'] as Map<String, dynamic>).values
                .map((click) => Map<String, dynamic>.from(click as Map))
                .toList();
          } else {
            parsed['clicks'] = <Map<String, dynamic>>[];
          }

          log('------clicks final: ${parsed['clicks']}');
          return NotificationResponseModel.fromJson(parsed);
        }).toList();
        return FirebaseSuccess(parsedNotifications);
      }

      return FirebaseError("Aucune notification trouvée");
    } catch (e) {
      log('------error: $e');
      return FirebaseError(e.toString());
    }
  }


/// -------------------------- Method:[getListNotificationsByCriteria] --------------------------------------------
/// Description:
/// Récupère une liste de notifications depuis Firebase Realtime Database
/// en appliquant un ou plusieurs critères de recherche définis dans
/// [RequestNotification].
///
/// Cette méthode permet de filtrer les notifications selon :
/// • Le titre de la notification.
/// • Le tag associé à la notification.
/// • La date de publication.
/// • Aucun critère (récupération de toutes les notifications).
///
/// Les données récupérées sont normalisées puis converties en objets
/// [NotificationResponseModel].
///
/// Parameters:
/// • [params] : Critères de recherche des notifications.
///   - [title] : Recherche les notifications contenant ce titre.
///   - [tag] : Recherche les notifications associées à ce tag.
///   - [date] : Recherche les notifications correspondant à cette date.
///
/// Returns:
/// • [FirebaseSuccess<List<NotificationResponseModel>>] si les
///   notifications sont récupérées avec succès.
/// • [FirebaseSuccess<List<NotificationResponseModel>>([])] si aucun
///   résultat ne correspond au critère de recherche.
/// • [FirebaseError] si aucune notification n'est trouvée ou en cas
///   d'échec de l'opération.
///
/// Throws (capturées et encapsulées):
/// • Erreurs Firebase Realtime Database.
/// • Erreurs de lecture des données.
/// • Erreurs de conversion vers [NotificationResponseModel].
/// • Erreurs liées à la structure inattendue des données.
/// • Exceptions inattendues durant l'exécution.
///
/// Process:
/// • Analyse du critère de recherche fourni.
/// • Lecture des données dans le nœud `notfications`.
/// • Application du filtre correspondant (title, tag ou date).
/// • Normalisation du champ `clicks`.
/// • Conversion des données en [NotificationResponseModel].
/// • Retour des résultats dans un [FirebaseSuccess].
/// • Encapsulation des erreurs dans un [FirebaseError].
  @override
  Future<FirebaseResult<List<NotificationResponseModel>>>getListNotificationsByCriteria(RequestNotification params) async {
    try {
      switch (params) {
        case RequestNotification(title: final title) when title.isNotEmpty:
          final snapshot = await db.child('notfications').get();

          if (snapshot.exists) {
            final data = snapshot.value as Map<dynamic, dynamic>;
            if (data.values.isNotEmpty) {
              final parsedNotifications = data.values
                  .map((e) {
                    final parsed = parseFirebaseMap(e);
                    // ✅ clicks est un Map de Maps => convertir en List manuellement
                    if (parsed['clicks'] is Map<String, dynamic>) {
                      parsed['clicks'] =
                          (parsed['clicks'] as Map<String, dynamic>).values
                              .map(
                                (click) =>
                                    Map<String, dynamic>.from(click as Map),
                              )
                              .toList();
                    } else {
                      parsed['clicks'] = <Map<String, dynamic>>[];
                    }

                    log('------clicks final: ${parsed['clicks']}');
                    return NotificationResponseModel.fromJson(parsed);
                  })
                  .toList()
                  .where(
                    (e) => e.title.toLowerCase().trim().contains(
                      params.title.toLowerCase().trim(),
                    ),
                  )
                  .toList();
              return FirebaseSuccess(parsedNotifications);
            }
            return FirebaseSuccess([]);
          }

        case RequestNotification(tag: final tag) when tag.isNotEmpty:
          final snapshot = await db
              .child('notfications')
              .orderByChild('tag')
              .equalTo(params.tag)
              .get();
          log('e<<<: ${snapshot.value}');

          if (snapshot.exists) {
            final notifications = snapshot.value as Map<dynamic, dynamic>;
            final parsedNotifications = notifications.values.map((e) {
              final parsed = parseFirebaseMap(e);
              // ✅ clicks est un Map de Maps => convertir en List manuellement
              if (parsed['clicks'] is Map<String, dynamic>) {
                parsed['clicks'] = (parsed['clicks'] as Map<String, dynamic>)
                    .values
                    .map((click) => Map<String, dynamic>.from(click as Map))
                    .toList();
              } else {
                parsed['clicks'] = <Map<String, dynamic>>[];
              }

              log('------clicks final: ${parsed['clicks']}');
              return NotificationResponseModel.fromJson(parsed);
            }).toList();
            return FirebaseSuccess(parsedNotifications);
          }
          return FirebaseError("Aucune notification trouvée");

        case RequestNotification(date: final date) when date.isNotEmpty:
          final snapshot = await db.child('notfications').get();

          if (snapshot.exists) {
            final data = snapshot.value as Map<dynamic, dynamic>;
            final notifications = data.values
                .map((e) {
                  final parsed = parseFirebaseMap(e);
                  // ✅ clicks est un Map de Maps => convertir en List manuellement
                  if (parsed['clicks'] is Map<String, dynamic>) {
                    parsed['clicks'] =
                        (parsed['clicks'] as Map<String, dynamic>).values
                            .map(
                              (click) =>
                                  Map<String, dynamic>.from(click as Map),
                            )
                            .toList();
                  } else {
                    parsed['clicks'] = <Map<String, dynamic>>[];
                  }

                  return NotificationResponseModel.fromJson(parsed);
                })
                .where((e) => e.date.contains(params.date) )
                .toList();
            // .toList();
            return FirebaseSuccess(
              notifications
                  .map((e) => NotificationResponseModel.fromJson(e.toJson()))
                  .toList(),
            );
          }
          return FirebaseError("Aucune notification trouvée");

        default:
          final snapshot = await db.child('notfications').get();
          log('e<<<: ${snapshot.value}');
          if (snapshot.exists) {
            final data = snapshot.value as Map<dynamic, dynamic>;

            final notifications = data.values.expand((e) {
              final notificationItems = parseImages(e as Map);

              return notificationItems.map(
                (item) => NotificationResponseModel.fromJson(
                  Map<String, dynamic>.from(item),
                ),
              );
            }).toList();

            return FirebaseSuccess(notifications);
          }
          return FirebaseError("Aucune notification trouvée");
      }
      return FirebaseError("Aucune notification trouvée");
    } catch (e) {
      log("Error in getNotifications: $e");
      return FirebaseError(e.toString());
    }
  }


 /// -------------------------- Method:[readNotification] --------------------------------------------
/// Description:
/// Marque une notification comme lue par un membre dans Firebase
/// Realtime Database.
///
/// Cette méthode vérifie d'abord si le membre a déjà consulté la
/// notification concernée.
///
/// Si une entrée existe déjà dans le nœud `clicks`, la notification
/// est considérée comme déjà lue et aucune modification n'est effectuée.
///
/// Dans le cas contraire, une nouvelle entrée est créée afin de tracer
/// la lecture de la notification par le membre.
///
/// Parameters:
/// • [params] : Informations nécessaires à l'enregistrement de la lecture.
///   - [notificationId] : Identifiant unique de la notification.
///   - [menberId] : Identifiant unique du membre ayant lu la notification.
///
/// Returns:
/// • [FirebaseSuccess<String>] si la notification est marquée comme lue.
///   La valeur retournée correspond à l'identifiant du membre ayant
///   effectué la lecture.
/// • [FirebaseError] si la notification a déjà été marquée comme lue
///   ou si une erreur survient durant l'opération.
///
/// Throws (capturées et encapsulées):
/// • Erreurs Firebase Realtime Database.
/// • Erreurs de lecture des données.
/// • Erreurs d'écriture ou de mise à jour des données.
/// • Erreurs liées à la sérialisation des données.
/// • Structure de données invalide ou inattendue.
/// • Exceptions inattendues durant l'exécution.
///
/// Process:
/// • Vérification de l'existence d'une entrée dans
///   `notfications/{notificationId}/clicks/{menberId}`.
/// • Contrôle de l'état de lecture de la notification.
/// • Création de l'entrée de suivi si la notification n'a pas encore
///   été lue.
/// • Enregistrement des informations de lecture dans Firebase.
/// • Retour de l'identifiant du membre via un [FirebaseSuccess].
/// • Encapsulation des erreurs dans un [FirebaseError].
  @override
  Future<FirebaseResult<String>> readNotification(
    RequestReadNotification params,
  ) async {
    try {
      final doc = await db
          .child(
            'notfications/${params.notificationId}/clicks/${params.menberId}',
          )
          .get();

      if (doc.exists) {
        return FirebaseError('Notification déjà lu');
      } else {
        final Map<String, dynamic> updates = {
          ...params.toJson(),
          'serviceLibelle': '',
        };
        // 2) Créer une nouvelle entrée
        await db
            .child(
              'notfications/${params.notificationId}/clicks/${params.menberId}',
            )
            .update(updates);

        // 4) Retourner le key généré
        return FirebaseSuccess(params.menberId);
      }
    } catch (e) {
      return FirebaseError(e.toString());
    }
  }

}