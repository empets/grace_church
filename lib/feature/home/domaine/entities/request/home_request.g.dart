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
  celluleResponsableName: json['celluleResponsableName'] as String?,
  celluleCode: json['celluleCode'] as String?,
  date: json['date'] as String?,
  celluleName: json['celluleName'] as String?,
  contact: json['contact'] as String?,
  email: json['email'] as String?,
  adresse: json['adresse'] as String?,
  celluleId: json['celluleId'] as String?,
  secteurId: json['secteurId'] as String?,
  secteurCode: json['secteurCode'] as String?,
);

Map<String, dynamic> _$RequestReponsableCelluleToJson(
  _RequestReponsableCellule instance,
) => <String, dynamic>{
  'celluleResponsableName': instance.celluleResponsableName,
  'celluleCode': instance.celluleCode,
  'date': instance.date,
  'celluleName': instance.celluleName,
  'contact': instance.contact,
  'email': instance.email,
  'adresse': instance.adresse,
  'celluleId': instance.celluleId,
  'secteurId': instance.secteurId,
  'secteurCode': instance.secteurCode,
};

_RequestReponsableSecteur _$RequestReponsableSecteurFromJson(
  Map<String, dynamic> json,
) => _RequestReponsableSecteur(
  secteurResponsableName: json['secteurResponsableName'] as String?,
  secteurCode: json['secteurCode'] as String?,
  dateCreated: json['dateCreated'] as String?,
  secteurName: json['secteurName'] as String?,
  contactResponsable: json['contactResponsable'] as String?,
  emailResponsable: json['emailResponsable'] as String?,
  adresse: json['adresse'] as String?,
  secteurId: json['secteurId'] as String?,
  zoneId: json['zoneId'] as String?,
  zoneCode: json['zoneCode'] as String?,
);

Map<String, dynamic> _$RequestReponsableSecteurToJson(
  _RequestReponsableSecteur instance,
) => <String, dynamic>{
  'secteurResponsableName': instance.secteurResponsableName,
  'secteurCode': instance.secteurCode,
  'dateCreated': instance.dateCreated,
  'secteurName': instance.secteurName,
  'contactResponsable': instance.contactResponsable,
  'emailResponsable': instance.emailResponsable,
  'adresse': instance.adresse,
  'secteurId': instance.secteurId,
  'zoneId': instance.zoneId,
  'zoneCode': instance.zoneCode,
};

_RequestReponsableZone _$RequestReponsableZoneFromJson(
  Map<String, dynamic> json,
) => _RequestReponsableZone(
  zoneResponsableName: json['zoneResponsableName'] as String?,
  zoneCode: json['zoneCode'] as String?,
  dateCreated: json['dateCreated'] as String?,
  zoneName: json['zoneName'] as String?,
  contactResponsable: json['contactResponsable'] as String?,
  emailResponsable: json['emailResponsable'] as String?,
  adresse: json['adresse'] as String?,
  zoneId: json['zoneId'] as String?,
);

Map<String, dynamic> _$RequestReponsableZoneToJson(
  _RequestReponsableZone instance,
) => <String, dynamic>{
  'zoneResponsableName': instance.zoneResponsableName,
  'zoneCode': instance.zoneCode,
  'dateCreated': instance.dateCreated,
  'zoneName': instance.zoneName,
  'contactResponsable': instance.contactResponsable,
  'emailResponsable': instance.emailResponsable,
  'adresse': instance.adresse,
  'zoneId': instance.zoneId,
};

_RequestAuthenProfileUpdateZone _$RequestAuthenProfileUpdateZoneFromJson(
  Map<String, dynamic> json,
) => _RequestAuthenProfileUpdateZone(secteurId: json['secteurId'] as String);

Map<String, dynamic> _$RequestAuthenProfileUpdateZoneToJson(
  _RequestAuthenProfileUpdateZone instance,
) => <String, dynamic>{'secteurId': instance.secteurId};

_RequestRapportCellule _$RequestRapportCelluleFromJson(
  Map<String, dynamic> json,
) => _RequestRapportCellule(
  codeZone: json['codeZone'] as String,
  fullNameRespoZone: json['fullNameRespoZone'] as String,
  contactRespoZone: json['contactRespoZone'] as String,
  codeSecteur: json['codeSecteur'] as String,
  fullNameRespoSecteur: json['fullNameRespoSecteur'] as String,
  contactRespoSecteur: json['contactRespoSecteur'] as String,
  codeCellule: json['codeCellule'] as String,
  fullNameRespoCellule: json['fullNameRespoCellule'] as String,
  contactRespoCellule: json['contactRespoCellule'] as String,
  jourCellule: json['jourCellule'] as String,
  offrande: json['offrande'] as String,
  nombreBaptiser: json['nombreBaptiser'] as String,
  nombreNonBaptiser: json['nombreNonBaptiser'] as String,
);

Map<String, dynamic> _$RequestRapportCelluleToJson(
  _RequestRapportCellule instance,
) => <String, dynamic>{
  'codeZone': instance.codeZone,
  'fullNameRespoZone': instance.fullNameRespoZone,
  'contactRespoZone': instance.contactRespoZone,
  'codeSecteur': instance.codeSecteur,
  'fullNameRespoSecteur': instance.fullNameRespoSecteur,
  'contactRespoSecteur': instance.contactRespoSecteur,
  'codeCellule': instance.codeCellule,
  'fullNameRespoCellule': instance.fullNameRespoCellule,
  'contactRespoCellule': instance.contactRespoCellule,
  'jourCellule': instance.jourCellule,
  'offrande': instance.offrande,
  'nombreBaptiser': instance.nombreBaptiser,
  'nombreNonBaptiser': instance.nombreNonBaptiser,
};
