import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_event.freezed.dart';

@freezed
abstract class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.fetch() = FetchNotificationEvent;
  const factory NotificationEvent.fetchByTag({ String? tag, String? title, String? date}) = FetchByTagNotificationEvent;
}


@freezed
abstract class NotificationReadEvent with _$NotificationReadEvent {
  const factory NotificationReadEvent.fetch({ required String menberId, required String notificationId  }) = FetchNotificationReadEvent;
 
}
