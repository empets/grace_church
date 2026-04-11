// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileResponseModel _$ProfileResponseModelFromJson(
  Map<String, dynamic> json,
) => _ProfileResponseModel(
  name: json['name'] as String?,
  dateNaissance: json['dateNaissance'] as String?,
  zoneResidence: json['zoneResidence'] as String?,
  profileImage: json['profileImage'] as String?,
  contact: json['contact'] as String?,
  email: json['email'] as String?,
  nationalite: json['nationalite'] as String?,
  dateInscription: json['dateInscription'] as String?,
  statusSocial: json['statusSocial'] as String?,
  activity: json['activity'] as String?,
  nivauEtude: json['nivauEtude'] as String?,
  matrimonial: json['matrimonial'] as String?,
  orphelin: json['orphelin'] as String?,
  statusSpirituel: json['statusSpirituel'] as String?,
  dateBaptme: json['dateBaptme'] as String?,
  cellulePriere: json['cellulePriere'] as String?,
  encadreur: json['encadreur'] as String?,
  departement: json['departement'] as String?,
  competence: json['competence'] as String?,
  disponibiliry: json['disponibiliry'] as String?,
  menberId: json['menberId'] as String?,
  submitProfile: json['submitProfile'] as bool? ?? false,
  submitSocial: json['submitSocial'] as bool? ?? false,
  submitSpiritual: json['submitSpiritual'] as bool? ?? false,
  submitEngagement: json['submitEngagement'] as bool? ?? false,
  celluleCode: json['celluleCode'] as String?,
  celluleId: json['celluleId'] as String?,
);

Map<String, dynamic> _$ProfileResponseModelToJson(
  _ProfileResponseModel instance,
) => <String, dynamic>{
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
};

_NotificationResponseModel _$NotificationResponseModelFromJson(
  Map<String, dynamic> json,
) => _NotificationResponseModel(
  title: json['title'] as String?,
  description: json['description'] as String?,
  tag: json['tag'] as String?,
  date: json['date'] as String?,
);

Map<String, dynamic> _$NotificationResponseModelToJson(
  _NotificationResponseModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'tag': instance.tag,
  'date': instance.date,
};

_CelluleResponseModel _$CelluleResponseModelFromJson(
  Map<String, dynamic> json,
) => _CelluleResponseModel(
  responsable: json['responsable'] as String?,
  celluleCode: json['celluleCode'] as String?,
  date: json['date'] as String?,
  nom: json['nom'] as String?,
  description: json['description'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  adresse: json['adresse'] as String?,
  celluleId: json['celluleId'] as String?,
  secteurId: json['secteurId'] as String?,
  secteurCode: json['secteurCode'] as String?,
);

Map<String, dynamic> _$CelluleResponseModelToJson(
  _CelluleResponseModel instance,
) => <String, dynamic>{
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

_ReponsableCelluleResponseModel _$ReponsableCelluleResponseModelFromJson(
  Map<String, dynamic> json,
) => _ReponsableCelluleResponseModel(
  responsable: json['responsable'] as String?,
  celluleCode: json['celluleCode'] as String?,
  date: json['date'] as String?,
  nom: json['nom'] as String?,
  prenom: json['prenom'] as String?,
  contact: json['contact'] as String?,
  email: json['email'] as String?,
  adresse: json['adresse'] as String?,
  celluleId: json['celluleId'] as String?,
  celluleName: json['celluleName'] as String?,
  secteurId: json['secteurId'] as String?,
  secteurCode: json['secteurCode'] as String?,
);

Map<String, dynamic> _$ReponsableCelluleResponseModelToJson(
  _ReponsableCelluleResponseModel instance,
) => <String, dynamic>{
  'responsable': instance.responsable,
  'celluleCode': instance.celluleCode,
  'date': instance.date,
  'nom': instance.nom,
  'prenom': instance.prenom,
  'contact': instance.contact,
  'email': instance.email,
  'adresse': instance.adresse,
  'celluleId': instance.celluleId,
  'celluleName': instance.celluleName,
  'secteurId': instance.secteurId,
  'secteurCode': instance.secteurCode,
};

_ReponsableResponseSecteurModel _$ReponsableResponseSecteurModelFromJson(
  Map<String, dynamic> json,
) => _ReponsableResponseSecteurModel(
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

Map<String, dynamic> _$ReponsableResponseSecteurModelToJson(
  _ReponsableResponseSecteurModel instance,
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

_ReponsableZoneResponseModel _$ReponsableZoneResponseModelFromJson(
  Map<String, dynamic> json,
) => _ReponsableZoneResponseModel(
  zoneResponsableName: json['zoneResponsableName'] as String?,
  zoneCode: json['zoneCode'] as String?,
  dateCreated: json['dateCreated'] as String?,
  zoneName: json['zoneName'] as String?,
  contactResponsable: json['contactResponsable'] as String?,
  emailResponsable: json['emailResponsable'] as String?,
  adresse: json['adresse'] as String?,
  zoneId: json['zoneId'] as String?,
);

Map<String, dynamic> _$ReponsableZoneResponseModelToJson(
  _ReponsableZoneResponseModel instance,
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
