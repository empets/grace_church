import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/core/data_process/success.dart';
import 'package:grace_church/feature/home/data/model/home_model.dart';
import 'package:grace_church/feature/home/data/service/repository_remote_service.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart'
    hide EmptyRequest;
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/domaine/repository/home_domain_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: HomeDomaineRepository)
class ImpleHomeDataRepositories implements HomeDomaineRepository {
  ImpleHomeDataRepositories({required this.domaineServiceRepository});

  final DomaineServiceRepository domaineServiceRepository;


  // ----------------------------------------------------------------------------------------------------------------------------
  // Methode: getProfile                                    
  // Paramètre: RequestGetProfile
  // Retour: ProfileResponse
  // Description: Cette methode permet de récupérer le profil de l'utilisateur
  // ----------------------------------------------------------------------------------------------------------------------------
  @override
  Future<Either<Failure, ProfileResponse>> getProfile(
    RequestGetProfile notParms,
  ) async {
    final response = await domaineServiceRepository.getProfile(notParms);
    if (response is FirebaseSuccess<ProfileResponseModel>) {
        final shared = await SharedPreferences.getInstance();
      await shared.setString('menberkey', response.data.menberId ?? "");
      return Right(ProfileResponseModel.domaine(response.data));
    } else if (response is FirebaseError<ProfileResponseModel>) {
      return Left(Failure(message: response.message));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }






}
