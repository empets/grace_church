import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_response.freezed.dart';
part 'notification_response.g.dart';



// --------------------------------
// Notification Response
@freezed
abstract class NotificationResponse with _$NotificationResponse {
  factory NotificationResponse({
    required String title,
    required String description,
    required String tag,
    required String date,
    required String notificationId,
    required List<NotificationClickResponse> clicks,
  }) = _NotificationResponse;
  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);
}


@freezed
abstract class NotificationClickResponse with _$NotificationClickResponse {
  factory NotificationClickResponse({
    required String menberId,
    required String vueAt,
  }) = _NotificationClickResponse;
  factory NotificationClickResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationClickResponseFromJson(json);
}