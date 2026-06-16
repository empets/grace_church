import 'package:dartz/dartz.dart';
import 'package:grace_church/core/api/failure/fail.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/notification/domaine/entities/request/notification_request.dart';
import 'package:grace_church/feature/notification/domaine/repositories/i_notification_repositories.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ReadNotificationUsercase implements UseCase<String, RequestReadNotification> {
  ReadNotificationUsercase(this.repository);
  final NotificationDomaineRepositories repository;
  @override
  Future<Either<Failure, String>> call(RequestReadNotification params) {
    return repository.readNotification(params);
  }
}
