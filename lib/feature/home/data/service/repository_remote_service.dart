import 'package:grace_church/core/data_process/success.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/home/data/model/home_model.dart';

abstract class DomaineServiceRepository {
  Future<FirebaseResult<ProfileResponseModel>> getProfile(NoParams notParms);
}
