import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart' as databaseReference;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:grace_church/core/data_process/request/request.dart';
import 'package:grace_church/core/data_process/success.dart';
import 'package:grace_church/feature/authen/data/service/impl_remote_service.dart';
import 'package:grace_church/feature/authen/domaine/entities/request/authen_request.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart' as shareData;

@LazySingleton(as: AuthenRemoteService)
class ImplRemoteService implements AuthenRemoteService {
  ImplRemoteService({required this.db});
  final databaseReference.DatabaseReference db;

  @override
  Future<FirebaseResult<String?>> createProfile(
    RequestAuthenProfile params,
  ) async {
    try {
      final snapShot = await db
          .child('menber')
          .orderByChild('name')
          .equalTo(params.name)
          .get();

      if (snapShot.exists) {
        return FirebaseError("Cet utilisateur existe deja");
      } else {
        // 1) Construire l'objet Request
        final request = Request<RequestAuthenProfile>(
          data: params.toJson(),
          user: "",
          serviceLibelle: 'serviceLibelle',
        );
        // 2) Créer une nouvelle entré ou table
        final ref = db.child('menber').push();
        // 3) Sauvegarder dans Firebase (en convertissant en Map)
        await ref.set(request.data);

        // 4) Mettre à jour la clé
        await updateProfileKey(
          RequestAuthenProfileUpdateKey(menberId: ref.key.toString()),
        );

        // 5) Télécharger l'image
        final result = await uploadprofileImage(
          params: RequestAuthenProfileUpdateImage(
            profileImage: params.profileImage,
            menberId: ref.key.toString(),
          ),
        );
        if (result is FirebaseSuccess<String?>) {
          log("-----------_>>1 ${result.data}");
          final Map<String, dynamic> updates = {
            ...params
                .copyWith(profileImage: result.data.toString())
                .toJson(), // nouveaux champs simples
            'serviceLibelle': '',
          };
          // 2) Créer une nouvelle entrée
          await db.child('menber/${ref.key.toString()}').update(updates);
        }

        // 4) Retourner le key généré
        return FirebaseSuccess(ref.key);
      }
    } catch (e) {
      log("🔥 Firebase ERROR createProfile → $e");
      return FirebaseError(e.toString());
    }
  }

  @override
  Future<FirebaseResult<String?>> createSocial(
    RequestAuthenSocial params,
  ) async {
    final shared = await shareData.SharedPreferences.getInstance();
    final localUserSection = shared.getString('menberkey');

    try {
      if (localUserSection != null && localUserSection.isNotEmpty) {
        final Map<String, dynamic> updates = {
          ...params.toJson(), // nouveaux champs simples
          'serviceLibelle': '',
          'userId': localUserSection.toString(),
        };
        // 2) Créer une nouvelle entrée
        await db.child('menber/$localUserSection').update(updates);

        // 4) Retourner le key généré
        return FirebaseSuccess(localUserSection);
      }

      final Map<String, dynamic> updates = {
        ...params.toJson(), // nouveaux champs simples
        'serviceLibelle': '',
        '': localUserSection.toString(),
      };
      // 2) Créer une nouvelle entrée
      await db.child('menber/$localUserSection').update(updates);

      // 4) Retourner le key généré
      return FirebaseSuccess(localUserSection);
    } catch (e) {
      return FirebaseError(e.toString());
    }
  }

  @override
  Future<FirebaseResult<String?>> createSpiritualLife(
    RequestAuthenSpiritualLife params,
  ) async {
    final shared = await shareData.SharedPreferences.getInstance();
    final localUserSection = shared.getString('menberkey');

    try {
      if (localUserSection != null && localUserSection.isNotEmpty) {
        final Map<String, dynamic> updates = {
          ...params.toJson(), // nouveaux champs simples
          'serviceLibelle': '',
          'userId': localUserSection.toString(),
        };
        // 2) Créer une nouvelle entrée
        await db.child('menber/$localUserSection').update(updates);

        // 4) Retourner le key généré
        return FirebaseSuccess(localUserSection);
      }

      final Map<String, dynamic> updates = {
        ...params.toJson(), // nouveaux champs simples
        'serviceLibelle': '',
        '': localUserSection.toString(),
      };
      // 2) Créer une nouvelle entrée
      await db.child('menber/$localUserSection').update(updates);

      // 4) Retourner le key généré
      return FirebaseSuccess(localUserSection);
    } catch (e) {
      return FirebaseError(e.toString());
    }
  }

  @override
  Future<FirebaseResult<String?>> createEngagement(
    RequestAuthenEngagement params,
  ) async {
    final shared = await shareData.SharedPreferences.getInstance();
    final localUserSection = shared.getString('menberkey');

    try {
      if (localUserSection != null && localUserSection.isNotEmpty) {
        final Map<String, dynamic> updates = {
          ...params.toJson(), // nouveaux champs simples
          'serviceLibelle': '',
          'userId': localUserSection.toString(),
        };
        // 2) Créer une nouvelle entrée
        await db.child('menber/$localUserSection').update(updates);

        // 4) Retourner le key généré
        return FirebaseSuccess(localUserSection);
      }

      final Map<String, dynamic> updates = {
        ...params.toJson(), // nouveaux champs simples
        'serviceLibelle': '',
        '': localUserSection.toString(),
      };
      // 2) Créer une nouvelle entrée
      await db.child('menber/$localUserSection').update(updates);

      // 4) Retourner le key généré
      return FirebaseSuccess(localUserSection);
    } catch (e) {
      return FirebaseError(e.toString());
    }
  }

  Future<FirebaseResult<String?>> updateProfileKey(
    RequestAuthenProfileUpdateKey params,
  ) async {
    try {
      final Map<String, dynamic> updates = {
        ...params.toJson(), // nouveaux champs simples
      };
      // 2) Créer une nouvelle entrée
      await db.child('menber/${params.menberId}').update(updates);

      // 4) Retourner le key généré
      return FirebaseSuccess(params.menberId);
    } catch (e) {
      log('************$e');
      return FirebaseError(e.toString());
    }
  }

  Future<FirebaseResult<String?>> uploadProfileImage(
    RequestAuthenProfileUpdateImage params,
  ) async {
    try {
      final Map<String, dynamic> updates = {
        ...params
            .copyWith(profileImage: params.profileImage)
            .toJson(), // nouveaux champs simples
      };
      // 2) Créer une nouvelle entrée
      await db.child('menber/${params.menberId}').update(updates);

      // 4) Retourner le key généré
      return FirebaseSuccess(params.profileImage);
    } catch (e) {
      log('************$e');
      return FirebaseError(e.toString());
    }
  }

  Future<FirebaseResult<String?>> uploadprofileImage({
    required RequestAuthenProfileUpdateImage params,
  }) async {
    try {
      final ref =
          FirebaseStorage.instanceFor(app: Firebase.app("authenfication"))
              .ref("menber")
              .child("profile_images")
              .child(
                "${params.menberId}_${DateTime.now().millisecondsSinceEpoch}.jpg",
              );

      await ref.putFile(File(params.profileImage));

      final response = await ref.getDownloadURL();

      log("Image URL : $response");

      return FirebaseSuccess(response);
    } catch (e) {
      log("Upload Error : $e");
      return FirebaseError(e.toString());
    }
  }

  //generic methode
  Future<void> saveImageUrl<T extends Object>(
    T params, {
    required RequestAuthenProfileUpdateImage imageParams,
  }) async {
    // CreatCompteImage
    final Map<String, dynamic> updates = {
      ...imageParams.toJson(), // nouveaux champs simples
    };

    await db
        .child('${imageParams.profileImage}/${imageParams.menberId}')
        .update(updates);
  }
}
