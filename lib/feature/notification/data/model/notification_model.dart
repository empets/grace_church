
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grace_church/core/extension/extention.dart';
import 'package:grace_church/feature/notification/domaine/entities/response/notification_response.dart' show NotificationResponse, NotificationClickResponse;

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

//-----------------------------
//  NOTIFICATION RESPONSE MODEL
//------------------------------
@freezed
abstract class NotificationResponseModel with _$NotificationResponseModel {
  factory NotificationResponseModel({
    @Default('') String title,
    @Default('') String description,
    @Default('') String tag,
    @Default('') String date,
    @Default('') String notificationId,
    @Default([]) List<NotificationClickResponseModel> clicks,
  }) = _NotificationResponseModel;
  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseModelFromJson(json);

  static NotificationResponse toDomaine(NotificationResponseModel model) {
    return NotificationResponse(
      title: model.title.getOrEmpty(),
      description: model.description.getOrEmpty(),
      tag: model.tag.getOrEmpty(),
      date: model.date.getOrEmpty(),
      notificationId: model.notificationId.getOrEmpty(),
      clicks: model.clicks.map(NotificationClickResponseModel.toDomaine).toList(),
    );
  }
}


@freezed
abstract class NotificationClickResponseModel
    with _$NotificationClickResponseModel {
  factory NotificationClickResponseModel({String? menberId, String? vueAt}) =
      _NotificationClickResponseModel;
  factory NotificationClickResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationClickResponseModelFromJson(json);

  static NotificationClickResponse toDomaine(
    NotificationClickResponseModel model,
  ) {
    return NotificationClickResponse(
      menberId: model.menberId.getOrEmpty(),
      vueAt: model.vueAt.getOrEmpty(),
    );
  }
}