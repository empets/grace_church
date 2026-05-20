import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:grace_church/core/bloc_state/bloc_state.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart' hide EmptyRequest;
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_list_notification_usercase.dart';
import 'package:grace_church/feature/home/page/bloc/notification/event/notification_event.dart';

class NotificationBloc
    extends Bloc<NotificationEvent, ApiState<List<NotificationResponse>>> {
  NotificationBloc({required this.getListNotificationUsercase, required this.getListNotificationByCriteriaUsercase})
    : super(ApiState<List<NotificationResponse>>.initial()) {
    on<NotificationEvent>(getListNotification);
  }

  final GetListNotificationUsercase getListNotificationUsercase;
  final GetListNotificationByCriteriaUsercase getListNotificationByCriteriaUsercase;

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
              log("NOTIFICATION 1.1 <<<:::::-----------_>> ${failure}");
              return ApiState<List<NotificationResponse>>.failed(failure.message);
            },
            (success) {
              log("NOTIFICATION 1.2 <<<:::::-----------_>> ${success}");
              return ApiState<List<NotificationResponse>>.success(
              success,
              status: FormzSubmissionStatus.success,
            );
            },
          ),
        );

        break;


       case FetchByTagNotificationEvent(:final tag, :final title, :final date):
         if(tag == null && title == null && date == null) return;

         if(tag != null && tag.isNotEmpty) {
          emit(ApiState<List<NotificationResponse>>.load());
         final result = await getListNotificationByCriteriaUsercase.call(RequestNotification(tag: tag, title: '', date: '',description: ''));
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

         };
         if(title != null && title.isNotEmpty) {
                   emit(ApiState<List<NotificationResponse>>.load());
         final result = await getListNotificationByCriteriaUsercase.call(RequestNotification(tag: '', title: title, date: '',description: ''));
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

         };
         if(date != null && date.isNotEmpty) {
          emit(ApiState<List<NotificationResponse>>.load());
         final result = await getListNotificationByCriteriaUsercase.call(RequestNotification(tag: '', title: '', date: date, description: ''));
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
