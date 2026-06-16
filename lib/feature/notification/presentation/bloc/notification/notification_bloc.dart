import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:grace_church/core/bloc_state/bloc_state.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/notification/domaine/entities/request/notification_request.dart';
import 'package:grace_church/feature/notification/domaine/entities/response/notification_response.dart';
import 'package:grace_church/feature/notification/domaine/usecase/get_list_notification_usercase.dart';
import 'package:grace_church/feature/notification/domaine/usecase/get_noftification_list_by_criterya.dart';
import 'package:grace_church/feature/notification/presentation/bloc/notification/event/notification_event.dart';

class NotificationBloc
    extends Bloc<NotificationEvent, ApiState<List<NotificationResponse>>> {
  NotificationBloc({
    required this.getListNotificationUsercase,
    required this.getListNotificationByCriteriaUsercase,
  }) : super(ApiState<List<NotificationResponse>>.initial()) {
    on<NotificationEvent>(getListNotification);
  }

  final GetListNotificationUsercase getListNotificationUsercase;
  final GetListNotificationByCriteriaUsercase
  getListNotificationByCriteriaUsercase;

  Future<void> getListNotification(
    NotificationEvent event,
    Emitter<ApiState<List<NotificationResponse>>> emit,
  ) async {
    switch (event) {
      case FetchNotificationEvent():
        emit(ApiState<List<NotificationResponse>>.load());
        final result = await getListNotificationUsercase.call(EmptyRequest());
        emit(
          result.fold(
            (failure) {
              return ApiState<List<NotificationResponse>>.failed(
                failure.message,
              );
            },
            (success) {
              return ApiState<List<NotificationResponse>>.success(
                success,
                status: FormzSubmissionStatus.success,
              );
            },
          ),
        );

        break;

      case FetchByTagNotificationEvent(:final tag, :final title, :final date):
        if (tag == null && title == null && date == null) return;

        if (tag != null && tag.isNotEmpty) {
          emit(ApiState<List<NotificationResponse>>.load());
          final result = await getListNotificationByCriteriaUsercase.call(
            RequestNotification(tag: tag, title: '', date: '', description: ''),
          );
          emit(
            result.fold(
              (failure) =>
                  ApiState<List<NotificationResponse>>.failed(failure.message),
              (success) => ApiState<List<NotificationResponse>>.success(
                success,
                status: FormzSubmissionStatus.success,
              ),
            ),
          );
        }
        ;
        if (title != null && title.isNotEmpty) {
          emit(ApiState<List<NotificationResponse>>.load());
          final result = await getListNotificationByCriteriaUsercase.call(
            RequestNotification(
              tag: '',
              title: title,
              date: '',
              description: '',
            ),
          );
          emit(
            result.fold(
              (failure) =>
                  ApiState<List<NotificationResponse>>.failed(failure.message),
              (success) => ApiState<List<NotificationResponse>>.success(
                success,
                status: FormzSubmissionStatus.success,
              ),
            ),
          );
        }
        ;
        if (date != null && date.isNotEmpty) {
          emit(ApiState<List<NotificationResponse>>.load());
          final result = await getListNotificationByCriteriaUsercase.call(
            RequestNotification(
              tag: '',
              title: '',
              date: date,
              description: '',
            ),
          );
          emit(
            result.fold(
              (failure) =>
                  ApiState<List<NotificationResponse>>.failed(failure.message),
              (success) => ApiState<List<NotificationResponse>>.success(
                success,
                status: FormzSubmissionStatus.success,
              ),
            ),
          );
        }
        break;
      default:
    }
  }
}
