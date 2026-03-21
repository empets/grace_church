import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_event.freezed.dart';

@freezed
abstract class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.fetch() = FetchNotificationEvent;
  const factory NotificationEvent.fetchByTag({ String? tag, String? title, String? date}) = FetchByTagNotificationEvent;
}
