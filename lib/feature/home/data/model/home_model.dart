import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grace_church/core/extension/extention.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
part 'home_model.freezed.dart';
part 'home_model.g.dart';

//-----------------------------
//  PROFILE RESPONSE MODEL
//------------------------------
@freezed
abstract class ProfileResponseModel with _$ProfileResponseModel {
  factory ProfileResponseModel({
    required String? name,
    required String? dateNaissance,
    required String? zoneResidence,
    required String? profileImage,
    required String? contact,
    required String? email,
    required String? nationalite,
    required String? dateInscription,
    required String? statusSocial,
    required String? activity,
    required String? nivauEtude,
    required String? matrimonial,
    required String? orphelin,
    required String? statusSpirituel,
    required String? dateBaptme,
    required String? cellulePriere,
    required String? encadreur,
    required String? departement,
    required String? competence,
    required String? disponibiliry,
    required String? menberId,
    @Default(false) bool? submitProfile,
    @Default(false) bool? submitSocial,
    @Default(false) bool? submitSpiritual,
    @Default(false) bool? submitEngagement,
    required String? celluleCode,
    required String? celluleId,
    @Default('') String? deviceId,
  }) = _ProfileResponseModel;
  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);

  static ProfileResponse domaine(ProfileResponseModel model) {
    return ProfileResponse(
      name: model.name.getOrEmpty(),
      dateNaissance: model.dateNaissance.getOrEmpty(),
      zoneResidence: model.zoneResidence.getOrEmpty(),
      profileImage: model.profileImage.getOrEmpty(),
      contact: model.contact.getOrEmpty(),
      email: model.email.getOrEmpty(),
      nationalite: model.nationalite.getOrEmpty(),
      dateInscription: model.dateInscription.getOrEmpty(),
      statusSocial: model.statusSocial.getOrEmpty(),
      activity: model.activity.getOrEmpty(),
      nivauEtude: model.nivauEtude.getOrEmpty(),
      matrimonial: model.matrimonial.getOrEmpty(),
      orphelin: model.orphelin.getOrEmpty(),
      statusSpirituel: model.statusSpirituel.getOrEmpty(),
      dateBaptme: model.dateBaptme.getOrEmpty(),
      cellulePriere: model.cellulePriere.getOrEmpty(),
      encadreur: model.encadreur.getOrEmpty(),
      departement: model.departement.getOrEmpty(),
      competence: model.competence.getOrEmpty(),
      disponibiliry: model.disponibiliry.getOrEmpty(),
      menberId: model.menberId.getOrEmpty(),
      submitProfile: model.submitProfile.getOrEmpty(),
      submitSocial: model.submitSocial.getOrEmpty(),
      submitSpiritual: model.submitSpiritual.getOrEmpty(),
      submitEngagement: model.submitEngagement.getOrEmpty(),
      celluleCode: model.celluleCode.getOrEmpty(),
      celluleId: model.celluleId.getOrEmpty(),
      deviceId: model.deviceId.getOrEmpty(),
    );
  }
}

//-----------------------------
//  NOTIFICATION RESPONSE MODEL
//------------------------------
@freezed
abstract class NotificationResponseModel with _$NotificationResponseModel {
  factory NotificationResponseModel({
    required String? title,
    required String? description,
    required String? tag,
    required String? date,
  }) = _NotificationResponseModel;
  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseModelFromJson(json);

  static NotificationResponse toDomaine(NotificationResponseModel model) {
    return NotificationResponse(
      title: model.title.getOrEmpty(),
      description: model.description.getOrEmpty(),
      tag: model.tag.getOrEmpty(),
      date: model.date.getOrEmpty(),
    );
  }
}

//-----------------------------
//  CELLULE RESPONSE MODEL 
//------------------------------
@freezed
abstract class CelluleResponseModel with _$CelluleResponseModel {
  factory CelluleResponseModel({
    required String? celluleId,
    required String? celluleCode,
    required String? nom,
    required String? date,
    required String? description,
    required String? adresse,
    required double? latitude,
    required double? longitude,
    required String? responsableCelluleId,
    required String? responsableCellule,
    required String? contactResponsableCellule,
    required String? emailResponsableCellule,
    required String? adresseResponsableCellule,
    required String? secteurId,
    required String? secteurCode,
  }) = _CelluleResponseModel;
  factory CelluleResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CelluleResponseModelFromJson(json);

  static CelluleResponse domaine(CelluleResponseModel model) {
    return CelluleResponse(
    celluleId: model.celluleId.getOrEmpty(),
    celluleCode: model.celluleCode.getOrEmpty(),
    nom: model.nom.getOrEmpty(),
    date: model.date.getOrEmpty(),
    description: model.description.getOrEmpty(),
    adresse: model.adresse.getOrEmpty(),
    latitude:model.latitude.getOrEmpty(),
    longitude:model.longitude.getOrEmpty(),
    responsableCelluleId:model.responsableCelluleId.getOrEmpty(),
    responsableCellule:model.responsableCellule.getOrEmpty(),
    contactResponsableCellule:model.contactResponsableCellule.getOrEmpty(),
    emailResponsableCellule:model.emailResponsableCellule.getOrEmpty(),
    adresseResponsableCellule:model.adresseResponsableCellule.getOrEmpty(),
    secteurId:model.secteurId.getOrEmpty(),
    secteurCode:model.secteurCode.getOrEmpty(), 
   
    );
  }
}

@freezed
abstract class ReponsableCelluleResponseModel
    with _$ReponsableCelluleResponseModel {
  factory ReponsableCelluleResponseModel({
    required String? responsable,
    required String? celluleCode,
    required String? date,
    required String? nom,
    required String? prenom,
    required String? contact,
    required String? email,
    required String? adresse,
    required String? celluleId,
    required String? celluleName,
    required String? secteurId,
    required String? secteurCode,
    required String? responsableCelluleId
  }) = _ReponsableCelluleResponseModel;
  factory ReponsableCelluleResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ReponsableCelluleResponseModelFromJson(json);

  static ReponsableCelluleResponse domaine(
    ReponsableCelluleResponseModel model,
  ) {
    return ReponsableCelluleResponse(
      responsable: model.responsable.getOrEmpty(),
      celluleCode: model.celluleCode.getOrEmpty(),
      date: model.date.getOrEmpty(),
      celluleName: model.celluleName.getOrEmpty(),
      contact: model.contact.getOrEmpty(),
      email: model.email.getOrEmpty(),
      adresse: model.adresse.getOrEmpty(),
      celluleId: model.celluleId.getOrEmpty(),
      secteurId: model.secteurId.getOrEmpty(),
      secteurCode: model.secteurCode.getOrEmpty(),
      responsableCelluleId: model.responsableCelluleId.getOrEmpty(),
    );
  }
}



//-----------------------------
//  SECTEUR RESPONSE MODEL 
//------------------------------
@freezed
abstract class ReponsableResponseSecteurModel with _$ReponsableResponseSecteurModel {
  factory ReponsableResponseSecteurModel({
    required String? secteurId,
    required String? secteurCode,
    required String? secteurName,
    required String? dateCreated,
    required String? secteurResponsableName,
    required String? contactResponsable,
    required String? emailResponsableSecteur,
    required String? adressResponsableSecteur,
    required String? responsableSecteurId,
    required String? adresse,
    required String? zoneId,
    required String? zoneCode,
  }) = _ReponsableResponseSecteurModel;
  factory ReponsableResponseSecteurModel.fromJson(Map<String, dynamic> json) =>
      _$ReponsableResponseSecteurModelFromJson(json);

  static ReponsableSecteurResponse toDomain(ReponsableResponseSecteurModel model) {
    return ReponsableSecteurResponse(
    secteurId:model.secteurId.getOrEmpty(),
    secteurCode:model.secteurCode.getOrEmpty(),
    secteurName:model.secteurName.getOrEmpty(),
    dateCreated:model.dateCreated.getOrEmpty(),
    secteurResponsableName:model.secteurResponsableName.getOrEmpty(),
    contactResponsable:model.contactResponsable.getOrEmpty(),
    emailResponsableSecteur:model.emailResponsableSecteur.getOrEmpty(),
    adressResponsableSecteur:model.adressResponsableSecteur.getOrEmpty(),
    responsableSecteurId:model.responsableSecteurId.getOrEmpty(),
    adresse:model.adresse.getOrEmpty(),
    zoneId:model.zoneId.getOrEmpty(),
    zoneCode:model.zoneCode.getOrEmpty(),
  
    );
  }
}

@freezed
abstract class ReponsableZoneResponseModel with _$ReponsableZoneResponseModel {
  factory ReponsableZoneResponseModel({
    required String? zoneResponsableName,
    required String? zoneCode,
    required String? dateCreated,
    required String? zoneName,
    required String? contactResponsable,
    required String? emailResponsable,
    required String? adresse,
    required String? zoneId,
  }) = _ReponsableZoneResponseModel;
  factory ReponsableZoneResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ReponsableZoneResponseModelFromJson(json);

  static ReponsableZoneResponse toDomain(ReponsableZoneResponseModel model) {
    return ReponsableZoneResponse(
      zoneResponsableName: model.zoneResponsableName.getOrEmpty(),
      zoneCode: model.zoneCode.getOrEmpty(),
      dateCreated: model.dateCreated.getOrEmpty(),
      zoneName: model.zoneName.getOrEmpty(),
      contactResponsable: model.contactResponsable.getOrEmpty(),
      emailResponsable: model.emailResponsable.getOrEmpty(),
      adresse: model.adresse.getOrEmpty(),
      zoneId: model.zoneId.getOrEmpty(),
    );
  }
}
