import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_request.freezed.dart';
part 'notification_request.g.dart';




//-----------------------------
//  NOTIFICATION REQUEST MODEL
//------------------------------
@freezed
abstract class RequestNotification with _$RequestNotification {
  factory RequestNotification({
    required String title,
    required String tag,
    required String date,
    required String description,
  }) = _RequestNotification;
  factory RequestNotification.fromJson(Map<String, dynamic> json) =>
      _$RequestNotificationFromJson(json);
}


@freezed
abstract class RequestReadNotification
    with _$RequestReadNotification {
  factory RequestReadNotification({
    required String notificationId,
    required String menberId,
    required String vueAt,
  }) = _RequestReadNotification;
  factory RequestReadNotification.fromJson(Map<String, dynamic> json) =>
      _$RequestReadNotificationFromJson(json);
}