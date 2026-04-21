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

_RequestRapportCelluleAdministration
_$RequestRapportCelluleAdministrationFromJson(Map<String, dynamic> json) =>
    _RequestRapportCelluleAdministration(
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
      discipleCellule: (json['discipleCellule'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      id: json['id'] as String,
      formAdministrationIsSubmit: json['formAdministrationIsSubmit'] as String,
      formAdministrationSubmitDate:
          json['formAdministrationSubmitDate'] as String,
    );

Map<String, dynamic> _$RequestRapportCelluleAdministrationToJson(
  _RequestRapportCelluleAdministration instance,
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
  'discipleCellule': instance.discipleCellule,
  'id': instance.id,
  'formAdministrationIsSubmit': instance.formAdministrationIsSubmit,
  'formAdministrationSubmitDate': instance.formAdministrationSubmitDate,
};

_RequestGeneriqueKey<T> _$RequestGeneriqueKeyFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _RequestGeneriqueKey<T>(id: fromJsonT(json['id']));

Map<String, dynamic> _$RequestGeneriqueKeyToJson<T>(
  _RequestGeneriqueKey<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{'id': toJsonT(instance.id)};

_RequestImpliciteConnexion _$RequestImpliciteConnexionFromJson(
  Map<String, dynamic> json,
) => _RequestImpliciteConnexion(deviceId: json['deviceId'] as String);

Map<String, dynamic> _$RequestImpliciteConnexionToJson(
  _RequestImpliciteConnexion instance,
) => <String, dynamic>{'deviceId': instance.deviceId};

_RequestItemSection _$RequestItemSectionFromJson(Map<String, dynamic> json) =>
    _RequestItemSection(
      name: json['name'] as String,
      count: (json['count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$RequestItemSectionToJson(_RequestItemSection instance) =>
    <String, dynamic>{'name': instance.name, 'count': instance.count};

_RequestSection _$RequestSectionFromJson(Map<String, dynamic> json) =>
    _RequestSection(
      title: json['title'] as String,
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => RequestItemSection.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RequestSectionToJson(_RequestSection instance) =>
    <String, dynamic>{'title': instance.title, 'items': instance.items};

_RequestHumaneSectionAssistance _$RequestHumaneSectionAssistanceFromJson(
  Map<String, dynamic> json,
) => _RequestHumaneSectionAssistance(
  title: json['title'] as String? ?? "",
  name: json['name'] as String? ?? "",
  cout: (json['cout'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$RequestHumaneSectionAssistanceToJson(
  _RequestHumaneSectionAssistance instance,
) => <String, dynamic>{
  'title': instance.title,
  'name': instance.name,
  'cout': instance.cout,
};

_RequestRapportCelluleAssistance _$RequestRapportCelluleAssistanceFromJson(
  Map<String, dynamic> json,
) => _RequestRapportCelluleAssistance(
  nombreBaptiser: json['nombreBaptiser'] as String,
  nomBaptiserStat: (json['nomBaptiserStat'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  nouveauBaptiserStat: (json['nouveauBaptiserStat'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  inviterStat: (json['inviterStat'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  formationStat: (json['formationStat'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  sectionVisite: (json['sectionVisite'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  sectionActivite: (json['sectionActivite'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  sectionOuvrier: (json['sectionOuvrier'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  autres: (json['autres'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  id: json['id'] as String,
  formAssistanceIsSubmit: json['formAssistanceIsSubmit'] as String,
  formAssistanceSubmitDate: json['formAssistanceSubmitDate'] as String,
);

Map<String, dynamic> _$RequestRapportCelluleAssistanceToJson(
  _RequestRapportCelluleAssistance instance,
) => <String, dynamic>{
  'nombreBaptiser': instance.nombreBaptiser,
  'nomBaptiserStat': instance.nomBaptiserStat,
  'nouveauBaptiserStat': instance.nouveauBaptiserStat,
  'inviterStat': instance.inviterStat,
  'formationStat': instance.formationStat,
  'sectionVisite': instance.sectionVisite,
  'sectionActivite': instance.sectionActivite,
  'sectionOuvrier': instance.sectionOuvrier,
  'autres': instance.autres,
  'id': instance.id,
  'formAssistanceIsSubmit': instance.formAssistanceIsSubmit,
  'formAssistanceSubmitDate': instance.formAssistanceSubmitDate,
};

_RequestRapportCelluleActivity _$RequestRapportCelluleActivityFromJson(
  Map<String, dynamic> json,
) => _RequestRapportCelluleActivity(
  visiteMenbre: (json['visiteMenbre'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  visiteOuvrier: (json['visiteOuvrier'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  dateActivitySubmited: (json['dateActivitySubmited'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  formActivityIsSubmit: json['formActivityIsSubmit'] as String,
  formActivitySubmitDate: json['formActivitySubmitDate'] as String,
);

Map<String, dynamic> _$RequestRapportCelluleActivityToJson(
  _RequestRapportCelluleActivity instance,
) => <String, dynamic>{
  'visiteMenbre': instance.visiteMenbre,
  'visiteOuvrier': instance.visiteOuvrier,
  'dateActivitySubmited': instance.dateActivitySubmited,
  'formActivityIsSubmit': instance.formActivityIsSubmit,
  'formActivitySubmitDate': instance.formActivitySubmitDate,
};
