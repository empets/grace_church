import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:grace_church/core/data_process/request/request.dart';
import 'package:grace_church/core/data_process/success.dart';
import 'package:grace_church/core/extension/extention.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/home/data/model/home_model.dart';
import 'package:grace_church/feature/home/data/service/repository_remote_service.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart'
    hide EmptyRequest;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart' as shareData;
import 'package:firebase_database/firebase_database.dart' as databaseReference;
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: DomaineServiceRepository)
class ImpDomaineServiceRepository implements DomaineServiceRepository {
  ImpDomaineServiceRepository({required this.db});

  final databaseReference.DatabaseReference db;

  @override
  Future<FirebaseResult<ProfileResponseModel>> getProfile(
    EmptyRequest notParms,
  ) async {
    final shared = await shareData.SharedPreferences.getInstance();
    final menberkey = await shared.getString('menberkey');

    log('🔥Menberkey: $menberkey');

    try {
      final response = await db.child('menber/$menberkey').get();
      final data = Map<String, dynamic>.from(response.value as Map);
      log('🔥Data: $data ');

      if (response.exists) {
        final firebaseResult = ProfileResponseModel.fromJson(data);
        return FirebaseSuccess(firebaseResult);
      } else {
        return FirebaseError("une erreur est survenue");
      }
    } catch (e) {
      log('🔥Error getting profile: $e');
      return FirebaseError('${e.toString()}');
    }
  }

  @override
  Stream<FirebaseResult<ProfileResponseModel>> getProfileStream() async* {
    final shared = await shareData.SharedPreferences.getInstance();
    final menberkey = shared.getString('menberkey');

    if (menberkey == null) {
      yield FirebaseError("Menberkey not found");
      return;
    }

    databaseReference.FirebaseDatabase.instance
        .ref('users')
        .child(menberkey)
        .onValue
        .map((event) {
          final data = event.snapshot.value;

          if (data == null) {
            // Si l'utilisateur n'existe pas encore
            return FirebaseError("L'utilisateur n'existe pas");
          }
          // Conversion sécurisée en Map<String, dynamic>
          return FirebaseSuccess(
            ProfileResponseModel.fromJson(
              Map<String, dynamic>.from(data as Map),
            ),
          );
        });
  }

  @override
  Future<FirebaseResult<List<NotificationResponseModel>>> getListNotifications(
    EmptyRequest notParms,
  ) async {
    try {
      final snapshot = await db.child('notfications').get();
      if (snapshot.exists) {
        final data = snapshot.value as Map<dynamic, dynamic>;
        final notifications = data.values.map((e) {
          final notificationItem = Map<String, dynamic>.from(e);

          return NotificationResponseModel.fromJson(notificationItem);
        }).toList();
        return FirebaseSuccess(
          notifications
              .map((e) => NotificationResponseModel.fromJson(e.toJson()))
              .toList(),
        );
      }
      return FirebaseError("Aucune notification trouvée");
    } catch (e) {
      log("🔥 Firebase Notification →→→→→→→→→ ${e}");
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
            final notifications = data.values;
            if (data.values.isNotEmpty) {
              notifications
                  .map((e) {
                    final notificationItem = Map<String, dynamic>.from(e);
                    return NotificationResponseModel.fromJson(notificationItem);
                  })
                  .where((e) => e.title?.contains(params.title) ?? false)
                  .toList();
              // .toList();
              return FirebaseSuccess(
                notifications
                    .map((e) => NotificationResponseModel.fromJson(e.toJson()))
                    .toList(),
              );
            }
            return FirebaseSuccess([]);
          }

        case RequestNotification(tag: final tag) when tag.isNotEmpty:
          final snapshot = await db
              .child('notfications')
              .orderByChild('tag')
              .equalTo(params.tag)
              .get();
          if (snapshot.exists) {
            final data = snapshot.value as Map<dynamic, dynamic>;
            if (data.values.isNotEmpty) {
              final notifications = data.values.map((e) {
                final notificationItem = Map<String, dynamic>.from(e);
                return NotificationResponseModel.fromJson(notificationItem);
              }).toList();
              return FirebaseSuccess(
                notifications.map((e) {
                  return NotificationResponseModel.fromJson(e.toJson());
                }).toList(),
              );
            }
            return FirebaseSuccess([]);
          }
          return FirebaseError("Aucune notification trouvée");

        case RequestNotification(date: final date) when date.isNotEmpty:
          final snapshot = await db.child('notfications').get();

          if (snapshot.exists) {
            final data = snapshot.value as Map<dynamic, dynamic>;
            final notifications = data.values
                .map((e) {
                  final notificationItem = Map<String, dynamic>.from(e);
                  return NotificationResponseModel.fromJson(notificationItem);
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
          if (snapshot.exists) {
            final data = snapshot.value as Map<dynamic, dynamic>;
            log("🔥 Firebase Notification N →→→→→→→→→ $data");
            final notifications = data.values.map((e) {
              final notificationItem = Map<String, dynamic>.from(e);
              return NotificationResponseModel.fromJson(notificationItem);
            }).toList();
            return FirebaseSuccess(
              notifications
                  .map((e) => NotificationResponseModel.fromJson(e.toJson()))
                  .toList(),
            );
          }
          return FirebaseError("Aucune notification trouvée");
      }
      return FirebaseError("Aucune notification trouvée");
    } catch (e) {
      log("🔥 Firebase Notification n →→→→→→→→→ ${e}");
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
          return FirebaseError("Aucune notification trouvée");

        default:
          final snapshot = await db.child('cellule').get();
          if (snapshot.exists) {
            final data = snapshot.value as Map<dynamic, dynamic>;
            log("🔥 Firebase Notification N →→→→→→→→→ $data");
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
      log("🔥 Firebase Notification →→→→→→→→→ ${e}");
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
      log("🔥 Firebase Responsable Cellule →→→→→→→→→ ${e}");
      return FirebaseError(e.toString());
    }
  }

  @override
  Future<FirebaseResult<List<ReponsableResponseSecteurModel>>>
  getListResponsablesSecteurs(RequestReponsableSecteur params) async {
    try {
      final snapshot = await db.child('emsecteur').get();
      if (snapshot.exists) {
        final data = snapshot.value as Map<dynamic, dynamic>;
        final notifications = data.values.map((e) {
          final notificationItem = Map<String, dynamic>.from(e);
          return ReponsableResponseSecteurModel.fromJson(notificationItem);
        }).toList();
        return FirebaseSuccess(
          notifications
              .map((e) => ReponsableResponseSecteurModel.fromJson(e.toJson()))
              .toList(),
        );
      }
      return FirebaseError("Aucune responsables de secteur trouvés");
    } catch (e) {
      log("🔥 Firebase Responsable Secteur →→→→→→→→→ ${e}");
      return FirebaseError(e.toString());
    }
  }

  @override
  Future<FirebaseResult<List<ReponsableZoneResponseModel>>>
  getListResponsablesZones(RequestReponsableZone params) async {
    try {
      final snapshot = await db.child('emzone').get();
      if (snapshot.exists) {
        final data = snapshot.value as Map<dynamic, dynamic>;
        final notifications = data.values.map((e) {
          final notificationItem = Map<String, dynamic>.from(e);
          return ReponsableZoneResponseModel.fromJson(notificationItem);
        }).toList();
        return FirebaseSuccess(
          notifications
              .map((e) => ReponsableZoneResponseModel.fromJson(e.toJson()))
              .toList(),
        );
      }
      return FirebaseError("Aucune responsables de zone trouvés");
    } catch (e) {
      log("🔥 Firebase Responsable Zone →→→→→→→→→ ${e}");
      return FirebaseError(e.toString());
    }
  }


  @override
  Future<FirebaseResult<ProfileResponseModel>> sendImpliciteConnexion(RequestImpliciteConnexion params) async{
  
    try {
         final userIdExist = await db
            .child('menber')
            .orderByChild('deviceId')
            .equalTo(params.deviceId)
            .get();

         if(userIdExist.exists) { 
           final data = userIdExist.value as Map<dynamic, dynamic>;
           final notifications = data.values.map((e) {
             final notificationItem = Map<String, dynamic>.from(e);
             return ProfileResponseModel.fromJson(notificationItem);
           }).toList();
           return FirebaseSuccess(notifications.first);
         }
            log("🤕-------->> user not found");

         return FirebaseError("L'utilisateur n'existe pas");
        
      
    } catch (e) {
      log("🔥-------->> $e");
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
    } catch (e) {
      log("📦 Data envoyée : ${jsonEncode(params)}");
      log("🔥 Firebase ERROR sendRapportCelluleStepAdministration →" 
      "${FirebaseException(plugin: 'request',code:e.toString(),  message: e.toString())}");
      return FirebaseError(e.toString());
    }
  }
  



  @override
  Future<FirebaseResult<String>> sendRapportCelluleStepAssistance(RequestRapportCelluleAssistance params) async {
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
            'id': params.id,
            'userId': params.id.toString(),
          };
          // 2) Créer une nouvelle entrée
            await db.child('rapport_cellule/$localUserRequestSection').update(updates);
          

          // 4) Retourner le key généré
          return FirebaseSuccess(params.id); 
        }
        return FirebaseError('User not found');

      } catch (e) {
        log("${FirebaseException(message: e.toString(), plugin: "authen")}");
      

        log("🔥 Firebase ERROR updateProfile → $e");
        return FirebaseError(e.toString());
      }

      
  }
  
  @override
  Future<FirebaseResult<String>> sendRapportCelluleStepActivity(RequestRapportCelluleActivity params) async {
       final shared = await shareData.SharedPreferences.getInstance();
    final localUserRequestSection = shared.getString('rapport_cellule_key');

    try {
      final userIdExist = await db
          .child('rapport_cellule')
          .orderByChild('id')
          .equalTo(localUserRequestSection)
          .get();
          

      if (
          userIdExist.exists ) {
      
        final Map<String, dynamic> updates = {
          ...params.toJson(), // nouveaux champs simples
      
        };
        // 2) Créer une nouvelle entrée
        await db.child('rapport_cellule/${localUserRequestSection}').update(updates);

        // 4) Retourner le key généré
        return FirebaseSuccess(localUserRequestSection!);
      }
      return FirebaseError('User not found');

    } catch (e) {
      log("${FirebaseException(message: e.toString(), plugin: "authen")}");
    

      log("🔥 Firebase ERROR updateProfile → $e");
      return FirebaseError(e.toString());
    }
    
  }
  
  @override
  Future<FirebaseResult<String>> sendRapportCelluleStepSuggestion(RequestRapportCelluleSuggestion params) async {
    
    final shared = await shareData.SharedPreferences.getInstance();
    final localUserRequestSection = shared.getString('rapport_cellule_key');

    try {
      final userIdExist = await db
          .child('rapport_cellule')
          .orderByChild('id')
          .equalTo(localUserRequestSection)
          .get();
          
      if (
        userIdExist.exists ) {
        final Map<String, dynamic> updates = {
          ...params.toJson(), // nouveaux champs simples
        };
        // 2) Créer une nouvelle entrée
        await db.child('rapport_cellule/${localUserRequestSection}').update(updates);
        // 4) Retourner le key généré
        return FirebaseSuccess(localUserRequestSection!);
      }
      return FirebaseError('User not found');
    } catch (e) {
      log("${FirebaseException(message: e.toString(), plugin: "authen")}");
    

      log("🔥 Firebase ERROR updateProfile → $e");
      return FirebaseError(e.toString());
    }
    
  }
}
