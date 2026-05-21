import 'dart:developer';

import 'package:grace_church/core/bloc_state/bloc_state.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart';
import 'package:grace_church/feature/home/domaine/usercase/read_notification_usercase.dart';
import 'package:grace_church/feature/home/page/bloc/notification/event/notification_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReadNotificationBloc extends Bloc<NotificationReadEvent, ApiState<String>> {
  ReadNotificationBloc({required this.readNotificationUsercase}) : super(ApiState<String>.initial()) {
    on<NotificationReadEvent>(_onNotificationReadEvent);
  }

  final ReadNotificationUsercase readNotificationUsercase;
  
  Future<void> _onNotificationReadEvent(NotificationReadEvent event, Emitter<ApiState<String>> emit) async {

    switch (event) {
      case FetchNotificationReadEvent(:final menberId, :final notificationId):
       
       if(menberId.trim().isNotEmpty && notificationId.trim().isNotEmpty) {
           emit(ApiState<String>.load());

           log('notificationId: $notificationId');
     
       final response = await readNotificationUsercase(RequestReadNotification(menberId: menberId, notificationId: notificationId, vueAt: DateTime.now().toString()));
       
       emit(response.fold((l) => FailedState<String>(l.message), (r) => SuccessState<String>(r)));
   
       }

      
    }
    
  }
}