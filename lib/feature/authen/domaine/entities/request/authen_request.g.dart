// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authen_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RequestAuthenProfile _$RequestAuthenProfileFromJson(
  Map<String, dynamic> json,
) => _RequestAuthenProfile(
  name: json['name'] as String,
  dateNaissance: json['dateNaissance'] as String,
  zoneResidence: json['zoneResidence'] as String,
  profileImage: json['profileImage'] as String,
  contact: json['contact'] as String,
  email: json['email'] as String,
  nationalite: json['nationalite'] as String,
  dateInscription: json['dateInscription'] as String,
);

Map<String, dynamic> _$RequestAuthenProfileToJson(
  _RequestAuthenProfile instance,
) => <String, dynamic>{
  'name': instance.name,
  'dateNaissance': instance.dateNaissance,
  'zoneResidence': instance.zoneResidence,
  'profileImage': instance.profileImage,
  'contact': instance.contact,
  'email': instance.email,
  'nationalite': instance.nationalite,
  'dateInscription': instance.dateInscription,
};

_RequestAuthenSocial _$RequestAuthenSocialFromJson(Map<String, dynamic> json) =>
    _RequestAuthenSocial(
      statusSocial: json['statusSocial'] as String,
      activity: json['activity'] as String,
      nivauEtude: json['nivauEtude'] as String,
      matrimonial: json['matrimonial'] as String,
      orphelin: json['orphelin'] as String,
    );

Map<String, dynamic> _$RequestAuthenSocialToJson(
  _RequestAuthenSocial instance,
) => <String, dynamic>{
  'statusSocial': instance.statusSocial,
  'activity': instance.activity,
  'nivauEtude': instance.nivauEtude,
  'matrimonial': instance.matrimonial,
  'orphelin': instance.orphelin,
};

_RequestAuthenSpiritualLife _$RequestAuthenSpiritualLifeFromJson(
  Map<String, dynamic> json,
) => _RequestAuthenSpiritualLife(
  statusSpirituel: json['statusSpirituel'] as String,
  dateBaptme: json['dateBaptme'] as String,
  cellulePriere: json['cellulePriere'] as String,
  encadreur: json['encadreur'] as String,
);

Map<String, dynamic> _$RequestAuthenSpiritualLifeToJson(
  _RequestAuthenSpiritualLife instance,
) => <String, dynamic>{
  'statusSpirituel': instance.statusSpirituel,
  'dateBaptme': instance.dateBaptme,
  'cellulePriere': instance.cellulePriere,
  'encadreur': instance.encadreur,
};

_RequestAuthenEngagement _$RequestAuthenEngagementFromJson(
  Map<String, dynamic> json,
) => _RequestAuthenEngagement(
  departement: json['departement'] as String,
  competence: json['competence'] as String,
  disponibiliry: json['disponibiliry'] as String,
);

Map<String, dynamic> _$RequestAuthenEngagementToJson(
  _RequestAuthenEngagement instance,
) => <String, dynamic>{
  'departement': instance.departement,
  'competence': instance.competence,
  'disponibiliry': instance.disponibiliry,
};

_RequestAuthenProfileUpdateKey _$RequestAuthenProfileUpdateKeyFromJson(
  Map<String, dynamic> json,
) => _RequestAuthenProfileUpdateKey(menberId: json['menberId'] as String);

Map<String, dynamic> _$RequestAuthenProfileUpdateKeyToJson(
  _RequestAuthenProfileUpdateKey instance,
) => <String, dynamic>{'menberId': instance.menberId};

_RequestAuthenProfileUpdateImage _$RequestAuthenProfileUpdateImageFromJson(
  Map<String, dynamic> json,
) => _RequestAuthenProfileUpdateImage(
  profileImage: json['profileImage'] as String,
  menberId: json['menberId'] as String,
);

Map<String, dynamic> _$RequestAuthenProfileUpdateImageToJson(
  _RequestAuthenProfileUpdateImage instance,
) => <String, dynamic>{
  'profileImage': instance.profileImage,
  'menberId': instance.menberId,
};
