import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/notification/domaine/entities/response/notification_response.dart';
import 'package:grace_church/feature/notification/domaine/repositories/i_notification_repositories.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetListNotificationUsercase implements UseCase<List<NotificationResponse>, EmptyRequest> {
  GetListNotificationUsercase(this.repository);
  final NotificationDomaineRepositories repository;
  @override
  Future<Either<Failure, List<NotificationResponse>>> call(EmptyRequest params) {
    return repository.getListNotifications(params);
  }
}


