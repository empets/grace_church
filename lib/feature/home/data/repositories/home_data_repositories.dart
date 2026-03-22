import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/core/data_process/success.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/home/data/model/home_model.dart';
import 'package:grace_church/feature/home/data/service/repository_remote_service.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart' hide EmptyRequest;
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/domaine/repository/home_domain_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeDomaineRepository)
class ImpleHomeDataRepositories implements HomeDomaineRepository {
  ImpleHomeDataRepositories({required this.domaineServiceRepository});

  final DomaineServiceRepository domaineServiceRepository;

  @override
  Future<Either<Failure, ProfileResponse>> getProfile(EmptyRequest notParms) async {
    final response = await domaineServiceRepository.getProfile(notParms);

    if (response is FirebaseSuccess<ProfileResponseModel>) {
      return Right(ProfileResponseModel.domaine(response.data));
    } else if (response is FirebaseError) {
      return Left(Failure(message: response.toString()));
    }
    return Left(Failure(message: "Erreur inconnue"));
  }
  
  @override
  Stream<Either<Failure, ProfileResponse>> getProfileStream() {
    return domaineServiceRepository.getProfileStream().map((event) {
      if (event is FirebaseSuccess<ProfileResponseModel>) {
        return Right(ProfileResponseModel.domaine(event.data));
      } else if (event is FirebaseError) {
        return Left(Failure(message: event.toString()));
      }
      return Left(Failure(message: "Erreur inconnue"));
    });
  }

  @override
  Future<Either<Failure, String>> sendNotifications(RequestNotification params) async{
    // final response = await domaineServiceRepository.sendNotifications(params);
    
    // if (response is FirebaseSuccess<String>) {
    //   return Right(response.data);
    // } else if (response is FirebaseError) {
    //   return Left(Failure(message: response.toString()));
    // }
    // return Left(Failure(message: "Erreur inconnue"));
    // TODO: implement sendNotifications
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<NotificationResponse>>> getListNotifications(EmptyRequest notParms)async {
        final response = await domaineServiceRepository.getListNotifications(notParms);
    if (response is FirebaseSuccess<List<NotificationResponseModel>>) {
      return Right(response.data.map(NotificationResponseModel.toDomaine).toList());
    } else if (response is FirebaseError) {
      return Left(Failure(message: response.toString()));
    }
    return Left(Failure(message: "Erreur inconnue"));
 
  }
  
  @override
  Future<Either<Failure, List<NotificationResponse>>> getListNotificationsByCriteria(RequestNotification params) async{
    final response = await domaineServiceRepository.getListNotificationsByCriteria(params);
    if (response is FirebaseSuccess<List<NotificationResponseModel>>) {
      return Right(response.data.map(NotificationResponseModel.toDomaine).toList());
    } else if (response is FirebaseError) {
      return Left(Failure(message: response.toString()));
    }
    return Left(Failure(message: "Erreur inconnue"));   
  }
  
  @override
  Future<Either<Failure, List<CelluleResponse>>> getListCellules(RequestCellule params) async{
    final response = await domaineServiceRepository.getListCellules(params);
    if (response is FirebaseSuccess<List<CelluleResponseModel>>) {
      return Right(response.data.map(CelluleResponseModel.domaine).toList());
    } else if (response is FirebaseError) {
      return Left(Failure(message: response.toString()));
    }
    return Left(Failure(message: "Erreur inconnue"));  
  }
  
}
