// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationResponseModel _$NotificationResponseModelFromJson(
  Map<String, dynamic> json,
) => _NotificationResponseModel(
  title: json['title'] as String? ?? '',
  description: json['description'] as String? ?? '',
  tag: json['tag'] as String? ?? '',
  date: json['date'] as String? ?? '',
  notificationId: json['notificationId'] as String? ?? '',
  clicks:
      (json['clicks'] as List<dynamic>?)
          ?.map(
            (e) => NotificationClickResponseModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$NotificationResponseModelToJson(
  _NotificationResponseModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'tag': instance.tag,
  'date': instance.date,
  'notificationId': instance.notificationId,
  'clicks': instance.clicks,
};

_NotificationClickResponseModel _$NotificationClickResponseModelFromJson(
  Map<String, dynamic> json,
) => _NotificationClickResponseModel(
  menberId: json['menberId'] as String?,
  vueAt: json['vueAt'] as String?,
);

Map<String, dynamic> _$NotificationClickResponseModelToJson(
  _NotificationClickResponseModel instance,
) => <String, dynamic>{'menberId': instance.menberId, 'vueAt': instance.vueAt};
