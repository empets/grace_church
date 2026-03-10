import 'package:freezed_annotation/freezed_annotation.dart';
part 'authen_request.freezed.dart';
part 'authen_request.g.dart';

@freezed
abstract class RequestAuthenProfile with _$RequestAuthenProfile {
  factory RequestAuthenProfile({
    required String name,
    required String dateNaissance,
    required String zoneResidence,
    required String profileImage,
    required String contact,
    required String email,
    required String nationalite,
    required String dateInscription,
  }) = _RequestAuthenProfile;

  factory RequestAuthenProfile.fromJson(Map<String, dynamic> json) =>
      _$RequestAuthenProfileFromJson(json);
}

@freezed
abstract class RequestAuthenSocial with _$RequestAuthenSocial {
  factory RequestAuthenSocial({
    required String statusSocial,
    required String activity,
    required String nivauEtude,
    required String matrimonial,
    required String orphelin,
  }) = _RequestAuthenSocial;

  factory RequestAuthenSocial.fromJson(Map<String, dynamic> json) =>
      _$RequestAuthenSocialFromJson(json);
}

@freezed
abstract class RequestAuthenSpiritualLife with _$RequestAuthenSpiritualLife {
  factory RequestAuthenSpiritualLife({
    required String statusSpirituel,
    required String dateBaptme,
    required String cellulePriere,
    required String encadreur,
  }) = _RequestAuthenSpiritualLife;

  factory RequestAuthenSpiritualLife.fromJson(Map<String, dynamic> json) =>
      _$RequestAuthenSpiritualLifeFromJson(json);
}

@freezed
abstract class RequestAuthenEngagement with _$RequestAuthenEngagement {
  factory RequestAuthenEngagement({
    required String departement,
    required String competence,
    required String disponibiliry,
  }) = _RequestAuthenEngagement;

  factory RequestAuthenEngagement.fromJson(Map<String, dynamic> json) =>
      _$RequestAuthenEngagementFromJson(json);
}

@freezed
abstract class RequestAuthenProfileUpdateKey
    with _$RequestAuthenProfileUpdateKey {
  factory RequestAuthenProfileUpdateKey({required String menberId}) =
      _RequestAuthenProfileUpdateKey;

  factory RequestAuthenProfileUpdateKey.fromJson(Map<String, dynamic> json) =>
      _$RequestAuthenProfileUpdateKeyFromJson(json);
}

@freezed
abstract class RequestAuthenProfileUpdateImage
    with _$RequestAuthenProfileUpdateImage {
  factory RequestAuthenProfileUpdateImage({
    required String profileImage,
    required String menberId,
  }) = _RequestAuthenProfileUpdateImage;

  factory RequestAuthenProfileUpdateImage.fromJson(Map<String, dynamic> json) =>
      _$RequestAuthenProfileUpdateImageFromJson(json);
}
