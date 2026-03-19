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
    );
  }
}
