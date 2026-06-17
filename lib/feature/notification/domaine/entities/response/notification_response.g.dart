// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationResponse _$NotificationResponseFromJson(
  Map<String, dynamic> json,
) => _NotificationResponse(
  title: json['title'] as String,
  description: json['description'] as String,
  tag: json['tag'] as String,
  date: json['date'] as String,
  notificationId: json['notificationId'] as String,
  clicks: (json['clicks'] as List<dynamic>)
      .map((e) => NotificationClickResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$NotificationResponseToJson(
  _NotificationResponse instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'tag': instance.tag,
  'date': instance.date,
  'notificationId': instance.notificationId,
  'clicks': instance.clicks,
};

_NotificationClickResponse _$NotificationClickResponseFromJson(
  Map<String, dynamic> json,
) => _NotificationClickResponse(
  menberId: json['menberId'] as String,
  vueAt: json['vueAt'] as String,
);

Map<String, dynamic> _$NotificationClickResponseToJson(
  _NotificationClickResponse instance,
) => <String, dynamic>{'menberId': instance.menberId, 'vueAt': instance.vueAt};
