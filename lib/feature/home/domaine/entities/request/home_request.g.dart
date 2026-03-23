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

_RequestCellule _$RequestCelluleFromJson(Map<String, dynamic> json) =>
    _RequestCellule(
      responsable: json['responsable'] as String?,
      celluleCode: json['celluleCode'] as String?,
      date: json['date'] as String?,
      nom: json['nom'] as String?,
      description: json['description'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      adresse: json['adresse'] as String?,
      celluleId: json['celluleId'] as String?,
    );

Map<String, dynamic> _$RequestCelluleToJson(_RequestCellule instance) =>
    <String, dynamic>{
      'responsable': instance.responsable,
      'celluleCode': instance.celluleCode,
      'date': instance.date,
      'nom': instance.nom,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'adresse': instance.adresse,
      'celluleId': instance.celluleId,
    };

_RequestReponsableCellule _$RequestReponsableCelluleFromJson(
  Map<String, dynamic> json,
) => _RequestReponsableCellule(
  responsable: json['responsable'] as String?,
  celluleCode: json['celluleCode'] as String?,
  date: json['date'] as String?,
  celluleName: json['celluleName'] as String?,
  contact: json['contact'] as String?,
  email: json['email'] as String?,
  adresse: json['adresse'] as String?,
  celluleId: json['celluleId'] as String?,
);

Map<String, dynamic> _$RequestReponsableCelluleToJson(
  _RequestReponsableCellule instance,
) => <String, dynamic>{
  'responsable': instance.responsable,
  'celluleCode': instance.celluleCode,
  'date': instance.date,
  'celluleName': instance.celluleName,
  'contact': instance.contact,
  'email': instance.email,
  'adresse': instance.adresse,
  'celluleId': instance.celluleId,
};
