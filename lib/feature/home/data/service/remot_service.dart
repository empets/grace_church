import 'dart:developer';
import 'package:grace_church/core/data_process/request/request.dart';
import 'package:grace_church/core/data_process/success.dart';
import 'package:grace_church/core/extension/extention.dart';
import 'package:grace_church/core/log/custome_log.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/home/data/model/home_model.dart';
import 'package:grace_church/feature/home/data/service/repository_remote_service.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart'
    hide EmptyRequest;
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart' as shareData;
import 'package:firebase_database/firebase_database.dart' as databaseReference;

@LazySingleton(as: DomaineServiceRepository)
class ImpDomaineServiceRepository implements DomaineServiceRepository {
  ImpDomaineServiceRepository({required this.db});

  final databaseReference.DatabaseReference db;
 
/// -------------------------- Methode:[getProfile] ---------------------------
/// context:
/// * Récupère le profil d'un membre à partir de son identifiant dans
/// Firebase Realtime Database.
/// * Cette méthode effectue une lecture sur le nœud
/// `menber/{numberId}` afin de rechercher les informations associées
/// au membre correspondant à l'identifiant fourni.
///
/// * Lorsque les données sont trouvées, elles sont désérialisées en
/// [ProfileResponseModel] puis retournées dans un objet
/// [FirebaseSuccess].
///
/// * Si aucun profil n'est trouvé pour l'identifiant demandé ou si une
/// erreur survient lors de la récupération ou de la conversion des
/// données, un objet [FirebaseError] est retourné contenant le détail
/// de l'erreur.
///
/// Paramètres :
/// * [notParms] : Contient l'identifiant unique du membre à rechercher.
///
/// Retourne :
/// * [FirebaseSuccess<ProfileResponseModel>] lorsque le profil est
///   récupéré avec succès.
/// * [FirebaseError] lorsque le profil est introuvable ou qu'une
///   erreur survient lors du traitement.
///
/// Gestion des erreurs :
/// * Profil inexistant dans la base de données.
/// * Données invalides ou incompatibles avec le modèle attendu.
/// * Erreurs de communication avec Firebase.
/// * Toute exception levée durant l'exécution est interceptée et
///   encapsulée dans un [FirebaseError].
  @override
  Future<FirebaseResult<ProfileResponseModel>> getProfile(
    RequestGetProfile notParms,
  ) async {
    try {
      final response = await db.child('menber/${notParms.numberId}').get();
      final data = Map<String, dynamic>.from(response.value as Map);
      if (response.exists) {
        final firebaseResult = ProfileResponseModel.fromJson(data);
        return FirebaseSuccess(firebaseResult);
      } else {
        return FirebaseError("une erreur est survenue");
      }
    } catch (e) {
      return FirebaseError('${e.toString()}');
    }
  }


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


/// -------------------------- Method:[getListCellules] --------------------------------------------
/// Description:
/// Récupère une ou plusieurs cellules depuis Firebase Realtime Database
/// en fonction des critères de recherche fournis dans [RequestCellule].
///
/// Cette méthode permet :
/// • De récupérer une cellule spécifique à partir de son identifiant.
/// • De récupérer l'ensemble des cellules lorsqu'aucun critère n'est fourni.
///
/// Les données récupérées depuis Firebase sont converties en objets
/// [CelluleResponseModel] avant d'être retournées au consommateur.
///
/// Parameters:
/// • [params] : Critères de recherche des cellules.
///   - [celluleId] : Identifiant unique de la cellule à rechercher.
///   - [celluleCode] : Code de la cellule (non exploité actuellement).
///
/// Returns:
/// • [FirebaseSuccess<List<CelluleResponseModel>>] si la récupération
///   des cellules est effectuée avec succès.
/// • [FirebaseError] lorsqu'aucune cellule n'est trouvée ou lorsqu'une
///   erreur survient durant le traitement.
///
/// Throws (capturées et encapsulées):
/// • Erreurs Firebase Realtime Database.
/// • Erreurs de lecture des données.
/// • Erreurs de conversion vers [CelluleResponseModel].
/// • Erreurs liées à une structure de données invalide ou inattendue.
/// • Exceptions inattendues durant l'exécution.
///
/// Process:
/// • Analyse des critères de recherche fournis.
/// • Si un [celluleId] est renseigné :
///   - Recherche de la cellule correspondante via une requête Firebase.
/// • Sinon :
///   - Récupération de l'ensemble des cellules enregistrées.
/// • Conversion des données en objets [CelluleResponseModel].
/// • Retour des résultats via un [FirebaseSuccess].
/// • Encapsulation des erreurs dans un [FirebaseError].
  @override
  Future<FirebaseResult<List<CelluleResponseModel>>> getListCellules(
    RequestCellule params,
  ) async {
    try {
      switch (params) {
        case RequestCellule(
              celluleId: final celluleId,
              
            )
            when celluleId != null && celluleId.isNotEmpty:
          final snapshot = await db
              .child('cellule')
              .orderByChild('celluleId')
              .equalTo(params.celluleId)
              .get();
          if (snapshot.exists) {
            final data = snapshot.value as Map<dynamic, dynamic>;

            final notifications = data.values.map((e) {
              final notificationItem = Map<String, dynamic>.from(e);

              return CelluleResponseModel.fromJson(notificationItem);
            }).toList();

            return FirebaseSuccess(
              notifications
                  .map((e) => CelluleResponseModel.fromJson(e.toJson()))
                  .toList(),
            );
          }
          return FirebaseError("Aucune cellule trouvée");

        default:
          final snapshot = await db.child('cellule').get();
          if (snapshot.exists) {
            final data = snapshot.value as Map<dynamic, dynamic>;

            final notifications = data.values.map((e) {
              final notificationItem = Map<String, dynamic>.from(e);
              return CelluleResponseModel.fromJson(notificationItem);
            }).toList();
            return FirebaseSuccess(
              notifications
                  .map((e) => CelluleResponseModel.fromJson(e.toJson()))
                  .toList(),
            );
          }
          return FirebaseError("Aucune notification trouvée");
      }
    } catch (e) {
      return FirebaseError(e.toString());
    }
  }

/// -------------------------- Method:[getListResponsablesCellules] --------------------------------------------
/// Description:
/// Récupère la liste des responsables de cellules enregistrés dans
/// Firebase Realtime Database.
///
/// Cette méthode effectue une lecture du nœud `responsablesCellule`
/// afin de récupérer l'ensemble des responsables disponibles.
///
/// Les données récupérées sont converties en objets
/// [ReponsableCelluleResponseModel] avant d'être retournées au
/// consommateur.
///
/// Parameters:
/// • [params] : Paramètres de recherche des responsables de cellule.
///   (Non exploités actuellement mais conservés pour respecter le
///   contrat du repository.)
///
/// Returns:
/// • [FirebaseSuccess<List<ReponsableCelluleResponseModel>>] si la
///   récupération des responsables de cellule est effectuée avec succès.
/// • [FirebaseError] lorsqu'aucun responsable de cellule n'est trouvé
///   ou lorsqu'une erreur survient durant le traitement.
///
/// Throws (capturées et encapsulées):
/// • Erreurs Firebase Realtime Database.
/// • Erreurs de lecture des données.
/// • Erreurs de conversion vers [ReponsableCelluleResponseModel].
/// • Erreurs liées à une structure de données invalide ou inattendue.
/// • Exceptions inattendues durant l'exécution.
///
/// Process:
/// • Lecture du nœud `responsablesCellule`.
/// • Vérification de l'existence des données.
/// • Conversion des données Firebase en objets
///   [ReponsableCelluleResponseModel].
/// • Construction de la liste des responsables de cellule.
/// • Retour des résultats via un [FirebaseSuccess].
/// • Encapsulation des erreurs dans un [FirebaseError].
  @override
  Future<FirebaseResult<List<ReponsableCelluleResponseModel>>>getListResponsablesCellules(RequestReponsableCellule params) async {
    try {
      final snapshot = await db.child('responsablesCellule').get();
      if (snapshot.exists) {
        final data = snapshot.value as Map<dynamic, dynamic>;
        final notifications = data.values.map((e) {
          final notificationItem = Map<String, dynamic>.from(e);
          return ReponsableCelluleResponseModel.fromJson(notificationItem);
        }).toList();
        return FirebaseSuccess(
          notifications
              .map((e) => ReponsableCelluleResponseModel.fromJson(e.toJson()))
              .toList(),
        );
      }
      return FirebaseError("Aucune responsables de cellule trouvés");
    } catch (e) {
      return FirebaseError(e.toString());
    }
  }

/// -------------------------- Method:[getListResponsablesSecteurs] --------------------------------------------
/// Description:
/// Récupère la liste des responsables de secteurs enregistrés dans
/// Firebase Realtime Database.
///
/// Cette méthode effectue une lecture du nœud `emsecteur` afin de
/// récupérer l'ensemble des secteurs et de leurs responsables associés.
///
/// Les données récupérées sont converties en objets [SecteurModel]
/// avant d'être retournées au consommateur.
///
/// Parameters:
/// • [params] : Paramètres de recherche des responsables de secteur.
///   (Non exploités actuellement mais conservés pour respecter le
///   contrat du repository et permettre des évolutions futures.)
///
/// Returns:
/// • [FirebaseSuccess<List<SecteurModel>>] si la récupération des
///   responsables de secteurs est effectuée avec succès.
/// • [FirebaseError] lorsqu'aucun responsable de secteur n'est trouvé
///   ou lorsqu'une erreur survient durant le traitement.
///
/// Throws (capturées et encapsulées):
/// • Erreurs Firebase Realtime Database.
/// • Erreurs de lecture des données.
/// • Erreurs de conversion vers [SecteurModel].
/// • Erreurs liées à une structure de données invalide ou inattendue.
/// • Exceptions inattendues durant l'exécution.
///
/// Process:
/// • Lecture du nœud `emsecteur`.
/// • Vérification de l'existence des données.
/// • Conversion des données Firebase en objets [SecteurModel].
/// • Construction de la liste des responsables de secteurs.
/// • Retour des résultats via un [FirebaseSuccess].
/// • Encapsulation des erreurs dans un [FirebaseError].
  @override
  Future<FirebaseResult<List<SecteurModel>>> getListResponsablesSecteurs(
    RequestSecteur params,
  ) async {
    try {
      final snapshot = await db.child('emsecteur').get();
      if (snapshot.exists) {
        final data = snapshot.value as Map<dynamic, dynamic>;
        final notifications = data.values.map((e) {
          final notificationItem = Map<String, dynamic>.from(e);
          return SecteurModel.fromJson(notificationItem);
        }).toList();
        return FirebaseSuccess(
          notifications.map((e) => SecteurModel.fromJson(e.toJson())).toList(),
        );
      }
      return FirebaseError("Aucune responsables de secteur trouvés");
    } catch (e) {
      return FirebaseError(e.toString());
    }
  }

/// -------------------------- Method:[getListResponsablesZones] --------------------------------------------
/// Description:
/// Récupère la liste des responsables de zones enregistrés dans
/// Firebase Realtime Database.
///
/// Cette méthode effectue une lecture du nœud `emzone` afin de
/// récupérer l'ensemble des zones et de leurs responsables associés.
///
/// Les données récupérées sont converties en objets [ZoneResponseModel]
/// avant d'être retournées au consommateur.
///
/// Parameters:
/// • [params] : Paramètres de recherche des responsables de zone.
///   (Non exploités actuellement mais conservés pour respecter le
///   contrat du repository et permettre des évolutions futures.)
///
/// Returns:
/// • [FirebaseSuccess<List<ZoneResponseModel>>] si la récupération des
///   responsables de zones est effectuée avec succès.
/// • [FirebaseError] lorsqu'aucun responsable de zone n'est trouvé
///   ou lorsqu'une erreur survient durant le traitement.
///
/// Throws (capturées et encapsulées):
/// • Erreurs Firebase Realtime Database.
/// • Erreurs de lecture des données.
/// • Erreurs de conversion vers [ZoneResponseModel].
/// • Erreurs liées à une structure de données invalide ou inattendue.
/// • Exceptions inattendues durant l'exécution.
///
/// Process:
/// • Lecture du nœud `emzone`.
/// • Vérification de l'existence des données.
/// • Conversion des données Firebase en objets [ZoneResponseModel].
/// • Construction de la liste des responsables de zones.
/// • Retour des résultats via un [FirebaseSuccess].
/// • Encapsulation des erreurs dans un [FirebaseError].
  @override
  Future<FirebaseResult<List<ZoneResponseModel>>> getListResponsablesZones(
    RequestZone params,
  ) async {
    try {
      final snapshot = await db.child('emzone').get();
      if (snapshot.exists) {
        final data = snapshot.value as Map<dynamic, dynamic>;
        final notifications = data.values.map((e) {
          final notificationItem = Map<String, dynamic>.from(e);
          return ZoneResponseModel.fromJson(notificationItem);
        }).toList();
        return FirebaseSuccess(
          notifications
              .map((e) => ZoneResponseModel.fromJson(e.toJson()))
              .toList(),
        );
      }
      return FirebaseError("Aucune responsables de zone trouvés");
    } catch (e) {
      return FirebaseError(e.toString());
    }
  }

/// -------------------------- Method:[sendImpliciteConnexion] --------------------------------------------
/// Description:
/// Effectue une connexion implicite en recherchant un utilisateur
/// à partir de l'identifiant unique de son appareil (`deviceId`)
/// enregistré dans Firebase Realtime Database.
///
/// Cette méthode permet d'identifier automatiquement un utilisateur
/// précédemment connecté sans nécessiter une nouvelle authentification.
///
/// Lorsque le `deviceId` correspond à un utilisateur existant,
/// les informations de son profil sont récupérées et converties en
/// objet [ProfileResponseModel].
///
/// Parameters:
/// • [params] : Informations nécessaires à la connexion implicite.
///   - [deviceId] : Identifiant unique de l'appareil utilisé pour
///     retrouver le profil associé.
///
/// Returns:
/// • [FirebaseSuccess<ProfileResponseModel>] si un utilisateur
///   correspondant au `deviceId` est trouvé.
/// • [FirebaseError] si aucun utilisateur n'est associé au
///   `deviceId` fourni ou en cas d'échec de l'opération.
///
/// Throws (capturées et encapsulées):
/// • Erreurs Firebase Realtime Database.
/// • Erreurs de lecture des données.
/// • Erreurs de conversion vers [ProfileResponseModel].
/// • Erreurs liées à une structure de données invalide ou inattendue.
/// • Exceptions inattendues durant l'exécution.
///
/// Process:
/// • Recherche d'un utilisateur dans le nœud `menber`.
/// • Filtrage des données à partir du champ `deviceId`.
/// • Vérification de l'existence d'un utilisateur correspondant.
/// • Conversion des données Firebase en [ProfileResponseModel].
/// • Retour du profil utilisateur via un [FirebaseSuccess].
/// • Encapsulation des erreurs dans un [FirebaseError].
  @override
  Future<FirebaseResult<ProfileResponseModel>> sendImpliciteConnexion(
    RequestImpliciteConnexion params,
  ) async {
    try {
      final userIdExist = await db
          .child('menber')
          .orderByChild('deviceId')
          .equalTo(params.deviceId)
          .get();

      if (userIdExist.exists) {
        final data = userIdExist.value as Map<dynamic, dynamic>;
        final notifications = data.values.map((e) {
          final notificationItem = Map<String, dynamic>.from(e);
          return ProfileResponseModel.fromJson(notificationItem);
        }).toList();
        return FirebaseSuccess(notifications.first);
      }

      return FirebaseError("L'utilisateur n'existe pas");
    } catch (e) {
      return FirebaseError(e.toString());
    }
  }

/// -------------------------- Method:[sendRapportCelluleStepAdministration] --------------------------------------------
/// Description:
/// Enregistre ou met à jour l'étape « Administration » d'un rapport
/// de cellule dans Firebase Realtime Database.
///
/// Cette méthode vérifie d'abord l'existence d'un identifiant de rapport
/// sauvegardé localement dans SharedPreferences.
///
/// • Si un identifiant existe, les informations de l'étape Administration
///   sont mises à jour dans le rapport existant.
/// • Si aucun identifiant n'est trouvé, un nouveau rapport est créé dans
///   Firebase et un identifiant unique est généré puis associé au rapport.
///
/// Cette approche permet de construire progressivement un rapport de
/// cellule en plusieurs étapes tout en conservant une référence unique
/// durant tout le processus de saisie.
///
/// Parameters:
/// • [params] : Données de l'étape Administration du rapport de cellule
///   à enregistrer ou à mettre à jour.
///
/// Returns:
/// • [FirebaseSuccess<String>] si l'opération est effectuée avec succès.
///   La valeur retournée correspond à l'identifiant unique du rapport.
/// • [FirebaseError] si une erreur survient lors de la création ou de la
///   mise à jour du rapport.
///
/// Throws (capturées et encapsulées):
/// • Erreurs Firebase Realtime Database.
/// • Erreurs de lecture ou d'écriture dans SharedPreferences.
/// • Erreurs de création ou de mise à jour des données.
/// • Erreurs liées à la sérialisation des données.
/// • Exceptions inattendues durant l'exécution.
///
/// Process:
/// • Lecture de la clé locale `rapport_cellule_key`.
/// • Vérification de l'existence d'un rapport déjà créé.
/// • Si la clé existe :
///   - Mise à jour du rapport correspondant.
/// • Sinon :
///   - Création d'un nouveau rapport.
///   - Génération d'un identifiant Firebase.
///   - Enregistrement des données dans `rapport_cellule`.
///   - Mise à jour de l'identifiant dans la base.
/// • Retour de l'identifiant du rapport via un [FirebaseSuccess].
/// • Encapsulation des erreurs dans un [FirebaseError].
  @override
  Future<FirebaseResult<String>> sendRapportCelluleStepAdministration(
    RequestRapportCelluleAdministration params,
  ) async {
    final shared = await shareData.SharedPreferences.getInstance();
    final localUserRequestSection = shared.getString('rapport_cellule_key');

    try {
      //----------------------------------------------------
      // Si une clé existe déjà, mettre à jour les données
      //----------------------------------------------------
      if (localUserRequestSection != null) {
        final Map<String, dynamic> updates = {
          ...params.toJson(),
          'id': localUserRequestSection,
        };
        await db
            .child('rapport_cellule/$localUserRequestSection')
            .update(updates);
        return FirebaseSuccess(localUserRequestSection);
      } else {
        final request = Request<RequestRapportCelluleAdministration>(
          data: params.toJson(),
          user: "",
          serviceLibelle: 'rapport_cellule',
        );
        // 2) Créer une nouvelle entré ou table
        final ref = db.child('rapport_cellule').push();
        // 3) Sauvegarder dans Firebase (en convertissant en Map)
        await ref.set(request.data);

        // // 4) Mettre à jour la clé
        await updateForKey(
          db: db,
          path: 'rapport_cellule',
          id: ref.key.toString(),
        );

        // 4) Retourner le key généré
        return FirebaseSuccess(ref.key!);
      }
    } catch (e) {
      log("🔥 Firebase ERROR sendRapportCelluleStepAdministration → $e");

      return FirebaseError(e.toString());
    }
  }

/// -------------------------- Method:[sendRapportCelluleStepAssistance] --------------------------------------------
/// Description:
/// Met à jour l'étape « Assistance » d'un rapport de cellule existant
/// dans Firebase Realtime Database.
///
/// Cette méthode vérifie l'existence d'un rapport à partir de son
/// identifiant unique avant d'effectuer la mise à jour des informations
/// relatives à l'étape Assistance.
///
/// Lorsque le rapport est trouvé, les nouvelles données sont fusionnées
/// avec les données existantes afin de préserver les informations déjà
/// enregistrées dans les étapes précédentes du processus.
///
/// Parameters:
/// • [params] : Données de l'étape Assistance à enregistrer.
///   - [id] : Identifiant unique du rapport de cellule à mettre à jour.
///
/// Returns:
/// • [FirebaseSuccess<String>] si la mise à jour est effectuée avec succès.
///   La valeur retournée correspond à l'identifiant du rapport mis à jour.
/// • [FirebaseError] si aucun rapport correspondant n'est trouvé ou
///   si une erreur survient durant l'opération.
///
/// Throws (capturées et encapsulées):
/// • Erreurs Firebase Realtime Database.
/// • Erreurs de lecture des données.
/// • Erreurs de mise à jour des données.
/// • Erreurs liées à la sérialisation des données.
/// • Structure de données invalide ou inattendue.
/// • Exceptions inattendues durant l'exécution.
///
/// Process:
/// • Recherche du rapport dans le nœud `rapport_cellule` à partir de son identifiant.
/// • Vérification de l'existence du rapport.
/// • Construction de la structure de mise à jour.
/// • Mise à jour des données de l'étape Assistance.
/// • Conservation de l'identifiant du rapport.
/// • Retour de l'identifiant via un [FirebaseSuccess].
/// • Encapsulation des erreurs dans un [FirebaseError].
  @override
  Future<FirebaseResult<String>> sendRapportCelluleStepAssistance(
    RequestRapportCelluleAssistance params,
  ) async {

    try {
      final userIdExist = await db
          .child('rapport_cellule')
          .orderByChild('id')
          .equalTo(params.id)
          .get();

      if (userIdExist.exists) {
        final Map<String, dynamic> updates = {
          ...params.toJson(), // nouveaux champs simples
          'id': params.id,
        };
        // 2) Créer une nouvelle entrée
        await db
            .child('rapport_cellule/${params.id}')
            .update(updates);

        // 4) Retourner le key généré
        return FirebaseSuccess(params.id);
      }
      return FirebaseError('User not found with id: ${params.id}');
    } catch (e) {
      log("🔥 Firebase ERROR updateProfile → $e");
      return FirebaseError(e.toString());
    }
  }

/// -------------------------- Method:[sendRapportCelluleStepActivity] --------------------------------------------
/// Description:
/// Met à jour l'étape « Activités » d'un rapport de cellule existant
/// dans Firebase Realtime Database.
///
/// Cette méthode récupère l'identifiant du rapport de cellule stocké
/// localement dans SharedPreferences puis vérifie son existence dans
/// Firebase avant d'effectuer la mise à jour des données relatives
/// aux activités réalisées.
///
/// Les nouvelles informations sont fusionnées avec les données déjà
/// enregistrées afin de conserver l'intégralité du rapport construit
/// au fil des différentes étapes.
///
/// Parameters:
/// • [params] : Données de l'étape Activités à enregistrer dans
///   le rapport de cellule.
///
/// Returns:
/// • [FirebaseSuccess<String>] si la mise à jour est effectuée avec succès.
///   La valeur retournée correspond à l'identifiant du rapport mis à jour.
/// • [FirebaseError] si aucun rapport correspondant n'est trouvé ou
///   si une erreur survient durant le traitement.
///
/// Throws (capturées et encapsulées):
/// • Erreurs Firebase Realtime Database.
/// • Erreurs de lecture depuis SharedPreferences.
/// • Erreurs de lecture ou de mise à jour des données Firebase.
/// • Erreurs liées à la sérialisation des données.
/// • Structure de données invalide ou inattendue.
/// • Exceptions inattendues durant l'exécution.
///
/// Process:
/// • Récupération de l'identifiant du rapport depuis SharedPreferences.
/// • Recherche du rapport correspondant dans le nœud `rapport_cellule`.
/// • Vérification de l'existence du rapport.
/// • Construction des données de mise à jour à partir de [params].
/// • Mise à jour de l'étape Activités du rapport.
/// • Conservation des données précédemment enregistrées.
/// • Retour de l'identifiant du rapport via un [FirebaseSuccess].
/// • Encapsulation des erreurs dans un [FirebaseError].
  @override
  Future<FirebaseResult<String>> sendRapportCelluleStepActivity(
    RequestRapportCelluleActivity params,
  ) async {
    final shared = await shareData.SharedPreferences.getInstance();
    final localUserRequestSection = shared.getString('rapport_cellule_key');

    try {
      final userIdExist = await db
          .child('rapport_cellule')
          .orderByChild('id')
          .equalTo(localUserRequestSection)
          .get();

      if (userIdExist.exists) {
        final Map<String, dynamic> updates = {
          ...params.toJson(), // nouveaux champs simples
        };
        // 2) Créer une nouvelle entrée
        await db
            .child('rapport_cellule/${localUserRequestSection}')
            .update(updates);

        // 4) Retourner le key généré
        return FirebaseSuccess(localUserRequestSection!);
      }
      return FirebaseError('User not found');
    } catch (e) {
      log("🔥 Firebase ERROR updateProfile → $e");
      return FirebaseError(e.toString());
    }
  }

/// -------------------------- Method:[sendRapportCelluleStepSuggestion] --------------------------------------------
/// Description:
/// Enregistre l'étape finale « Suggestions » d'un rapport de cellule
/// dans Firebase Realtime Database.
///
/// Cette méthode récupère l'identifiant du rapport de cellule stocké
/// localement dans SharedPreferences puis vérifie l'existence du rapport
/// correspondant dans Firebase avant d'effectuer la mise à jour des
/// données relatives aux suggestions et recommandations.
///
/// Une fois la mise à jour effectuée avec succès, la clé locale
/// `rapport_cellule_key` est supprimée afin de marquer la fin du
/// processus de création du rapport et d'éviter toute modification
/// involontaire ultérieure.
///
/// Parameters:
/// • [params] : Données de l'étape Suggestions à enregistrer dans
///   le rapport de cellule.
///
/// Returns:
/// • [FirebaseSuccess<String>] si l'enregistrement des suggestions est
///   effectué avec succès et que le rapport est finalisé.
/// • [FirebaseError] si aucun rapport correspondant n'est trouvé ou
///   si une erreur survient durant le traitement.
///
/// Throws (capturées et encapsulées):
/// • Erreurs Firebase Realtime Database.
/// • Erreurs de lecture ou suppression dans SharedPreferences.
/// • Erreurs de lecture ou de mise à jour des données Firebase.
/// • Erreurs liées à la sérialisation des données.
/// • Structure de données invalide ou inattendue.
/// • Exceptions inattendues durant l'exécution.
///
/// Process:
/// • Récupération de l'identifiant du rapport depuis SharedPreferences.
/// • Recherche du rapport correspondant dans le nœud `rapport_cellule`.
/// • Vérification de l'existence du rapport.
/// • Construction des données de mise à jour à partir de [params].
/// • Mise à jour de l'étape Suggestions du rapport.
/// • Finalisation du rapport de cellule.
/// • Suppression de la clé locale `rapport_cellule_key`.
/// • Retour d'un succès via [FirebaseSuccess].
/// • Encapsulation des erreurs dans un [FirebaseError].
  @override
  Future<FirebaseResult<String>> sendRapportCelluleStepSuggestion(
    RequestRapportCelluleSuggestion params,
  ) async {
    final shared = await shareData.SharedPreferences.getInstance();
    final localUserRequestSection = shared.getString('rapport_cellule_key');

    try {
      final userIdExist = await db
          .child('rapport_cellule')
          .orderByChild('id')
          .equalTo(localUserRequestSection)
          .get();

      if (userIdExist.exists) {
        final Map<String, dynamic> updates = {...params.toJson()};
        // 2) Mettre à jour l'entrée existante
        await db
            .child('rapport_cellule/${localUserRequestSection}')
            .update(updates);
        // 3) Supprimer la clé locale après envoi réussi
        shared.remove('rapport_cellule_key');
        return FirebaseSuccess('');
      }
      return FirebaseError('User not found');
    } catch (e) {
      log("🔥 Firebase ERROR updateProfile → $e");
      return FirebaseError(e.toString());
    }
  }

/// -------------------------- Method:[getRapportCellule] --------------------------------------------
/// Description:
/// Récupère un ou plusieurs rapports de cellule depuis Firebase Realtime
/// Database selon les critères de recherche spécifiés dans
/// [RequestRapportCellule].
///
/// Cette méthode prend en charge plusieurs scénarios de recherche :
/// • Recherche par tag et responsable de cellule.
/// • Recherche par date et responsable de cellule.
/// • Recherche par identifiant du responsable de cellule.
///
/// Les données récupérées sont transformées puis converties en objets
/// [RapportCelluleResponseModel] avant d'être retournées au consommateur.
///
/// Parameters:
/// • [params] : Critères de recherche des rapports de cellule.
///   - [tag] : Tag associé au rapport.
///   - [date] : Date de tenue de la cellule.
///   - [responsableCelluleId] : Identifiant du responsable de cellule.
///
/// Returns:
/// • [FirebaseSuccess<List<RapportCelluleResponseModel>>] si les rapports
///   sont récupérés avec succès.
/// • [FirebaseError] lorsqu'aucun rapport correspondant n'est trouvé.
/// • [FirebaseError] lorsqu'un type de recherche non supporté est fourni.
/// • [FirebaseError] lorsqu'une erreur survient durant le traitement.
///
/// Throws (capturées et encapsulées):
/// • Erreurs Firebase Realtime Database.
/// • Erreurs de lecture des données.
/// • Erreurs de conversion vers [RapportCelluleResponseModel].
/// • Erreurs liées à une structure de données invalide ou inattendue.
/// • Erreurs de mapping lors de la transformation des données.
/// • Exceptions inattendues durant l'exécution.
///
/// Process:
/// • Analyse des critères de recherche fournis dans [params].
/// • Exécution de la requête Firebase correspondant au cas identifié.
/// • Vérification de l'existence des données retournées.
/// • Transformation des données via [convertMap].
/// • Conversion des résultats en [RapportCelluleResponseModel].
/// • Construction de la liste des rapports correspondants.
/// • Retour des données via un [FirebaseSuccess].
/// • Journalisation des erreurs avec [AppLogger].
/// • Encapsulation des erreurs dans un [FirebaseError].
///
/// Cas supportés:
/// • Recherche par [tag] + [responsableCelluleId].
/// • Recherche par [date] + [responsableCelluleId].
/// • Recherche par [responsableCelluleId].
///
/// Cas non supportés:
/// • Toute combinaison de paramètres ne correspondant à aucun des
///   scénarios ci-dessus retourne une erreur explicite.
  @override
  Future<FirebaseResult<List<RapportCelluleResponseModel>>> getRapportCellule(
    RequestRapportCellule params,
  ) async {
    try {
      switch (params) {
        ///------------------------
        /// Fetch rapport by tag
        ///------------------------
        case RequestRapportCellule(
              tag: final tag,
              responsableCelluleId: final responsableCelluleId,
            )
            when tag.isNotEmpty && responsableCelluleId.isNotEmpty:
          final response = await db
              .child('rapport_cellule')
              .orderByChild('responsableCelluleId')
              .equalTo(params.responsableCelluleId)
              .get();

          final response2 = await db
              .child('rapport_cellule')
              .orderByChild('tag')
              .equalTo(params.tag)
              .get();

          if (!response2.exists && !response.exists) {
            return FirebaseError('Rapport cellule not found');
          }
          final data = response2.value as Map<dynamic, dynamic>;
          log('data: $data');
          final notifications = data.values.map((e) {
            final notificationItem = convertMap(e as Map);
            return RapportCelluleResponseModel.fromJson(notificationItem);
          }).toList();
          return FirebaseSuccess(notifications);

        ///------------------------
        /// Fetch rapport by date
        ///------------------------
        case RequestRapportCellule(
              date: final date,
              responsableCelluleId: final responsableCelluleId,
            )
            when date.isNotEmpty && responsableCelluleId.isNotEmpty:
          final response = await db
              .child('rapport_cellule')
              .orderByChild('responsableCelluleId')
              .equalTo(params.responsableCelluleId)
              .get();

          final response2 = await db
              .child('rapport_cellule')
              .orderByChild('jourCellule')
              .equalTo(params.date)
              .get();

          if (!response.exists && !response2.exists) {
            return FirebaseError('Rapport cellule not found');
          }
  

          final data = response2.value as Map<dynamic, dynamic>;
          log('data: $data');
          final notifications = data.values.map((e) {
            final notificationItem = convertMap(e as Map);
            return RapportCelluleResponseModel.fromJson(notificationItem);
          }).toList();
          return FirebaseSuccess(notifications);


        ///------------------------
        /// Fetch rapport by responsableCelluleId
        ///------------------------

          case RequestRapportCellule(
              responsableCelluleId: final responsableCelluleId,
            )
            when responsableCelluleId.isNotEmpty:
          final response = await db
              .child('rapport_cellule')
              .orderByChild('responsableCelluleId')
              .equalTo(params.responsableCelluleId)
              .get();


          if (!response.exists) {
            return FirebaseError('Rapport cellule not found');
          }
          final data = response.value as Map<dynamic, dynamic>;
          log('data: $data');
          final notifications = data.values.map((e) {
            final notificationItem = convertMap(e as Map);
            return RapportCelluleResponseModel.fromJson(notificationItem);
          }).toList();
          return FirebaseSuccess(notifications);



        default: 
        return FirebaseError("Type de requête non supporté");
      }
    } catch (e, track) {
      AppLogger.error(
        'ProfileMapper',
        'Erreur lors du mapping',
        error: e,
        stack: track,
      );
      // rethrow;
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

/// -------------------------- Method:[getRapportCelluleByResponsableCelluleId] --------------------------------------------
/// Description:
/// Récupère la liste des rapports de cellule associés à un responsable
/// de cellule spécifique depuis Firebase Realtime Database.
///
/// Cette méthode permet d'extraire tous les rapports liés à un
/// responsable identifié par son `responsableCelluleId`.
///
/// Elle est utilisée pour filtrer les rapports et obtenir uniquement
/// ceux appartenant à un responsable donné.
///
/// Parameters:
/// • [params] : Paramètres de requête contenant les critères de recherche.
///   - [responsableCelluleId] : Identifiant du responsable de cellule
///     permettant de filtrer les rapports.
///
/// Returns:
/// • [FirebaseResult<List<RapportCelluleResponse>>] contenant la liste
///   des rapports associés au responsable.
/// • [FirebaseError] si aucun rapport n'est trouvé ou si une erreur
///   survient lors du traitement.
///
/// Throws:
/// • Cette méthode peut lever une [UnimplementedError] tant qu'elle
///   n'est pas encore implémentée.
/// • Erreurs Firebase lors de la lecture des données.
/// • Erreurs de conversion ou de mapping des données.
/// • Exceptions inattendues durant l'exécution.
///
/// Process:
/// • Récupération du `responsableCelluleId` depuis [params].
/// • Interrogation de Firebase sur le nœud des rapports de cellule.
/// • Filtrage des rapports par responsable.
/// • Conversion des données en [RapportCelluleResponse].
/// • Retour de la liste via un [FirebaseSuccess].
/// • Sinon retour d'un [FirebaseError].
  @override
  Future<FirebaseResult<List<RapportCelluleResponse>>>getRapportCelluleByResponsableCelluleId(RequestRapportCellule params) {
    // TODO: implement getRapportCelluleByResponsableCelluleId
    throw UnimplementedError();
  }
}

