import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_response.freezed.dart';
part 'home_response.g.dart';

@freezed
abstract class ProfileResponse with _$ProfileResponse {
  factory ProfileResponse({
    required String name,
    required String dateNaissance,
    required String zoneResidence,
    required String profileImage,
    required String contact,
    required String email,
    required String nationalite,
    required String dateInscription,
    required String statusSocial,
    required String activity,
    required String nivauEtude,
    required String matrimonial,
    required String orphelin,
    required String statusSpirituel,
    required String dateBaptme,
    required String cellulePriere,
    required String encadreur,
    required String departement,
    required String competence,
    required String disponibiliry,
    required String menberId,
    required bool submitProfile,
    required bool submitSocial,
    required bool submitSpiritual,
    required bool submitEngagement,
    required String celluleCode,
    required String celluleId,
  }) = _ProfileResponse;
  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}

@freezed
abstract class NotificationResponse with _$NotificationResponse {
  factory NotificationResponse({
    required String title,
    required String description,
    required String tag,
    required String date,
  }) = _NotificationResponse;
  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);
}

@freezed
abstract class CelluleResponse with _$CelluleResponse {
  factory CelluleResponse({
    required String responsable,
    required String celluleCode,
    required String date,
    required String nom,
    required String description,
    required double latitude,
    required double longitude,
    required String adresse,
    required String celluleId,
    required String secteurId,
    required String secteurCode,
  }) = _CelluleResponse;
  factory CelluleResponse.fromJson(Map<String, dynamic> json) =>
      _$CelluleResponseFromJson(json);
}

@freezed
abstract class ReponsableCelluleResponse with _$ReponsableCelluleResponse {
  factory ReponsableCelluleResponse({
    required String responsable,
    required String celluleCode,
    required String date,
    required String celluleName,
    required String contact,
    required String email,
    required String adresse,
    required String celluleId,
    required String secteurId,
    required String secteurCode,
  }) = _ReponsableCelluleResponse;
  factory ReponsableCelluleResponse.fromJson(Map<String, dynamic> json) =>
      _$ReponsableCelluleResponseFromJson(json);
}

@freezed
abstract class DiscipleCellule with _$DiscipleCellule {
  factory DiscipleCellule({required String fullName, required String contact}) =
      _DiscipleCellule;
  factory DiscipleCellule.fromJson(Map<String, dynamic> json) =>
      _$DiscipleCelluleFromJson(json);
}

@freezed
abstract class ReponsableSecteurResponse with _$ReponsableSecteurResponse {
  factory ReponsableSecteurResponse({
    required String secteurResponsableName,
    required String secteurCode,
    required String dateCreated,
    required String secteurName,
    required String contactResponsable,
    required String emailResponsable,
    required String adresse,
    required String secteurId,
    required String zoneId,
    required String zoneCode,
  }) = _ReponsableSecteurResponse;
  factory ReponsableSecteurResponse.fromJson(Map<String, dynamic> json) =>
      _$ReponsableSecteurResponseFromJson(json);
}

@freezed
abstract class ReponsableZoneResponse with _$ReponsableZoneResponse {
  factory ReponsableZoneResponse({
    required String zoneResponsableName,
    required String zoneCode,
    required String dateCreated,
    required String zoneName,
    required String contactResponsable,
    required String emailResponsable,
    required String adresse,
    required String zoneId,
  }) = _ReponsableZoneResponse;
  factory ReponsableZoneResponse.fromJson(Map<String, dynamic> json) =>
      _$ReponsableZoneResponseFromJson(json);
}
