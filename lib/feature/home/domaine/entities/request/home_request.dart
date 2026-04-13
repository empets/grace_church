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
    required List<DiscipleCellule> discipleCellule,
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
