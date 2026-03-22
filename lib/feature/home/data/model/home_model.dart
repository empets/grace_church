import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grace_church/core/extension/extention.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
part 'home_model.freezed.dart';
part 'home_model.g.dart';

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
    );
  }
}



@freezed
abstract class NotificationResponseModel with _$NotificationResponseModel {
  factory NotificationResponseModel({
    required String? title,
    required String?  description,
    required String?  tag,
    required String?  date,
  }) = _NotificationResponseModel;
  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseModelFromJson(json);

  static   NotificationResponse toDomaine(NotificationResponseModel model) {
    return NotificationResponse(
      title: model.title.getOrEmpty(),
      description: model.description.getOrEmpty(),
      tag: model.tag.getOrEmpty(),
      date: model.date.getOrEmpty(),
    );
  }
}



@freezed
abstract class CelluleResponseModel with _$CelluleResponseModel {
  factory CelluleResponseModel({
    required String? responsable,
    required String? celluleCode,
    required String? date,
    required String? nom,
    required String? description,
    required double? latitude,
    required double? longitude,
    required String? adresse,
    required String? celluleId,

  }) = _CelluleResponseModel;
  factory CelluleResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CelluleResponseModelFromJson(json);

      static CelluleResponse domaine(CelluleResponseModel model){
        return CelluleResponse(
          adresse: model.adresse.getOrEmpty(),    
          latitude: model.latitude.getOrEmpty(),
          longitude: model.longitude.getOrEmpty(),
          responsable: model.responsable.getOrEmpty(),
          celluleCode: model.celluleCode.getOrEmpty(),
          date: model.date.getOrEmpty(),
          nom: model.nom.getOrEmpty(),
          description: model.description.getOrEmpty(),
          celluleId: model.celluleId.getOrEmpty(),
        );
      }
}