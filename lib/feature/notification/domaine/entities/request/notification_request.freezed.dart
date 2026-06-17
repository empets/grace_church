// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequestNotification {

 String get title; String get tag; String get date; String get description;
/// Create a copy of RequestNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestNotificationCopyWith<RequestNotification> get copyWith => _$RequestNotificationCopyWithImpl<RequestNotification>(this as RequestNotification, _$identity);

  /// Serializes this RequestNotification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestNotification&&(identical(other.title, title) || other.title == title)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.date, date) || other.date == date)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,tag,date,description);

@override
String toString() {
  return 'RequestNotification(title: $title, tag: $tag, date: $date, description: $description)';
}


}

/// @nodoc
abstract mixin class $RequestNotificationCopyWith<$Res>  {
  factory $RequestNotificationCopyWith(RequestNotification value, $Res Function(RequestNotification) _then) = _$RequestNotificationCopyWithImpl;
@useResult
$Res call({
 String title, String tag, String date, String description
});




}
/// @nodoc
class _$RequestNotificationCopyWithImpl<$Res>
    implements $RequestNotificationCopyWith<$Res> {
  _$RequestNotificationCopyWithImpl(this._self, this._then);

  final RequestNotification _self;
  final $Res Function(RequestNotification) _then;

/// Create a copy of RequestNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? tag = null,Object? date = null,Object? description = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestNotification].
extension RequestNotificationPatterns on RequestNotification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestNotification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestNotification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestNotification value)  $default,){
final _that = this;
switch (_that) {
case _RequestNotification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestNotification value)?  $default,){
final _that = this;
switch (_that) {
case _RequestNotification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String tag,  String date,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestNotification() when $default != null:
return $default(_that.title,_that.tag,_that.date,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String tag,  String date,  String description)  $default,) {final _that = this;
switch (_that) {
case _RequestNotification():
return $default(_that.title,_that.tag,_that.date,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String tag,  String date,  String description)?  $default,) {final _that = this;
switch (_that) {
case _RequestNotification() when $default != null:
return $default(_that.title,_that.tag,_that.date,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestNotification implements RequestNotification {
   _RequestNotification({required this.title, required this.tag, required this.date, required this.description});
  factory _RequestNotification.fromJson(Map<String, dynamic> json) => _$RequestNotificationFromJson(json);

@override final  String title;
@override final  String tag;
@override final  String date;
@override final  String description;

/// Create a copy of RequestNotification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestNotificationCopyWith<_RequestNotification> get copyWith => __$RequestNotificationCopyWithImpl<_RequestNotification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestNotificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestNotification&&(identical(other.title, title) || other.title == title)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.date, date) || other.date == date)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,tag,date,description);

@override
String toString() {
  return 'RequestNotification(title: $title, tag: $tag, date: $date, description: $description)';
}


}

/// @nodoc
abstract mixin class _$RequestNotificationCopyWith<$Res> implements $RequestNotificationCopyWith<$Res> {
  factory _$RequestNotificationCopyWith(_RequestNotification value, $Res Function(_RequestNotification) _then) = __$RequestNotificationCopyWithImpl;
@override @useResult
$Res call({
 String title, String tag, String date, String description
});




}
/// @nodoc
class __$RequestNotificationCopyWithImpl<$Res>
    implements _$RequestNotificationCopyWith<$Res> {
  __$RequestNotificationCopyWithImpl(this._self, this._then);

  final _RequestNotification _self;
  final $Res Function(_RequestNotification) _then;

/// Create a copy of RequestNotification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? tag = null,Object? date = null,Object? description = null,}) {
  return _then(_RequestNotification(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RequestReadNotification {

 String get notificationId; String get menberId; String get vueAt;
/// Create a copy of RequestReadNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestReadNotificationCopyWith<RequestReadNotification> get copyWith => _$RequestReadNotificationCopyWithImpl<RequestReadNotification>(this as RequestReadNotification, _$identity);

  /// Serializes this RequestReadNotification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestReadNotification&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId)&&(identical(other.menberId, menberId) || other.menberId == menberId)&&(identical(other.vueAt, vueAt) || other.vueAt == vueAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,notificationId,menberId,vueAt);

@override
String toString() {
  return 'RequestReadNotification(notificationId: $notificationId, menberId: $menberId, vueAt: $vueAt)';
}


}

/// @nodoc
abstract mixin class $RequestReadNotificationCopyWith<$Res>  {
  factory $RequestReadNotificationCopyWith(RequestReadNotification value, $Res Function(RequestReadNotification) _then) = _$RequestReadNotificationCopyWithImpl;
@useResult
$Res call({
 String notificationId, String menberId, String vueAt
});




}
/// @nodoc
class _$RequestReadNotificationCopyWithImpl<$Res>
    implements $RequestReadNotificationCopyWith<$Res> {
  _$RequestReadNotificationCopyWithImpl(this._self, this._then);

  final RequestReadNotification _self;
  final $Res Function(RequestReadNotification) _then;

/// Create a copy of RequestReadNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notificationId = null,Object? menberId = null,Object? vueAt = null,}) {
  return _then(_self.copyWith(
notificationId: null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as String,menberId: null == menberId ? _self.menberId : menberId // ignore: cast_nullable_to_non_nullable
as String,vueAt: null == vueAt ? _self.vueAt : vueAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestReadNotification].
extension RequestReadNotificationPatterns on RequestReadNotification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestReadNotification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestReadNotification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestReadNotification value)  $default,){
final _that = this;
switch (_that) {
case _RequestReadNotification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestReadNotification value)?  $default,){
final _that = this;
switch (_that) {
case _RequestReadNotification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String notificationId,  String menberId,  String vueAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestReadNotification() when $default != null:
return $default(_that.notificationId,_that.menberId,_that.vueAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String notificationId,  String menberId,  String vueAt)  $default,) {final _that = this;
switch (_that) {
case _RequestReadNotification():
return $default(_that.notificationId,_that.menberId,_that.vueAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String notificationId,  String menberId,  String vueAt)?  $default,) {final _that = this;
switch (_that) {
case _RequestReadNotification() when $default != null:
return $default(_that.notificationId,_that.menberId,_that.vueAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestReadNotification implements RequestReadNotification {
   _RequestReadNotification({required this.notificationId, required this.menberId, required this.vueAt});
  factory _RequestReadNotification.fromJson(Map<String, dynamic> json) => _$RequestReadNotificationFromJson(json);

@override final  String notificationId;
@override final  String menberId;
@override final  String vueAt;

/// Create a copy of RequestReadNotification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestReadNotificationCopyWith<_RequestReadNotification> get copyWith => __$RequestReadNotificationCopyWithImpl<_RequestReadNotification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestReadNotificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestReadNotification&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId)&&(identical(other.menberId, menberId) || other.menberId == menberId)&&(identical(other.vueAt, vueAt) || other.vueAt == vueAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,notificationId,menberId,vueAt);

@override
String toString() {
  return 'RequestReadNotification(notificationId: $notificationId, menberId: $menberId, vueAt: $vueAt)';
}


}

/// @nodoc
abstract mixin class _$RequestReadNotificationCopyWith<$Res> implements $RequestReadNotificationCopyWith<$Res> {
  factory _$RequestReadNotificationCopyWith(_RequestReadNotification value, $Res Function(_RequestReadNotification) _then) = __$RequestReadNotificationCopyWithImpl;
@override @useResult
$Res call({
 String notificationId, String menberId, String vueAt
});




}
/// @nodoc
class __$RequestReadNotificationCopyWithImpl<$Res>
    implements _$RequestReadNotificationCopyWith<$Res> {
  __$RequestReadNotificationCopyWithImpl(this._self, this._then);

  final _RequestReadNotification _self;
  final $Res Function(_RequestReadNotification) _then;

/// Create a copy of RequestReadNotification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notificationId = null,Object? menberId = null,Object? vueAt = null,}) {
  return _then(_RequestReadNotification(
notificationId: null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as String,menberId: null == menberId ? _self.menberId : menberId // ignore: cast_nullable_to_non_nullable
as String,vueAt: null == vueAt ? _self.vueAt : vueAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
