// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    _ProfileResponse(
      name: json['name'] as String,
      dateNaissance: json['dateNaissance'] as String,
      zoneResidence: json['zoneResidence'] as String,
      profileImage: json['profileImage'] as String,
      contact: json['contact'] as String,
      email: json['email'] as String,
      nationalite: json['nationalite'] as String,
      dateInscription: json['dateInscription'] as String,
      statusSocial: json['statusSocial'] as String,
      activity: json['activity'] as String,
      nivauEtude: json['nivauEtude'] as String,
      matrimonial: json['matrimonial'] as String,
      orphelin: json['orphelin'] as String,
      statusSpirituel: json['statusSpirituel'] as String,
      dateBaptme: json['dateBaptme'] as String,
      cellulePriere: json['cellulePriere'] as String,
      encadreur: json['encadreur'] as String,
      departement: json['departement'] as String,
      competence: json['competence'] as String,
      disponibiliry: json['disponibiliry'] as String,
      menberId: json['menberId'] as String,
      submitProfile: json['submitProfile'] as bool,
      submitSocial: json['submitSocial'] as bool,
      submitSpiritual: json['submitSpiritual'] as bool,
      submitEngagement: json['submitEngagement'] as bool,
      celluleCode: json['celluleCode'] as String,
      celluleId: json['celluleId'] as String,
      deviceId: json['deviceId'] as String,
    );

Map<String, dynamic> _$ProfileResponseToJson(_ProfileResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dateNaissance': instance.dateNaissance,
      'zoneResidence': instance.zoneResidence,
      'profileImage': instance.profileImage,
      'contact': instance.contact,
      'email': instance.email,
      'nationalite': instance.nationalite,
      'dateInscription': instance.dateInscription,
      'statusSocial': instance.statusSocial,
      'activity': instance.activity,
      'nivauEtude': instance.nivauEtude,
      'matrimonial': instance.matrimonial,
      'orphelin': instance.orphelin,
      'statusSpirituel': instance.statusSpirituel,
      'dateBaptme': instance.dateBaptme,
      'cellulePriere': instance.cellulePriere,
      'encadreur': instance.encadreur,
      'departement': instance.departement,
      'competence': instance.competence,
      'disponibiliry': instance.disponibiliry,
      'menberId': instance.menberId,
      'submitProfile': instance.submitProfile,
      'submitSocial': instance.submitSocial,
      'submitSpiritual': instance.submitSpiritual,
      'submitEngagement': instance.submitEngagement,
      'celluleCode': instance.celluleCode,
      'celluleId': instance.celluleId,
      'deviceId': instance.deviceId,
    };

_NotificationResponse _$NotificationResponseFromJson(
  Map<String, dynamic> json,
) => _NotificationResponse(
  title: json['title'] as String,
  description: json['description'] as String,
  tag: json['tag'] as String,
  date: json['date'] as String,
);

Map<String, dynamic> _$NotificationResponseToJson(
  _NotificationResponse instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'tag': instance.tag,
  'date': instance.date,
};

_CelluleResponse _$CelluleResponseFromJson(Map<String, dynamic> json) =>
    _CelluleResponse(
      responsable: json['responsable'] as String,
      celluleCode: json['celluleCode'] as String,
      date: json['date'] as String,
      nom: json['nom'] as String,
      description: json['description'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      adresse: json['adresse'] as String,
      celluleId: json['celluleId'] as String,
      secteurId: json['secteurId'] as String,
      secteurCode: json['secteurCode'] as String,
    );

Map<String, dynamic> _$CelluleResponseToJson(_CelluleResponse instance) =>
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
      'secteurId': instance.secteurId,
      'secteurCode': instance.secteurCode,
    };

_ReponsableCelluleResponse _$ReponsableCelluleResponseFromJson(
  Map<String, dynamic> json,
) => _ReponsableCelluleResponse(
  responsable: json['responsable'] as String,
  celluleCode: json['celluleCode'] as String,
  date: json['date'] as String,
  celluleName: json['celluleName'] as String,
  contact: json['contact'] as String,
  email: json['email'] as String,
  adresse: json['adresse'] as String,
  celluleId: json['celluleId'] as String,
  secteurId: json['secteurId'] as String,
  secteurCode: json['secteurCode'] as String,
);

Map<String, dynamic> _$ReponsableCelluleResponseToJson(
  _ReponsableCelluleResponse instance,
) => <String, dynamic>{
  'responsable': instance.responsable,
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

_DiscipleCellule _$DiscipleCelluleFromJson(Map<String, dynamic> json) =>
    _DiscipleCellule(
      fullName: json['fullName'] as String,
      isBaptierOrNot: json['isBaptierOrNot'] as String,
    );

Map<String, dynamic> _$DiscipleCelluleToJson(_DiscipleCellule instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'isBaptierOrNot': instance.isBaptierOrNot,
    };

_ReponsableSecteurResponse _$ReponsableSecteurResponseFromJson(
  Map<String, dynamic> json,
) => _ReponsableSecteurResponse(
  secteurResponsableName: json['secteurResponsableName'] as String,
  secteurCode: json['secteurCode'] as String,
  dateCreated: json['dateCreated'] as String,
  secteurName: json['secteurName'] as String,
  contactResponsable: json['contactResponsable'] as String,
  emailResponsable: json['emailResponsable'] as String,
  adresse: json['adresse'] as String,
  secteurId: json['secteurId'] as String,
  zoneId: json['zoneId'] as String,
  zoneCode: json['zoneCode'] as String,
);

Map<String, dynamic> _$ReponsableSecteurResponseToJson(
  _ReponsableSecteurResponse instance,
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

_ReponsableZoneResponse _$ReponsableZoneResponseFromJson(
  Map<String, dynamic> json,
) => _ReponsableZoneResponse(
  zoneResponsableName: json['zoneResponsableName'] as String,
  zoneCode: json['zoneCode'] as String,
  dateCreated: json['dateCreated'] as String,
  zoneName: json['zoneName'] as String,
  contactResponsable: json['contactResponsable'] as String,
  emailResponsable: json['emailResponsable'] as String,
  adresse: json['adresse'] as String,
  zoneId: json['zoneId'] as String,
);

Map<String, dynamic> _$ReponsableZoneResponseToJson(
  _ReponsableZoneResponse instance,
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

_VisiteDisciple _$VisiteDiscipleFromJson(Map<String, dynamic> json) =>
    _VisiteDisciple(
      fullname: json['fullname'] as String,
      isDisciple: json['isDisciple'] as bool,
      probleme: json['probleme'] as String,
      recommandation: json['recommandation'] as String,
    );

Map<String, dynamic> _$VisiteDiscipleToJson(_VisiteDisciple instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'isDisciple': instance.isDisciple,
      'probleme': instance.probleme,
      'recommandation': instance.recommandation,
    };

_RapportSuggestion _$RapportSuggestionFromJson(Map<String, dynamic> json) =>
    _RapportSuggestion(
      temoignage: json['temoignage'] as String,
      suggestions: json['suggestions'] as String,
      probleme: json['probleme'] as String,
    );

Map<String, dynamic> _$RapportSuggestionToJson(_RapportSuggestion instance) =>
    <String, dynamic>{
      'temoignage': instance.temoignage,
      'suggestions': instance.suggestions,
      'probleme': instance.probleme,
    };
