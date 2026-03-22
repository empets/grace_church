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
    };
