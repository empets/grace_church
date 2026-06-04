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

  @override
  Future<FirebaseResult<List<NotificationResponseModel>>>
  getListNotificationsByCriteria(RequestNotification params) async {
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
                .where((e) => e.date?.contains(params.date) ?? false)
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

  @override
  Future<FirebaseResult<List<CelluleResponseModel>>> getListCellules(
    RequestCellule params,
  ) async {
    try {
      switch (params) {
        case RequestCellule(
              celluleId: final celluleId,
              celluleCode: final celluleCode,
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

  @override
  Future<FirebaseResult<List<ReponsableCelluleResponseModel>>>
  getListResponsablesCellules(RequestReponsableCellule params) async {
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

  @override
  Future<FirebaseResult<String>> sendRapportCelluleStepAssistance(
    RequestRapportCelluleAssistance params,
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
          'id': localUserRequestSection,
        };
        // 2) Créer une nouvelle entrée
        await db
            .child('rapport_cellule/$localUserRequestSection')
            .update(updates);

        // 4) Retourner le key généré
        return FirebaseSuccess(params.id);
      }
      return FirebaseError('User not found');
    } catch (e) {
      log("🔥 Firebase ERROR updateProfile → $e");
      return FirebaseError(e.toString());
    }
  }

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

  @override
  Future<FirebaseResult<String>> readNotification(
    RequestReadNotification params,
  ) async {
    log('readNotification: ${params.toJson()}');
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

  @override
  Future<FirebaseResult<List<RapportCelluleResponse>>>
  getRapportCelluleByResponsableCelluleId(RequestRapportCellule params) {
    // TODO: implement getRapportCelluleByResponsableCelluleId
    throw UnimplementedError();
  }
}

List<Map<String, dynamic>> parseImages(dynamic data) {
  if (data == null) return [];

  if (data is List) {
    return data.map((e) => e as Map<String, dynamic>).toList();
  }

  if (data is Map) {
    return data.values.map((e) => e as Map<String, dynamic>).toList();
  }

  return [];
}

Map<String, dynamic> convertMap(Map data) {
  return data.map((key, value) {
    if (value is Map) {
      return MapEntry(key.toString(), convertMap(value));
    } else if (value is List) {
      return MapEntry(
        key.toString(),
        value.map((e) {
          if (e is Map) {
            return convertMap(e);
          }

          return e;
        }).toList(),
      );
    }

    return MapEntry(key.toString(), value);
  });
}

Map<String, dynamic> convertMapToNotificationClick(Map data) {
  return data.map((key, value) {
    if (value is Map) {
      return MapEntry(key.toString(), convertMapToNotificationClick(value));
    } else if (value is List) {
      return MapEntry(
        key.toString(),
        value.map((e) {
          if (e is Map) {
            return convertMapToNotificationClick(e);
          }

          return e;
        }).toList(),
      );
    }
    if (value == null) {
      return MapEntry(key.toString(), {});
    }

    return MapEntry(key.toString(), value);
  });
}

Map<String, dynamic> parseFirebaseMap(dynamic raw) {
  if (raw == null || raw is! Map) return {};

  final map = Map<String, dynamic>.from(raw);

  map.forEach((key, value) {
    if (value is Map) {
      map[key] = parseFirebaseMap(value);
    } else if (value is List) {
      map[key] = value
          .map((item) => item is Map ? parseFirebaseMap(item) : item)
          .toList();
    }
  });
  log("======>>  parsed map ${map}");

  return map; // ✅ ne touche plus clicks ici
}

Map<String, dynamic> parseFirebaseMapForNotificationClick(dynamic raw) {
  if (raw == null || raw is! Map) return {};

  final map = Map<String, dynamic>.from(raw);

  map.forEach((key, value) {
    if (value is Map) {
      map[key] = parseFirebaseMapForNotificationClick(value);
    } else if (value is List) {
      map[key] = value
          .map(
            (item) =>
                item is Map ? parseFirebaseMapForNotificationClick(item) : item,
          )
          .toList();
    }
  });

  if (map['clicks'] is Map<String, dynamic>) {
    map['clicks'] = (map['clicks'] as Map<String, dynamic>).values.map((click) {
      log("======>> list parsed click  ${click}");
      return Map<String, dynamic>.from(click as Map);
    }).toList();
  } else {
    log("======>>  parsed map ${map}");
    map['clicks'] = <Map<String, dynamic>>[];
  }

  return map; // ✅ ne touche plus clicks ici
}
