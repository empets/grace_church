import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart' show RequestNotification;
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/domaine/repository/home_domain_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetListNotificationUsercase implements UseCase<List<NotificationResponse>, EmptyRequest> {
  GetListNotificationUsercase(this.repository);
  final HomeDomaineRepository repository;
  @override
  Future<Either<Failure, List<NotificationResponse>>> call(EmptyRequest params) {
    return repository.getListNotifications(params);
  }
}


@lazySingleton
class GetListNotificationByCriteriaUsercase implements UseCase<List<NotificationResponse>, RequestNotification> {
  GetListNotificationByCriteriaUsercase(this.repository);
  final HomeDomaineRepository repository;
  @override
  Future<Either<Failure, List<NotificationResponse>>> call(RequestNotification params) {
    return repository.getListNotificationsByCriteria(params);
  }
}