// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RequestNotification _$RequestNotificationFromJson(Map<String, dynamic> json) =>
    _RequestNotification(
      title: json['title'] as String,
      tag: json['tag'] as String,
      date: json['date'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$RequestNotificationToJson(
  _RequestNotification instance,
) => <String, dynamic>{
  'title': instance.title,
  'tag': instance.tag,
  'date': instance.date,
  'description': instance.description,
};

_RequestReadNotification _$RequestReadNotificationFromJson(
  Map<String, dynamic> json,
) => _RequestReadNotification(
  notificationId: json['notificationId'] as String,
  menberId: json['menberId'] as String,
  vueAt: json['vueAt'] as String,
);

Map<String, dynamic> _$RequestReadNotificationToJson(
  _RequestReadNotification instance,
) => <String, dynamic>{
  'notificationId': instance.notificationId,
  'menberId': instance.menberId,
  'vueAt': instance.vueAt,
};
