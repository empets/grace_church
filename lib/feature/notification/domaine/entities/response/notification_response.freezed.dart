// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationResponse {

 String get title; String get description; String get tag; String get date; String get notificationId; List<NotificationClickResponse> get clicks;
/// Create a copy of NotificationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationResponseCopyWith<NotificationResponse> get copyWith => _$NotificationResponseCopyWithImpl<NotificationResponse>(this as NotificationResponse, _$identity);

  /// Serializes this NotificationResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationResponse&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.date, date) || other.date == date)&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId)&&const DeepCollectionEquality().equals(other.clicks, clicks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,tag,date,notificationId,const DeepCollectionEquality().hash(clicks));

@override
String toString() {
  return 'NotificationResponse(title: $title, description: $description, tag: $tag, date: $date, notificationId: $notificationId, clicks: $clicks)';
}


}

/// @nodoc
abstract mixin class $NotificationResponseCopyWith<$Res>  {
  factory $NotificationResponseCopyWith(NotificationResponse value, $Res Function(NotificationResponse) _then) = _$NotificationResponseCopyWithImpl;
@useResult
$Res call({
 String title, String description, String tag, String date, String notificationId, List<NotificationClickResponse> clicks
});




}
/// @nodoc
class _$NotificationResponseCopyWithImpl<$Res>
    implements $NotificationResponseCopyWith<$Res> {
  _$NotificationResponseCopyWithImpl(this._self, this._then);

  final NotificationResponse _self;
  final $Res Function(NotificationResponse) _then;

/// Create a copy of NotificationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? tag = null,Object? date = null,Object? notificationId = null,Object? clicks = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,notificationId: null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as String,clicks: null == clicks ? _self.clicks : clicks // ignore: cast_nullable_to_non_nullable
as List<NotificationClickResponse>,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationResponse].
extension NotificationResponsePatterns on NotificationResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationResponse value)  $default,){
final _that = this;
switch (_that) {
case _NotificationResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationResponse value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description,  String tag,  String date,  String notificationId,  List<NotificationClickResponse> clicks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description,  String tag,  String date,  String notificationId,  List<NotificationClickResponse> clicks)  $default,) {final _that = this;
switch (_that) {
case _NotificationResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description,  String tag,  String date,  String notificationId,  List<NotificationClickResponse> clicks)?  $default,) {final _that = this;
switch (_that) {
case _NotificationResponse() when $default != null:
return $default(_that.title,_that.description,_that.tag,_that.date,_that.notificationId,_that.clicks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationResponse implements NotificationResponse {
   _NotificationResponse({required this.title, required this.description, required this.tag, required this.date, required this.notificationId, required final  List<NotificationClickResponse> clicks}): _clicks = clicks;
  factory _NotificationResponse.fromJson(Map<String, dynamic> json) => _$NotificationResponseFromJson(json);

@override final  String title;
@override final  String description;
@override final  String tag;
@override final  String date;
@override final  String notificationId;
 final  List<NotificationClickResponse> _clicks;
@override List<NotificationClickResponse> get clicks {
  if (_clicks is EqualUnmodifiableListView) return _clicks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clicks);
}


/// Create a copy of NotificationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationResponseCopyWith<_NotificationResponse> get copyWith => __$NotificationResponseCopyWithImpl<_NotificationResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationResponse&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.date, date) || other.date == date)&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId)&&const DeepCollectionEquality().equals(other._clicks, _clicks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,tag,date,notificationId,const DeepCollectionEquality().hash(_clicks));

@override
String toString() {
  return 'NotificationResponse(title: $title, description: $description, tag: $tag, date: $date, notificationId: $notificationId, clicks: $clicks)';
}


}

/// @nodoc
abstract mixin class _$NotificationResponseCopyWith<$Res> implements $NotificationResponseCopyWith<$Res> {
  factory _$NotificationResponseCopyWith(_NotificationResponse value, $Res Function(_NotificationResponse) _then) = __$NotificationResponseCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, String tag, String date, String notificationId, List<NotificationClickResponse> clicks
});




}
/// @nodoc
class __$NotificationResponseCopyWithImpl<$Res>
    implements _$NotificationResponseCopyWith<$Res> {
  __$NotificationResponseCopyWithImpl(this._self, this._then);

  final _NotificationResponse _self;
  final $Res Function(_NotificationResponse) _then;

/// Create a copy of NotificationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? tag = null,Object? date = null,Object? notificationId = null,Object? clicks = null,}) {
  return _then(_NotificationResponse(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,notificationId: null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as String,clicks: null == clicks ? _self._clicks : clicks // ignore: cast_nullable_to_non_nullable
as List<NotificationClickResponse>,
  ));
}


}


/// @nodoc
mixin _$NotificationClickResponse {

 String get menberId; String get vueAt;
/// Create a copy of NotificationClickResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationClickResponseCopyWith<NotificationClickResponse> get copyWith => _$NotificationClickResponseCopyWithImpl<NotificationClickResponse>(this as NotificationClickResponse, _$identity);

  /// Serializes this NotificationClickResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationClickResponse&&(identical(other.menberId, menberId) || other.menberId == menberId)&&(identical(other.vueAt, vueAt) || other.vueAt == vueAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menberId,vueAt);

@override
String toString() {
  return 'NotificationClickResponse(menberId: $menberId, vueAt: $vueAt)';
}


}

/// @nodoc
abstract mixin class $NotificationClickResponseCopyWith<$Res>  {
  factory $NotificationClickResponseCopyWith(NotificationClickResponse value, $Res Function(NotificationClickResponse) _then) = _$NotificationClickResponseCopyWithImpl;
@useResult
$Res call({
 String menberId, String vueAt
});




}
/// @nodoc
class _$NotificationClickResponseCopyWithImpl<$Res>
    implements $NotificationClickResponseCopyWith<$Res> {
  _$NotificationClickResponseCopyWithImpl(this._self, this._then);

  final NotificationClickResponse _self;
  final $Res Function(NotificationClickResponse) _then;

/// Create a copy of NotificationClickResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? menberId = null,Object? vueAt = null,}) {
  return _then(_self.copyWith(
menberId: null == menberId ? _self.menberId : menberId // ignore: cast_nullable_to_non_nullable
as String,vueAt: null == vueAt ? _self.vueAt : vueAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationClickResponse].
extension NotificationClickResponsePatterns on NotificationClickResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationClickResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationClickResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationClickResponse value)  $default,){
final _that = this;
switch (_that) {
case _NotificationClickResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationClickResponse value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationClickResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String menberId,  String vueAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationClickResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String menberId,  String vueAt)  $default,) {final _that = this;
switch (_that) {
case _NotificationClickResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String menberId,  String vueAt)?  $default,) {final _that = this;
switch (_that) {
case _NotificationClickResponse() when $default != null:
return $default(_that.menberId,_that.vueAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationClickResponse implements NotificationClickResponse {
   _NotificationClickResponse({required this.menberId, required this.vueAt});
  factory _NotificationClickResponse.fromJson(Map<String, dynamic> json) => _$NotificationClickResponseFromJson(json);

@override final  String menberId;
@override final  String vueAt;

/// Create a copy of NotificationClickResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationClickResponseCopyWith<_NotificationClickResponse> get copyWith => __$NotificationClickResponseCopyWithImpl<_NotificationClickResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationClickResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationClickResponse&&(identical(other.menberId, menberId) || other.menberId == menberId)&&(identical(other.vueAt, vueAt) || other.vueAt == vueAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menberId,vueAt);

@override
String toString() {
  return 'NotificationClickResponse(menberId: $menberId, vueAt: $vueAt)';
}


}

/// @nodoc
abstract mixin class _$NotificationClickResponseCopyWith<$Res> implements $NotificationClickResponseCopyWith<$Res> {
  factory _$NotificationClickResponseCopyWith(_NotificationClickResponse value, $Res Function(_NotificationClickResponse) _then) = __$NotificationClickResponseCopyWithImpl;
@override @useResult
$Res call({
 String menberId, String vueAt
});




}
/// @nodoc
class __$NotificationClickResponseCopyWithImpl<$Res>
    implements _$NotificationClickResponseCopyWith<$Res> {
  __$NotificationClickResponseCopyWithImpl(this._self, this._then);

  final _NotificationClickResponse _self;
  final $Res Function(_NotificationClickResponse) _then;

/// Create a copy of NotificationClickResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? menberId = null,Object? vueAt = null,}) {
  return _then(_NotificationClickResponse(
menberId: null == menberId ? _self.menberId : menberId // ignore: cast_nullable_to_non_nullable
as String,vueAt: null == vueAt ? _self.vueAt : vueAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
