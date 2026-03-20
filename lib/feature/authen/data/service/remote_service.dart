import 'dart:developer';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart' as databaseReference;
import 'package:grace_church/core/data_process/request/request.dart';
import 'package:grace_church/core/data_process/success.dart';
import 'package:grace_church/feature/authen/data/service/impl_remote_service.dart';
import 'package:grace_church/feature/authen/domaine/entities/request/authen_request.dart';
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
      final snapShot = await db
          .child('menber')
          .orderByChild('name')
          .equalTo(params.name)
          .get();

      if (snapShot.exists) {
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
      // await supabase.storage
      //     .from('profiles')
      //     .upload(
      //       '${params.profileImage}/${params.menberId}.jpg',
      //       File(params.profileImage),
      //     );

      // final imageUrl = supabase.storage
      //     .from('profiles')
      //     .getPublicUrl('${params.profileImage}/${params.menberId}.jpg');

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

  //generic methode
  // Future<void> saveImageUrl<T extends Object>(
  //   T params, {
  //   required RequestAuthenProfileUpdateImage imageParams,
  // }) async {
  //   // CreatCompteImage
  //   final Map<String, dynamic> updates = {
  //     ...imageParams.toJson(), // nouveaux champs simples
  //   };

  //   await supabase.storage
  //       .from('menberProfile')
  //       .upload(
  //         'uploads/${imageParams.profileImage}/${imageParams.menberId}.jpg',
  //         File(imageParams.profileImage),
  //       );

  //   final imageUrl = supabase.storage
  //       .from('menberProfile')
  //       .getPublicUrl(
  //         'uploads/${imageParams.profileImage}/${imageParams.menberId}.jpg',
  //       );

  //   await db
  //       .child('${imageParams.profileImage}/${imageParams.menberId}')
  //       .update(updates);
  // }

  // Future<String?> uploadImage(File file) async {
  //   try {
  //     final fileName = DateTime.now().millisecondsSinceEpoch.toString();

  //     await supabase.storage
  //         .from('images')
  //         .upload('uploads/$fileName.jpg', file);

  //     final imageUrl = supabase.storage
  //         .from('images')
  //         .getPublicUrl('uploads/$fileName.jpg');

  //     return imageUrl;
  //   } catch (e) {
  //     print('Erreur: $e');
  //     return null;
  //   }
  // }
}
