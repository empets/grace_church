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
    required String deviceId,
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
    required String celluleId,
    required String celluleCode,
    required String nom,
    required String date,
    required String description,
    required String adresse,
    required double latitude,
    required double longitude,
    required String responsableCelluleId,
    required String responsableCellule,
    required String contactResponsableCellule,
    required String emailResponsableCellule,
    required String adresseResponsableCellule,
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
  factory DiscipleCellule({required String fullName, required String isBaptierOrNot}) =
      _DiscipleCellule;
  factory DiscipleCellule.fromJson(Map<String, dynamic> json) =>
      _$DiscipleCelluleFromJson(json);
}






@freezed
abstract class ReponsableSecteurResponse with _$ReponsableSecteurResponse {
  factory ReponsableSecteurResponse({
    required String secteurId,
    required String secteurCode,
    required String secteurName,
    required String dateCreated,
    required String secteurResponsableName,
    required String contactResponsable,
    required String emailResponsableSecteur,
    required String adressResponsableSecteur,
    required String responsableSecteurId,
    required String adresse,
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


@freezed
abstract class VisiteDisciple with _$VisiteDisciple{
  factory VisiteDisciple({
    required String fullname,
    required bool isDisciple,
    required String probleme,
    required String recommandation,
  }) = _VisiteDisciple;
  factory VisiteDisciple.fromJson(Map<String, dynamic> json) =>
      _$VisiteDiscipleFromJson(json); 
}

@freezed
abstract class RapportSuggestion with _$RapportSuggestion{
  factory RapportSuggestion({
    required String temoignage,
    required String suggestions,
    required String probleme,
  }) = _RapportSuggestion;
  factory RapportSuggestion.fromJson(Map<String, dynamic> json) =>
      _$RapportSuggestionFromJson(json); 
}