import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_request.freezed.dart';
part 'home_request.g.dart';

@freezed
abstract class NoParams with _$NoParams {
  factory NoParams() = _NoParams;
  factory NoParams.fromJson(Map<String, dynamic> json) =>
      _$NoParamsFromJson(json);
}


