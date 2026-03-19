import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
part 'profile_event.freezed.dart';

@freezed
abstract class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.fetch() = _ProfileEvent;
}
