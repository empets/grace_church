import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/core/data_process/success.dart';
import 'package:grace_church/feature/authen/data/service/impl_remote_service.dart';
import 'package:grace_church/feature/authen/domaine/entities/request/authen_request.dart';
import 'package:grace_church/feature/authen/domaine/repository/authen_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: AuthenRepository)
class ImpleAuthenRepository implements AuthenRepository {
  ImpleAuthenRepository({required this.authenRemoteService});

  final AuthenRemoteService authenRemoteService;

  @override
  Future<Either<Failure, String?>> createProfile(
    RequestAuthenProfile request,
  ) async {
    final response = await authenRemoteService.createProfile(request);
    if (response is FirebaseSuccess<String?>) {
      final shared = await SharedPreferences.getInstance();
      await shared.setString('menberkey', response.data ?? '');
      return Right(response.data);
    } else if (response is FirebaseError) {
      return Left(Failure(message: response.toString()));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }

  @override
  Future<Either<Failure, String?>> createSocial(
    RequestAuthenSocial params,
  ) async {
    final response = await authenRemoteService.createSocial(params);
    if (response is FirebaseSuccess<String?>) {
      final shared = await SharedPreferences.getInstance();
      await shared.setString('menberkey', response.data ?? '');
      return Right(response.data);
    } else if (response is FirebaseError) {
      return Left(Failure(message: response.toString()));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }

  @override
  Future<Either<Failure, String?>> createSpiritualLife(
    RequestAuthenSpiritualLife request,
  ) async {
    final response = await authenRemoteService.createSpiritualLife(request);
    if (response is FirebaseSuccess<String?>) {
      final shared = await SharedPreferences.getInstance();
      await shared.setString('menberkey', response.data ?? '');
      return Right(response.data);
    } else if (response is FirebaseError) {
      return Left(Failure(message: response.toString()));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }

  @override
  Future<Either<Failure, String?>> createEngagement(
    RequestAuthenEngagement request,
  ) async {
    final response = await authenRemoteService.createEngagement(request);
    if (response is FirebaseSuccess<String?>) {
      final shared = await SharedPreferences.getInstance();
      await shared.setString('menberkey', response.data ?? '');
      return Right(response.data);
    } else if (response is FirebaseError) {
      return Left(Failure(message: response.toString()));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }
}
