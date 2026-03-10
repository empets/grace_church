
import 'package:grace_church/core/data_process/success.dart';
import 'package:grace_church/feature/authen/domaine/entities/request/authen_request.dart';


abstract class AuthenRemoteService {
  Future<FirebaseResult<String?>> createProfile(RequestAuthenProfile params);
  Future<FirebaseResult<String?>> createSocial(RequestAuthenSocial params);
  Future<FirebaseResult<String?>> createSpiritualLife(RequestAuthenSpiritualLife params);
  Future<FirebaseResult<String?>> createEngagement(RequestAuthenEngagement params);
}