// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationResponseModel {

 String get title; String get description; String get tag; String get date; String get notificationId; List<NotificationClickResponseModel> get clicks;
/// Create a copy of NotificationResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationResponseModelCopyWith<NotificationResponseModel> get copyWith => _$NotificationResponseModelCopyWithImpl<NotificationResponseModel>(this as NotificationResponseModel, _$identity);

  /// Serializes this NotificationResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationResponseModel&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.date, date) || other.date == date)&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId)&&const DeepCollectionEquality().equals(other.clicks, clicks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,tag,date,notificationId,const DeepCollectionEquality().hash(clicks));

@override
String toString() {
  return 'NotificationResponseModel(title: $title, description: $description, tag: $tag, date: $date, notificationId: $notificationId, clicks: $clicks)';
}


}

/// @nodoc
abstract mixin class $NotificationResponseModelCopyWith<$Res>  {
  factory $NotificationResponseModelCopyWith(NotificationResponseModel value, $Res Function(NotificationResponseModel) _then) = _$NotificationResponseModelCopyWithImpl;
@useResult
$Res call({
 String title, String description, String tag, String date, String notificationId, List<NotificationClickResponseModel> clicks
});




}
/// @nodoc
class _$NotificationResponseModelCopyWithImpl<$Res>
    implements $NotificationResponseModelCopyWith<$Res> {
  _$NotificationResponseModelCopyWithImpl(this._self, this._then);

  final NotificationResponseModel _self;
  final $Res Function(NotificationResponseModel) _then;

/// Create a copy of NotificationResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? tag = null,Object? date = null,Object? notificationId = null,Object? clicks = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,notificationId: null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as String,clicks: null == clicks ? _self.clicks : clicks // ignore: cast_nullable_to_non_nullable
as List<NotificationClickResponseModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationResponseModel].
extension NotificationResponseModelPatterns on NotificationResponseModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationResponseModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _NotificationResponseModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationResponseModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description,  String tag,  String date,  String notificationId,  List<NotificationClickResponseModel> clicks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationResponseModel() when $default != null:
return $default(_that.title,_that.description,_that.tag,_that.date,_that.notificationId,_that.clicks);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description,  String tag,  String date,  String notificationId,  List<NotificationClickResponseModel> clicks)  $default,) {final _that = this;
switch (_that) {
case _NotificationResponseModel():
return $default(_that.title,_that.description,_that.tag,_that.date,_that.notificationId,_that.clicks);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description,  String tag,  String date,  String notificationId,  List<NotificationClickResponseModel> clicks)?  $default,) {final _that = this;
switch (_that) {
case _NotificationResponseModel() when $default != null:
return $default(_that.title,_that.description,_that.tag,_that.date,_that.notificationId,_that.clicks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationResponseModel implements NotificationResponseModel {
   _NotificationResponseModel({this.title = '', this.description = '', this.tag = '', this.date = '', this.notificationId = '', final  List<NotificationClickResponseModel> clicks = const []}): _clicks = clicks;
  factory _NotificationResponseModel.fromJson(Map<String, dynamic> json) => _$NotificationResponseModelFromJson(json);

@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
@override@JsonKey() final  String tag;
@override@JsonKey() final  String date;
@override@JsonKey() final  String notificationId;
 final  List<NotificationClickResponseModel> _clicks;
@override@JsonKey() List<NotificationClickResponseModel> get clicks {
  if (_clicks is EqualUnmodifiableListView) return _clicks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clicks);
}


/// Create a copy of NotificationResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationResponseModelCopyWith<_NotificationResponseModel> get copyWith => __$NotificationResponseModelCopyWithImpl<_NotificationResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationResponseModel&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.date, date) || other.date == date)&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId)&&const DeepCollectionEquality().equals(other._clicks, _clicks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,tag,date,notificationId,const DeepCollectionEquality().hash(_clicks));

@override
String toString() {
  return 'NotificationResponseModel(title: $title, description: $description, tag: $tag, date: $date, notificationId: $notificationId, clicks: $clicks)';
}


}

/// @nodoc
abstract mixin class _$NotificationResponseModelCopyWith<$Res> implements $NotificationResponseModelCopyWith<$Res> {
  factory _$NotificationResponseModelCopyWith(_NotificationResponseModel value, $Res Function(_NotificationResponseModel) _then) = __$NotificationResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, String tag, String date, String notificationId, List<NotificationClickResponseModel> clicks
});




}
/// @nodoc
class __$NotificationResponseModelCopyWithImpl<$Res>
    implements _$NotificationResponseModelCopyWith<$Res> {
  __$NotificationResponseModelCopyWithImpl(this._self, this._then);

  final _NotificationResponseModel _self;
  final $Res Function(_NotificationResponseModel) _then;

/// Create a copy of NotificationResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? tag = null,Object? date = null,Object? notificationId = null,Object? clicks = null,}) {
  return _then(_NotificationResponseModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,notificationId: null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as String,clicks: null == clicks ? _self._clicks : clicks // ignore: cast_nullable_to_non_nullable
as List<NotificationClickResponseModel>,
  ));
}


}


/// @nodoc
mixin _$NotificationClickResponseModel {

 String? get menberId; String? get vueAt;
/// Create a copy of NotificationClickResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationClickResponseModelCopyWith<NotificationClickResponseModel> get copyWith => _$NotificationClickResponseModelCopyWithImpl<NotificationClickResponseModel>(this as NotificationClickResponseModel, _$identity);

  /// Serializes this NotificationClickResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationClickResponseModel&&(identical(other.menberId, menberId) || other.menberId == menberId)&&(identical(other.vueAt, vueAt) || other.vueAt == vueAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menberId,vueAt);

@override
String toString() {
  return 'NotificationClickResponseModel(menberId: $menberId, vueAt: $vueAt)';
}


}

/// @nodoc
abstract mixin class $NotificationClickResponseModelCopyWith<$Res>  {
  factory $NotificationClickResponseModelCopyWith(NotificationClickResponseModel value, $Res Function(NotificationClickResponseModel) _then) = _$NotificationClickResponseModelCopyWithImpl;
@useResult
$Res call({
 String? menberId, String? vueAt
});




}
/// @nodoc
class _$NotificationClickResponseModelCopyWithImpl<$Res>
    implements $NotificationClickResponseModelCopyWith<$Res> {
  _$NotificationClickResponseModelCopyWithImpl(this._self, this._then);

  final NotificationClickResponseModel _self;
  final $Res Function(NotificationClickResponseModel) _then;

/// Create a copy of NotificationClickResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? menberId = freezed,Object? vueAt = freezed,}) {
  return _then(_self.copyWith(
menberId: freezed == menberId ? _self.menberId : menberId // ignore: cast_nullable_to_non_nullable
as String?,vueAt: freezed == vueAt ? _self.vueAt : vueAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationClickResponseModel].
extension NotificationClickResponseModelPatterns on NotificationClickResponseModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationClickResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationClickResponseModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationClickResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _NotificationClickResponseModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationClickResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationClickResponseModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? menberId,  String? vueAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationClickResponseModel() when $default != null:
return $default(_that.menberId,_that.vueAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? menberId,  String? vueAt)  $default,) {final _that = this;
switch (_that) {
case _NotificationClickResponseModel():
return $default(_that.menberId,_that.vueAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? menberId,  String? vueAt)?  $default,) {final _that = this;
switch (_that) {
case _NotificationClickResponseModel() when $default != null:
return $default(_that.menberId,_that.vueAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationClickResponseModel implements NotificationClickResponseModel {
   _NotificationClickResponseModel({this.menberId, this.vueAt});
  factory _NotificationClickResponseModel.fromJson(Map<String, dynamic> json) => _$NotificationClickResponseModelFromJson(json);

@override final  String? menberId;
@override final  String? vueAt;

/// Create a copy of NotificationClickResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationClickResponseModelCopyWith<_NotificationClickResponseModel> get copyWith => __$NotificationClickResponseModelCopyWithImpl<_NotificationClickResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationClickResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationClickResponseModel&&(identical(other.menberId, menberId) || other.menberId == menberId)&&(identical(other.vueAt, vueAt) || other.vueAt == vueAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menberId,vueAt);

@override
String toString() {
  return 'NotificationClickResponseModel(menberId: $menberId, vueAt: $vueAt)';
}


}

/// @nodoc
abstract mixin class _$NotificationClickResponseModelCopyWith<$Res> implements $NotificationClickResponseModelCopyWith<$Res> {
  factory _$NotificationClickResponseModelCopyWith(_NotificationClickResponseModel value, $Res Function(_NotificationClickResponseModel) _then) = __$NotificationClickResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String? menberId, String? vueAt
});




}
/// @nodoc
class __$NotificationClickResponseModelCopyWithImpl<$Res>
    implements _$NotificationClickResponseModelCopyWith<$Res> {
  __$NotificationClickResponseModelCopyWithImpl(this._self, this._then);

  final _NotificationClickResponseModel _self;
  final $Res Function(_NotificationClickResponseModel) _then;

/// Create a copy of NotificationClickResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? menberId = freezed,Object? vueAt = freezed,}) {
  return _then(_NotificationClickResponseModel(
menberId: freezed == menberId ? _self.menberId : menberId // ignore: cast_nullable_to_non_nullable
as String?,vueAt: freezed == vueAt ? _self.vueAt : vueAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
