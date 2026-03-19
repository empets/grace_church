import 'dart:developer';

import 'package:grace_church/core/data_process/success.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/home/data/model/home_model.dart';
import 'package:grace_church/feature/home/data/service/repository_remote_service.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart' as shareData;
import 'package:firebase_database/firebase_database.dart' as databaseReference;

@LazySingleton(as: DomaineServiceRepository)
class ImpDomaineServiceRepository implements DomaineServiceRepository {
  ImpDomaineServiceRepository({required this.db});

  final databaseReference.DatabaseReference db;

  @override
  Future<FirebaseResult<ProfileResponseModel>> getProfile(
    NoParams notParms,
  ) async {
    final shared = await shareData.SharedPreferences.getInstance();
    final menberkey = shared.getString('menberkey');

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
}
