import 'package:freezed_annotation/freezed_annotation.dart';
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



