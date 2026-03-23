import 'dart:developer';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart' as databaseReference;
import 'package:grace_church/core/data_process/request/request.dart';
import 'package:grace_church/core/data_process/success.dart';
import 'package:grace_church/feature/authen/data/service/impl_remote_service.dart';
import 'package:grace_church/feature/authen/domaine/entities/request/authen_request.dart';
import 'package:grace_church/feature/home/data/model/home_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart' as shareData;
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: AuthenRemoteService)
class ImplRemoteService implements AuthenRemoteService {
  ImplRemoteService({required this.db});
  final databaseReference.DatabaseReference db;
  final supabase = Supabase.instance.client;

  @override
  Future<FirebaseResult<String?>> createProfile(
    RequestAuthenProfile params,
  ) async {
    final shared = await shareData.SharedPreferences.getInstance();
    final localUserSection = shared.getString('menberkey');

    try {
      final snapShot = await db.child('menber').get();

      if (snapShot.exists) {
        final snapShot = await db
            .child('menber')
            .orderByChild('name')
            .equalTo(params.name)
            .get();

        if (snapShot.exists) {
          return FirebaseError("Cet utilisateur existe deja");
        }

        log("🔥 Firebase ERROR createProfile → Cet utilisateur existe deja");
        return FirebaseError("Cet utilisateur existe deja");
      } else if (localUserSection != null && localUserSection.isNotEmpty) {
        final Map<String, dynamic> updates = {
          ...params.toJson(), // nouveaux champs simples
          'serviceLibelle': '',
          'userId': localUserSection.toString(),
        };
        // 2) Créer une nouvelle entrée
        await db.child('menber/$localUserSection').update(updates);

        // 4) Retourner le key généré
        return FirebaseSuccess(localUserSection);
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
            createAt: DateTime.now().toIso8601String(),
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
      log("🔥 Firebase updateProfileKey → menberId: ${params.menberId}");

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
      // log("--->>Image URL : $imageUrl");
      final pathInBucket = 'upload/${params.profileImage}.jpg';

      await supabase.storage
          .from('menberProfile')
          .upload(
            pathInBucket,
            File(params.profileImage), // ici File du fichier local
          );

      final imageUrl = supabase.storage
          .from('menberProfile')
          .getPublicUrl(pathInBucket);

      log("--->>Image URL : $imageUrl");

      return FirebaseSuccess(imageUrl);
    } catch (e) {
      log("0-==============Upload Error : $e");
      return FirebaseError(e.toString());
    }
  }

  @override
  Future<FirebaseResult<ProfileResponseModel>> createSignIn(
    RequestAuthenSignIn params,
  ) async {
    final snapshot = await db.child('menber').get();

    try {
      if (snapshot.exists) {
        final emailSnapshot = await db
            .child('menber')
            .orderByChild('email')
            .equalTo(params.email)
            .get();
        final contactSnapshot = await db
            .child('menber')
            .orderByChild('contact')
            .equalTo(params.contact)
            .get();

        final passwordSnapshot = await db
            .child('menber')
            .orderByChild('password')
            .equalTo(params.password)
            .get();

        if (emailSnapshot.exists &&
            contactSnapshot.exists &&
            passwordSnapshot.exists) {
          final response = await db.child('menber').get();
          final data = Map<String, dynamic>.from(response.value as Map);
          final firebaseResult = ProfileResponseModel.fromJson(data);
          return FirebaseSuccess(firebaseResult);
        }
        return FirebaseError("Cet utilisateur existe deja");
      } else {
        return FirebaseError("une erreur est survenue");
      }
    } catch (e) {
      log('🔥Error getting profile: $e');
      return FirebaseError('${e.toString()}');
    }
  }
}
