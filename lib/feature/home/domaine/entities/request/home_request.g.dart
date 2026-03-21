// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmptyRequest _$EmptyRequestFromJson(Map<String, dynamic> json) =>
    _EmptyRequest();

Map<String, dynamic> _$EmptyRequestToJson(_EmptyRequest instance) =>
    <String, dynamic>{};

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
