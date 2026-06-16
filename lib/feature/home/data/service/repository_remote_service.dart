import 'package:grace_church/core/data_process/success.dart';
import 'package:grace_church/feature/home/data/model/home_model.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart'
    hide EmptyRequest;

abstract class DomaineServiceRepository {
  

  // ----------------------------------------------------------------------------------------------------------------------------
  // Methode: getProfile                                    
  // Paramètre: RequestGetProfile
  // Retour: ProfileResponse
  // Description: Cette methode permet de récupérer le profil de l'utilisateur
  // ----------------------------------------------------------------------------------------------------------------------------
  Future<FirebaseResult<ProfileResponseModel>> getProfile(
    RequestGetProfile notParms,
  );

   

}

