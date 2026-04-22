import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';

part 'home_request.freezed.dart';
part 'home_request.g.dart';

@freezed
abstract class EmptyRequest with _$EmptyRequest {
  factory EmptyRequest() = _EmptyRequest;
  factory EmptyRequest.fromJson(Map<String, dynamic> json) =>
      _$EmptyRequestFromJson(json);
}

@freezed
abstract class RequestNotification with _$RequestNotification {
  factory RequestNotification({
    required String title,
    required String tag,
    required String date,
    required String description,
  }) = _RequestNotification;
  factory RequestNotification.fromJson(Map<String, dynamic> json) =>
      _$RequestNotificationFromJson(json);
}

@freezed
abstract class RequestCellule with _$RequestCellule {
  factory RequestCellule({
    String? responsable,
    String? celluleCode,
    String? date,
    String? nom,
    String? description,
    double? latitude,
    double? longitude,
    String? adresse,
    String? celluleId,
  }) = _RequestCellule;
  factory RequestCellule.fromJson(Map<String, dynamic> json) =>
      _$RequestCelluleFromJson(json);
}

@freezed
abstract class RequestReponsableCellule with _$RequestReponsableCellule {
  factory RequestReponsableCellule({
    String? celluleResponsableName,
    String? celluleCode,
    String? date,
    String? celluleName,
    String? contact,
    String? email,
    String? adresse,
    String? celluleId,
    String? secteurId,
    String? secteurCode,
  }) = _RequestReponsableCellule;
  factory RequestReponsableCellule.fromJson(Map<String, dynamic> json) =>
      _$RequestReponsableCelluleFromJson(json);
}

@freezed
abstract class RequestReponsableSecteur with _$RequestReponsableSecteur {
  factory RequestReponsableSecteur({
    String? secteurResponsableName,
    String? secteurCode,
    String? dateCreated,
    String? secteurName,
    String? contactResponsable,
    String? emailResponsable,
    String? adresse,
    String? secteurId,
    String? zoneId,
    String? zoneCode,
  }) = _RequestReponsableSecteur;
  factory RequestReponsableSecteur.fromJson(Map<String, dynamic> json) =>
      _$RequestReponsableSecteurFromJson(json);
}

@freezed
abstract class RequestReponsableZone with _$RequestReponsableZone {
  factory RequestReponsableZone({
    String? zoneResponsableName,
    String? zoneCode,
    String? dateCreated,
    String? zoneName,
    String? contactResponsable,
    String? emailResponsable,
    String? adresse,
    String? zoneId,
  }) = _RequestReponsableZone;
  factory RequestReponsableZone.fromJson(Map<String, dynamic> json) =>
      _$RequestReponsableZoneFromJson(json);
}

@freezed
abstract class RequestAuthenProfileUpdateZone
    with _$RequestAuthenProfileUpdateZone {
  factory RequestAuthenProfileUpdateZone({required String secteurId}) =
      // secteurId
      _RequestAuthenProfileUpdateZone;

  factory RequestAuthenProfileUpdateZone.fromJson(Map<String, dynamic> json) =>
      _$RequestAuthenProfileUpdateZoneFromJson(json);
}

@freezed
abstract class RequestRapportCelluleAdministration
    with _$RequestRapportCelluleAdministration {
  factory RequestRapportCelluleAdministration({
    required String codeZone,
    required String fullNameRespoZone,
    required String contactRespoZone,
    required String codeSecteur,
    required String fullNameRespoSecteur,
    required String contactRespoSecteur,
    required String codeCellule,
    required String fullNameRespoCellule,
    required String contactRespoCellule,
    required String jourCellule,
    required String offrande,
    required String nombreBaptiser,
    required String nombreNonBaptiser,
    required List<Map<String, dynamic>> discipleCellule,
    required String id,
    required String formAdministrationIsSubmit,
    required String formAdministrationSubmitDate,
  }) = _RequestRapportCelluleAdministration;
  factory RequestRapportCelluleAdministration.fromJson(
    Map<String, dynamic> json,
  ) => _$RequestRapportCelluleAdministrationFromJson(json);
}

@Freezed(genericArgumentFactories: true)
abstract class RequestGeneriqueKey<T> with _$RequestGeneriqueKey<T> {
  const factory RequestGeneriqueKey({required T id}) = _RequestGeneriqueKey<T>;

  factory RequestGeneriqueKey.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$RequestGeneriqueKeyFromJson(json, fromJsonT);
}



@freezed
abstract class RequestImpliciteConnexion with _$RequestImpliciteConnexion {
  factory RequestImpliciteConnexion({
    required String deviceId,
  }) = _RequestImpliciteConnexion;
  factory RequestImpliciteConnexion.fromJson(Map<String, dynamic> json) =>
      _$RequestImpliciteConnexionFromJson(json);
}


@freezed
abstract class RequestItemSection with _$RequestItemSection {
  factory RequestItemSection({
     required String name,
     @Default(0) int count,
  }) = _RequestItemSection;
  factory RequestItemSection.fromJson(Map<String, dynamic> json) =>
      _$RequestItemSectionFromJson(json);
}

@freezed
abstract class RequestSection with _$RequestSection {
  factory RequestSection({
     required String title,
     @Default([]) List<RequestItemSection> items,
  }) = _RequestSection;
  factory RequestSection.fromJson(Map<String, dynamic> json) =>
      _$RequestSectionFromJson(json);
}


@freezed
abstract class RequestHumaneSectionAssistance with _$RequestHumaneSectionAssistance {
  factory RequestHumaneSectionAssistance({
      @Default("") String libelle,
      @Default("") String toutPetit ,
     @Default("") String juniors,
     @Default("") String cadets,
     @Default(0) int total,
   
  }) = _RequestHumaneSectionAssistance;
  factory RequestHumaneSectionAssistance.fromJson(Map<String, dynamic> json) =>
      _$RequestHumaneSectionAssistanceFromJson(json);
}



@freezed
abstract class RequestAuherInformation with _$RequestAuherInformation {
   factory RequestAuherInformation({required String libelle, required int  count }) = _RequestAuherInformation;
   factory RequestAuherInformation.fromJson(Map<String, dynamic> json) =>
      _$RequestAuherInformationFromJson(json);
}

@freezed
abstract class RequestAutherInformationSource with _$RequestAutherInformationSource {
  factory RequestAutherInformationSource(
    {
      required String title,
      required List<RequestAuherInformation> sections
    }) = _RequestAutherInformationSource;
  factory RequestAutherInformationSource.fromJson(Map<String, dynamic> json) =>
      _$RequestAutherInformationSourceFromJson(json);
}





@freezed
abstract class RequestRapportCelluleAssistance
    with _$RequestRapportCelluleAssistance {
  factory RequestRapportCelluleAssistance({
    required String nombreBaptiser,
    required List<Map<String, dynamic>> nomBaptiserStat,
    required List<Map<String, dynamic>> nouveauBaptiserStat,
    required List<Map<String, dynamic>> inviterStat,
    required List<Map<String, dynamic>> formationStat,
    required List<Map<String, dynamic>> sectionVisite,
    required List<Map<String, dynamic>> sectionActivite,
    required List<Map<String, dynamic>> sectionOuvrier,
    required List<Map<String, dynamic>> autres,
    required String id,
    required String formAssistanceIsSubmit,
    required String formAssistanceSubmitDate,
  }) = _RequestRapportCelluleAssistance;
  factory RequestRapportCelluleAssistance.fromJson(
    Map<String, dynamic> json,
  ) => _$RequestRapportCelluleAssistanceFromJson(json);
}


@freezed
abstract class RequestRapportCelluleActivity
    with _$RequestRapportCelluleActivity {
  factory RequestRapportCelluleActivity({
    required List<Map<String, dynamic>> visiteMenbre,
    required List<Map<String, dynamic>> visiteOuvrier,
    required List<Map<String, dynamic>> dateActivitySubmited,
    required String formActivityIsSubmit,
    required String formActivitySubmitDate,
  }) = _RequestRapportCelluleActivity;
  factory RequestRapportCelluleActivity.fromJson(
    Map<String, dynamic> json,
  ) => _$RequestRapportCelluleActivityFromJson(json);
}


@freezed
abstract class RequestRapportCelluleSuggestion
    with _$RequestRapportCelluleSuggestion {
  factory RequestRapportCelluleSuggestion({
    required List<Map<String, dynamic>> suggestions,
    required String faisAssignaler,
    required String ouvrierSpritualLive,
    required String formSuggestionIsSubmit,
    required String formSuggestionSubmitDate,
  }) = _RequestRapportCelluleSuggestion;
  factory RequestRapportCelluleSuggestion.fromJson(
    Map<String, dynamic> json,
  ) => _$RequestRapportCelluleSuggestionFromJson(json);
}