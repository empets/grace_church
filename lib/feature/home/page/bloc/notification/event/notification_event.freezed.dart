// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationEvent()';
}


}

/// @nodoc
class $NotificationEventCopyWith<$Res>  {
$NotificationEventCopyWith(NotificationEvent _, $Res Function(NotificationEvent) __);
}


/// Adds pattern-matching-related methods to [NotificationEvent].
extension NotificationEventPatterns on NotificationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FetchNotificationEvent value)?  fetch,TResult Function( FetchByTagNotificationEvent value)?  fetchByTag,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FetchNotificationEvent() when fetch != null:
return fetch(_that);case FetchByTagNotificationEvent() when fetchByTag != null:
return fetchByTag(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FetchNotificationEvent value)  fetch,required TResult Function( FetchByTagNotificationEvent value)  fetchByTag,}){
final _that = this;
switch (_that) {
case FetchNotificationEvent():
return fetch(_that);case FetchByTagNotificationEvent():
return fetchByTag(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FetchNotificationEvent value)?  fetch,TResult? Function( FetchByTagNotificationEvent value)?  fetchByTag,}){
final _that = this;
switch (_that) {
case FetchNotificationEvent() when fetch != null:
return fetch(_that);case FetchByTagNotificationEvent() when fetchByTag != null:
return fetchByTag(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetch,TResult Function( String? tag,  String? title,  String? date)?  fetchByTag,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FetchNotificationEvent() when fetch != null:
return fetch();case FetchByTagNotificationEvent() when fetchByTag != null:
return fetchByTag(_that.tag,_that.title,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetch,required TResult Function( String? tag,  String? title,  String? date)  fetchByTag,}) {final _that = this;
switch (_that) {
case FetchNotificationEvent():
return fetch();case FetchByTagNotificationEvent():
return fetchByTag(_that.tag,_that.title,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetch,TResult? Function( String? tag,  String? title,  String? date)?  fetchByTag,}) {final _that = this;
switch (_that) {
case FetchNotificationEvent() when fetch != null:
return fetch();case FetchByTagNotificationEvent() when fetchByTag != null:
return fetchByTag(_that.tag,_that.title,_that.date);case _:
  return null;

}
}

}

/// @nodoc


class FetchNotificationEvent implements NotificationEvent {
  const FetchNotificationEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchNotificationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationEvent.fetch()';
}


}




/// @nodoc


class FetchByTagNotificationEvent implements NotificationEvent {
  const FetchByTagNotificationEvent({this.tag, this.title, this.date});
  

 final  String? tag;
 final  String? title;
 final  String? date;

/// Create a copy of NotificationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchByTagNotificationEventCopyWith<FetchByTagNotificationEvent> get copyWith => _$FetchByTagNotificationEventCopyWithImpl<FetchByTagNotificationEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchByTagNotificationEvent&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,tag,title,date);

@override
String toString() {
  return 'NotificationEvent.fetchByTag(tag: $tag, title: $title, date: $date)';
}


}

/// @nodoc
abstract mixin class $FetchByTagNotificationEventCopyWith<$Res> implements $NotificationEventCopyWith<$Res> {
  factory $FetchByTagNotificationEventCopyWith(FetchByTagNotificationEvent value, $Res Function(FetchByTagNotificationEvent) _then) = _$FetchByTagNotificationEventCopyWithImpl;
@useResult
$Res call({
 String? tag, String? title, String? date
});




}
/// @nodoc
class _$FetchByTagNotificationEventCopyWithImpl<$Res>
    implements $FetchByTagNotificationEventCopyWith<$Res> {
  _$FetchByTagNotificationEventCopyWithImpl(this._self, this._then);

  final FetchByTagNotificationEvent _self;
  final $Res Function(FetchByTagNotificationEvent) _then;

/// Create a copy of NotificationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tag = freezed,Object? title = freezed,Object? date = freezed,}) {
  return _then(FetchByTagNotificationEvent(
tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
