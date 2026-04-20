// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmptyRequest implements DiagnosticableTreeMixin {



  /// Serializes this EmptyRequest to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'EmptyRequest'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmptyRequest);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'EmptyRequest()';
}


}

/// @nodoc
class $EmptyRequestCopyWith<$Res>  {
$EmptyRequestCopyWith(EmptyRequest _, $Res Function(EmptyRequest) __);
}


/// Adds pattern-matching-related methods to [EmptyRequest].
extension EmptyRequestPatterns on EmptyRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmptyRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmptyRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmptyRequest value)  $default,){
final _that = this;
switch (_that) {
case _EmptyRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmptyRequest value)?  $default,){
final _that = this;
switch (_that) {
case _EmptyRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function()?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmptyRequest() when $default != null:
return $default();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function()  $default,) {final _that = this;
switch (_that) {
case _EmptyRequest():
return $default();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function()?  $default,) {final _that = this;
switch (_that) {
case _EmptyRequest() when $default != null:
return $default();case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmptyRequest with DiagnosticableTreeMixin implements EmptyRequest {
   _EmptyRequest();
  factory _EmptyRequest.fromJson(Map<String, dynamic> json) => _$EmptyRequestFromJson(json);




@override
Map<String, dynamic> toJson() {
  return _$EmptyRequestToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'EmptyRequest'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmptyRequest);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'EmptyRequest()';
}


}





/// @nodoc
mixin _$RequestNotification implements DiagnosticableTreeMixin {

 String get title; String get tag; String get date; String get description;
/// Create a copy of RequestNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestNotificationCopyWith<RequestNotification> get copyWith => _$RequestNotificationCopyWithImpl<RequestNotification>(this as RequestNotification, _$identity);

  /// Serializes this RequestNotification to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestNotification'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('tag', tag))..add(DiagnosticsProperty('date', date))..add(DiagnosticsProperty('description', description));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestNotification&&(identical(other.title, title) || other.title == title)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.date, date) || other.date == date)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,tag,date,description);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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

class _RequestNotification with DiagnosticableTreeMixin implements RequestNotification {
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
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestNotification'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('tag', tag))..add(DiagnosticsProperty('date', date))..add(DiagnosticsProperty('description', description));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestNotification&&(identical(other.title, title) || other.title == title)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.date, date) || other.date == date)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,tag,date,description);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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
mixin _$RequestCellule implements DiagnosticableTreeMixin {

 String? get responsable; String? get celluleCode; String? get date; String? get nom; String? get description; double? get latitude; double? get longitude; String? get adresse; String? get celluleId;
/// Create a copy of RequestCellule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestCelluleCopyWith<RequestCellule> get copyWith => _$RequestCelluleCopyWithImpl<RequestCellule>(this as RequestCellule, _$identity);

  /// Serializes this RequestCellule to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestCellule'))
    ..add(DiagnosticsProperty('responsable', responsable))..add(DiagnosticsProperty('celluleCode', celluleCode))..add(DiagnosticsProperty('date', date))..add(DiagnosticsProperty('nom', nom))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('latitude', latitude))..add(DiagnosticsProperty('longitude', longitude))..add(DiagnosticsProperty('adresse', adresse))..add(DiagnosticsProperty('celluleId', celluleId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestCellule&&(identical(other.responsable, responsable) || other.responsable == responsable)&&(identical(other.celluleCode, celluleCode) || other.celluleCode == celluleCode)&&(identical(other.date, date) || other.date == date)&&(identical(other.nom, nom) || other.nom == nom)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.celluleId, celluleId) || other.celluleId == celluleId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,responsable,celluleCode,date,nom,description,latitude,longitude,adresse,celluleId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestCellule(responsable: $responsable, celluleCode: $celluleCode, date: $date, nom: $nom, description: $description, latitude: $latitude, longitude: $longitude, adresse: $adresse, celluleId: $celluleId)';
}


}

/// @nodoc
abstract mixin class $RequestCelluleCopyWith<$Res>  {
  factory $RequestCelluleCopyWith(RequestCellule value, $Res Function(RequestCellule) _then) = _$RequestCelluleCopyWithImpl;
@useResult
$Res call({
 String? responsable, String? celluleCode, String? date, String? nom, String? description, double? latitude, double? longitude, String? adresse, String? celluleId
});




}
/// @nodoc
class _$RequestCelluleCopyWithImpl<$Res>
    implements $RequestCelluleCopyWith<$Res> {
  _$RequestCelluleCopyWithImpl(this._self, this._then);

  final RequestCellule _self;
  final $Res Function(RequestCellule) _then;

/// Create a copy of RequestCellule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? responsable = freezed,Object? celluleCode = freezed,Object? date = freezed,Object? nom = freezed,Object? description = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? adresse = freezed,Object? celluleId = freezed,}) {
  return _then(_self.copyWith(
responsable: freezed == responsable ? _self.responsable : responsable // ignore: cast_nullable_to_non_nullable
as String?,celluleCode: freezed == celluleCode ? _self.celluleCode : celluleCode // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,nom: freezed == nom ? _self.nom : nom // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,adresse: freezed == adresse ? _self.adresse : adresse // ignore: cast_nullable_to_non_nullable
as String?,celluleId: freezed == celluleId ? _self.celluleId : celluleId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestCellule].
extension RequestCellulePatterns on RequestCellule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestCellule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestCellule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestCellule value)  $default,){
final _that = this;
switch (_that) {
case _RequestCellule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestCellule value)?  $default,){
final _that = this;
switch (_that) {
case _RequestCellule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? responsable,  String? celluleCode,  String? date,  String? nom,  String? description,  double? latitude,  double? longitude,  String? adresse,  String? celluleId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestCellule() when $default != null:
return $default(_that.responsable,_that.celluleCode,_that.date,_that.nom,_that.description,_that.latitude,_that.longitude,_that.adresse,_that.celluleId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? responsable,  String? celluleCode,  String? date,  String? nom,  String? description,  double? latitude,  double? longitude,  String? adresse,  String? celluleId)  $default,) {final _that = this;
switch (_that) {
case _RequestCellule():
return $default(_that.responsable,_that.celluleCode,_that.date,_that.nom,_that.description,_that.latitude,_that.longitude,_that.adresse,_that.celluleId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? responsable,  String? celluleCode,  String? date,  String? nom,  String? description,  double? latitude,  double? longitude,  String? adresse,  String? celluleId)?  $default,) {final _that = this;
switch (_that) {
case _RequestCellule() when $default != null:
return $default(_that.responsable,_that.celluleCode,_that.date,_that.nom,_that.description,_that.latitude,_that.longitude,_that.adresse,_that.celluleId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestCellule with DiagnosticableTreeMixin implements RequestCellule {
   _RequestCellule({this.responsable, this.celluleCode, this.date, this.nom, this.description, this.latitude, this.longitude, this.adresse, this.celluleId});
  factory _RequestCellule.fromJson(Map<String, dynamic> json) => _$RequestCelluleFromJson(json);

@override final  String? responsable;
@override final  String? celluleCode;
@override final  String? date;
@override final  String? nom;
@override final  String? description;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? adresse;
@override final  String? celluleId;

/// Create a copy of RequestCellule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestCelluleCopyWith<_RequestCellule> get copyWith => __$RequestCelluleCopyWithImpl<_RequestCellule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestCelluleToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestCellule'))
    ..add(DiagnosticsProperty('responsable', responsable))..add(DiagnosticsProperty('celluleCode', celluleCode))..add(DiagnosticsProperty('date', date))..add(DiagnosticsProperty('nom', nom))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('latitude', latitude))..add(DiagnosticsProperty('longitude', longitude))..add(DiagnosticsProperty('adresse', adresse))..add(DiagnosticsProperty('celluleId', celluleId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestCellule&&(identical(other.responsable, responsable) || other.responsable == responsable)&&(identical(other.celluleCode, celluleCode) || other.celluleCode == celluleCode)&&(identical(other.date, date) || other.date == date)&&(identical(other.nom, nom) || other.nom == nom)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.celluleId, celluleId) || other.celluleId == celluleId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,responsable,celluleCode,date,nom,description,latitude,longitude,adresse,celluleId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestCellule(responsable: $responsable, celluleCode: $celluleCode, date: $date, nom: $nom, description: $description, latitude: $latitude, longitude: $longitude, adresse: $adresse, celluleId: $celluleId)';
}


}

/// @nodoc
abstract mixin class _$RequestCelluleCopyWith<$Res> implements $RequestCelluleCopyWith<$Res> {
  factory _$RequestCelluleCopyWith(_RequestCellule value, $Res Function(_RequestCellule) _then) = __$RequestCelluleCopyWithImpl;
@override @useResult
$Res call({
 String? responsable, String? celluleCode, String? date, String? nom, String? description, double? latitude, double? longitude, String? adresse, String? celluleId
});




}
/// @nodoc
class __$RequestCelluleCopyWithImpl<$Res>
    implements _$RequestCelluleCopyWith<$Res> {
  __$RequestCelluleCopyWithImpl(this._self, this._then);

  final _RequestCellule _self;
  final $Res Function(_RequestCellule) _then;

/// Create a copy of RequestCellule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? responsable = freezed,Object? celluleCode = freezed,Object? date = freezed,Object? nom = freezed,Object? description = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? adresse = freezed,Object? celluleId = freezed,}) {
  return _then(_RequestCellule(
responsable: freezed == responsable ? _self.responsable : responsable // ignore: cast_nullable_to_non_nullable
as String?,celluleCode: freezed == celluleCode ? _self.celluleCode : celluleCode // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,nom: freezed == nom ? _self.nom : nom // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,adresse: freezed == adresse ? _self.adresse : adresse // ignore: cast_nullable_to_non_nullable
as String?,celluleId: freezed == celluleId ? _self.celluleId : celluleId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RequestReponsableCellule implements DiagnosticableTreeMixin {

 String? get celluleResponsableName; String? get celluleCode; String? get date; String? get celluleName; String? get contact; String? get email; String? get adresse; String? get celluleId; String? get secteurId; String? get secteurCode;
/// Create a copy of RequestReponsableCellule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestReponsableCelluleCopyWith<RequestReponsableCellule> get copyWith => _$RequestReponsableCelluleCopyWithImpl<RequestReponsableCellule>(this as RequestReponsableCellule, _$identity);

  /// Serializes this RequestReponsableCellule to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestReponsableCellule'))
    ..add(DiagnosticsProperty('celluleResponsableName', celluleResponsableName))..add(DiagnosticsProperty('celluleCode', celluleCode))..add(DiagnosticsProperty('date', date))..add(DiagnosticsProperty('celluleName', celluleName))..add(DiagnosticsProperty('contact', contact))..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('adresse', adresse))..add(DiagnosticsProperty('celluleId', celluleId))..add(DiagnosticsProperty('secteurId', secteurId))..add(DiagnosticsProperty('secteurCode', secteurCode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestReponsableCellule&&(identical(other.celluleResponsableName, celluleResponsableName) || other.celluleResponsableName == celluleResponsableName)&&(identical(other.celluleCode, celluleCode) || other.celluleCode == celluleCode)&&(identical(other.date, date) || other.date == date)&&(identical(other.celluleName, celluleName) || other.celluleName == celluleName)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.email, email) || other.email == email)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.celluleId, celluleId) || other.celluleId == celluleId)&&(identical(other.secteurId, secteurId) || other.secteurId == secteurId)&&(identical(other.secteurCode, secteurCode) || other.secteurCode == secteurCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,celluleResponsableName,celluleCode,date,celluleName,contact,email,adresse,celluleId,secteurId,secteurCode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestReponsableCellule(celluleResponsableName: $celluleResponsableName, celluleCode: $celluleCode, date: $date, celluleName: $celluleName, contact: $contact, email: $email, adresse: $adresse, celluleId: $celluleId, secteurId: $secteurId, secteurCode: $secteurCode)';
}


}

/// @nodoc
abstract mixin class $RequestReponsableCelluleCopyWith<$Res>  {
  factory $RequestReponsableCelluleCopyWith(RequestReponsableCellule value, $Res Function(RequestReponsableCellule) _then) = _$RequestReponsableCelluleCopyWithImpl;
@useResult
$Res call({
 String? celluleResponsableName, String? celluleCode, String? date, String? celluleName, String? contact, String? email, String? adresse, String? celluleId, String? secteurId, String? secteurCode
});




}
/// @nodoc
class _$RequestReponsableCelluleCopyWithImpl<$Res>
    implements $RequestReponsableCelluleCopyWith<$Res> {
  _$RequestReponsableCelluleCopyWithImpl(this._self, this._then);

  final RequestReponsableCellule _self;
  final $Res Function(RequestReponsableCellule) _then;

/// Create a copy of RequestReponsableCellule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? celluleResponsableName = freezed,Object? celluleCode = freezed,Object? date = freezed,Object? celluleName = freezed,Object? contact = freezed,Object? email = freezed,Object? adresse = freezed,Object? celluleId = freezed,Object? secteurId = freezed,Object? secteurCode = freezed,}) {
  return _then(_self.copyWith(
celluleResponsableName: freezed == celluleResponsableName ? _self.celluleResponsableName : celluleResponsableName // ignore: cast_nullable_to_non_nullable
as String?,celluleCode: freezed == celluleCode ? _self.celluleCode : celluleCode // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,celluleName: freezed == celluleName ? _self.celluleName : celluleName // ignore: cast_nullable_to_non_nullable
as String?,contact: freezed == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,adresse: freezed == adresse ? _self.adresse : adresse // ignore: cast_nullable_to_non_nullable
as String?,celluleId: freezed == celluleId ? _self.celluleId : celluleId // ignore: cast_nullable_to_non_nullable
as String?,secteurId: freezed == secteurId ? _self.secteurId : secteurId // ignore: cast_nullable_to_non_nullable
as String?,secteurCode: freezed == secteurCode ? _self.secteurCode : secteurCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestReponsableCellule].
extension RequestReponsableCellulePatterns on RequestReponsableCellule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestReponsableCellule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestReponsableCellule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestReponsableCellule value)  $default,){
final _that = this;
switch (_that) {
case _RequestReponsableCellule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestReponsableCellule value)?  $default,){
final _that = this;
switch (_that) {
case _RequestReponsableCellule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? celluleResponsableName,  String? celluleCode,  String? date,  String? celluleName,  String? contact,  String? email,  String? adresse,  String? celluleId,  String? secteurId,  String? secteurCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestReponsableCellule() when $default != null:
return $default(_that.celluleResponsableName,_that.celluleCode,_that.date,_that.celluleName,_that.contact,_that.email,_that.adresse,_that.celluleId,_that.secteurId,_that.secteurCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? celluleResponsableName,  String? celluleCode,  String? date,  String? celluleName,  String? contact,  String? email,  String? adresse,  String? celluleId,  String? secteurId,  String? secteurCode)  $default,) {final _that = this;
switch (_that) {
case _RequestReponsableCellule():
return $default(_that.celluleResponsableName,_that.celluleCode,_that.date,_that.celluleName,_that.contact,_that.email,_that.adresse,_that.celluleId,_that.secteurId,_that.secteurCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? celluleResponsableName,  String? celluleCode,  String? date,  String? celluleName,  String? contact,  String? email,  String? adresse,  String? celluleId,  String? secteurId,  String? secteurCode)?  $default,) {final _that = this;
switch (_that) {
case _RequestReponsableCellule() when $default != null:
return $default(_that.celluleResponsableName,_that.celluleCode,_that.date,_that.celluleName,_that.contact,_that.email,_that.adresse,_that.celluleId,_that.secteurId,_that.secteurCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestReponsableCellule with DiagnosticableTreeMixin implements RequestReponsableCellule {
   _RequestReponsableCellule({this.celluleResponsableName, this.celluleCode, this.date, this.celluleName, this.contact, this.email, this.adresse, this.celluleId, this.secteurId, this.secteurCode});
  factory _RequestReponsableCellule.fromJson(Map<String, dynamic> json) => _$RequestReponsableCelluleFromJson(json);

@override final  String? celluleResponsableName;
@override final  String? celluleCode;
@override final  String? date;
@override final  String? celluleName;
@override final  String? contact;
@override final  String? email;
@override final  String? adresse;
@override final  String? celluleId;
@override final  String? secteurId;
@override final  String? secteurCode;

/// Create a copy of RequestReponsableCellule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestReponsableCelluleCopyWith<_RequestReponsableCellule> get copyWith => __$RequestReponsableCelluleCopyWithImpl<_RequestReponsableCellule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestReponsableCelluleToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestReponsableCellule'))
    ..add(DiagnosticsProperty('celluleResponsableName', celluleResponsableName))..add(DiagnosticsProperty('celluleCode', celluleCode))..add(DiagnosticsProperty('date', date))..add(DiagnosticsProperty('celluleName', celluleName))..add(DiagnosticsProperty('contact', contact))..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('adresse', adresse))..add(DiagnosticsProperty('celluleId', celluleId))..add(DiagnosticsProperty('secteurId', secteurId))..add(DiagnosticsProperty('secteurCode', secteurCode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestReponsableCellule&&(identical(other.celluleResponsableName, celluleResponsableName) || other.celluleResponsableName == celluleResponsableName)&&(identical(other.celluleCode, celluleCode) || other.celluleCode == celluleCode)&&(identical(other.date, date) || other.date == date)&&(identical(other.celluleName, celluleName) || other.celluleName == celluleName)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.email, email) || other.email == email)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.celluleId, celluleId) || other.celluleId == celluleId)&&(identical(other.secteurId, secteurId) || other.secteurId == secteurId)&&(identical(other.secteurCode, secteurCode) || other.secteurCode == secteurCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,celluleResponsableName,celluleCode,date,celluleName,contact,email,adresse,celluleId,secteurId,secteurCode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestReponsableCellule(celluleResponsableName: $celluleResponsableName, celluleCode: $celluleCode, date: $date, celluleName: $celluleName, contact: $contact, email: $email, adresse: $adresse, celluleId: $celluleId, secteurId: $secteurId, secteurCode: $secteurCode)';
}


}

/// @nodoc
abstract mixin class _$RequestReponsableCelluleCopyWith<$Res> implements $RequestReponsableCelluleCopyWith<$Res> {
  factory _$RequestReponsableCelluleCopyWith(_RequestReponsableCellule value, $Res Function(_RequestReponsableCellule) _then) = __$RequestReponsableCelluleCopyWithImpl;
@override @useResult
$Res call({
 String? celluleResponsableName, String? celluleCode, String? date, String? celluleName, String? contact, String? email, String? adresse, String? celluleId, String? secteurId, String? secteurCode
});




}
/// @nodoc
class __$RequestReponsableCelluleCopyWithImpl<$Res>
    implements _$RequestReponsableCelluleCopyWith<$Res> {
  __$RequestReponsableCelluleCopyWithImpl(this._self, this._then);

  final _RequestReponsableCellule _self;
  final $Res Function(_RequestReponsableCellule) _then;

/// Create a copy of RequestReponsableCellule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? celluleResponsableName = freezed,Object? celluleCode = freezed,Object? date = freezed,Object? celluleName = freezed,Object? contact = freezed,Object? email = freezed,Object? adresse = freezed,Object? celluleId = freezed,Object? secteurId = freezed,Object? secteurCode = freezed,}) {
  return _then(_RequestReponsableCellule(
celluleResponsableName: freezed == celluleResponsableName ? _self.celluleResponsableName : celluleResponsableName // ignore: cast_nullable_to_non_nullable
as String?,celluleCode: freezed == celluleCode ? _self.celluleCode : celluleCode // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,celluleName: freezed == celluleName ? _self.celluleName : celluleName // ignore: cast_nullable_to_non_nullable
as String?,contact: freezed == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,adresse: freezed == adresse ? _self.adresse : adresse // ignore: cast_nullable_to_non_nullable
as String?,celluleId: freezed == celluleId ? _self.celluleId : celluleId // ignore: cast_nullable_to_non_nullable
as String?,secteurId: freezed == secteurId ? _self.secteurId : secteurId // ignore: cast_nullable_to_non_nullable
as String?,secteurCode: freezed == secteurCode ? _self.secteurCode : secteurCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RequestReponsableSecteur implements DiagnosticableTreeMixin {

 String? get secteurResponsableName; String? get secteurCode; String? get dateCreated; String? get secteurName; String? get contactResponsable; String? get emailResponsable; String? get adresse; String? get secteurId; String? get zoneId; String? get zoneCode;
/// Create a copy of RequestReponsableSecteur
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestReponsableSecteurCopyWith<RequestReponsableSecteur> get copyWith => _$RequestReponsableSecteurCopyWithImpl<RequestReponsableSecteur>(this as RequestReponsableSecteur, _$identity);

  /// Serializes this RequestReponsableSecteur to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestReponsableSecteur'))
    ..add(DiagnosticsProperty('secteurResponsableName', secteurResponsableName))..add(DiagnosticsProperty('secteurCode', secteurCode))..add(DiagnosticsProperty('dateCreated', dateCreated))..add(DiagnosticsProperty('secteurName', secteurName))..add(DiagnosticsProperty('contactResponsable', contactResponsable))..add(DiagnosticsProperty('emailResponsable', emailResponsable))..add(DiagnosticsProperty('adresse', adresse))..add(DiagnosticsProperty('secteurId', secteurId))..add(DiagnosticsProperty('zoneId', zoneId))..add(DiagnosticsProperty('zoneCode', zoneCode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestReponsableSecteur&&(identical(other.secteurResponsableName, secteurResponsableName) || other.secteurResponsableName == secteurResponsableName)&&(identical(other.secteurCode, secteurCode) || other.secteurCode == secteurCode)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.secteurName, secteurName) || other.secteurName == secteurName)&&(identical(other.contactResponsable, contactResponsable) || other.contactResponsable == contactResponsable)&&(identical(other.emailResponsable, emailResponsable) || other.emailResponsable == emailResponsable)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.secteurId, secteurId) || other.secteurId == secteurId)&&(identical(other.zoneId, zoneId) || other.zoneId == zoneId)&&(identical(other.zoneCode, zoneCode) || other.zoneCode == zoneCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,secteurResponsableName,secteurCode,dateCreated,secteurName,contactResponsable,emailResponsable,adresse,secteurId,zoneId,zoneCode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestReponsableSecteur(secteurResponsableName: $secteurResponsableName, secteurCode: $secteurCode, dateCreated: $dateCreated, secteurName: $secteurName, contactResponsable: $contactResponsable, emailResponsable: $emailResponsable, adresse: $adresse, secteurId: $secteurId, zoneId: $zoneId, zoneCode: $zoneCode)';
}


}

/// @nodoc
abstract mixin class $RequestReponsableSecteurCopyWith<$Res>  {
  factory $RequestReponsableSecteurCopyWith(RequestReponsableSecteur value, $Res Function(RequestReponsableSecteur) _then) = _$RequestReponsableSecteurCopyWithImpl;
@useResult
$Res call({
 String? secteurResponsableName, String? secteurCode, String? dateCreated, String? secteurName, String? contactResponsable, String? emailResponsable, String? adresse, String? secteurId, String? zoneId, String? zoneCode
});




}
/// @nodoc
class _$RequestReponsableSecteurCopyWithImpl<$Res>
    implements $RequestReponsableSecteurCopyWith<$Res> {
  _$RequestReponsableSecteurCopyWithImpl(this._self, this._then);

  final RequestReponsableSecteur _self;
  final $Res Function(RequestReponsableSecteur) _then;

/// Create a copy of RequestReponsableSecteur
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? secteurResponsableName = freezed,Object? secteurCode = freezed,Object? dateCreated = freezed,Object? secteurName = freezed,Object? contactResponsable = freezed,Object? emailResponsable = freezed,Object? adresse = freezed,Object? secteurId = freezed,Object? zoneId = freezed,Object? zoneCode = freezed,}) {
  return _then(_self.copyWith(
secteurResponsableName: freezed == secteurResponsableName ? _self.secteurResponsableName : secteurResponsableName // ignore: cast_nullable_to_non_nullable
as String?,secteurCode: freezed == secteurCode ? _self.secteurCode : secteurCode // ignore: cast_nullable_to_non_nullable
as String?,dateCreated: freezed == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String?,secteurName: freezed == secteurName ? _self.secteurName : secteurName // ignore: cast_nullable_to_non_nullable
as String?,contactResponsable: freezed == contactResponsable ? _self.contactResponsable : contactResponsable // ignore: cast_nullable_to_non_nullable
as String?,emailResponsable: freezed == emailResponsable ? _self.emailResponsable : emailResponsable // ignore: cast_nullable_to_non_nullable
as String?,adresse: freezed == adresse ? _self.adresse : adresse // ignore: cast_nullable_to_non_nullable
as String?,secteurId: freezed == secteurId ? _self.secteurId : secteurId // ignore: cast_nullable_to_non_nullable
as String?,zoneId: freezed == zoneId ? _self.zoneId : zoneId // ignore: cast_nullable_to_non_nullable
as String?,zoneCode: freezed == zoneCode ? _self.zoneCode : zoneCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestReponsableSecteur].
extension RequestReponsableSecteurPatterns on RequestReponsableSecteur {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestReponsableSecteur value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestReponsableSecteur() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestReponsableSecteur value)  $default,){
final _that = this;
switch (_that) {
case _RequestReponsableSecteur():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestReponsableSecteur value)?  $default,){
final _that = this;
switch (_that) {
case _RequestReponsableSecteur() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? secteurResponsableName,  String? secteurCode,  String? dateCreated,  String? secteurName,  String? contactResponsable,  String? emailResponsable,  String? adresse,  String? secteurId,  String? zoneId,  String? zoneCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestReponsableSecteur() when $default != null:
return $default(_that.secteurResponsableName,_that.secteurCode,_that.dateCreated,_that.secteurName,_that.contactResponsable,_that.emailResponsable,_that.adresse,_that.secteurId,_that.zoneId,_that.zoneCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? secteurResponsableName,  String? secteurCode,  String? dateCreated,  String? secteurName,  String? contactResponsable,  String? emailResponsable,  String? adresse,  String? secteurId,  String? zoneId,  String? zoneCode)  $default,) {final _that = this;
switch (_that) {
case _RequestReponsableSecteur():
return $default(_that.secteurResponsableName,_that.secteurCode,_that.dateCreated,_that.secteurName,_that.contactResponsable,_that.emailResponsable,_that.adresse,_that.secteurId,_that.zoneId,_that.zoneCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? secteurResponsableName,  String? secteurCode,  String? dateCreated,  String? secteurName,  String? contactResponsable,  String? emailResponsable,  String? adresse,  String? secteurId,  String? zoneId,  String? zoneCode)?  $default,) {final _that = this;
switch (_that) {
case _RequestReponsableSecteur() when $default != null:
return $default(_that.secteurResponsableName,_that.secteurCode,_that.dateCreated,_that.secteurName,_that.contactResponsable,_that.emailResponsable,_that.adresse,_that.secteurId,_that.zoneId,_that.zoneCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestReponsableSecteur with DiagnosticableTreeMixin implements RequestReponsableSecteur {
   _RequestReponsableSecteur({this.secteurResponsableName, this.secteurCode, this.dateCreated, this.secteurName, this.contactResponsable, this.emailResponsable, this.adresse, this.secteurId, this.zoneId, this.zoneCode});
  factory _RequestReponsableSecteur.fromJson(Map<String, dynamic> json) => _$RequestReponsableSecteurFromJson(json);

@override final  String? secteurResponsableName;
@override final  String? secteurCode;
@override final  String? dateCreated;
@override final  String? secteurName;
@override final  String? contactResponsable;
@override final  String? emailResponsable;
@override final  String? adresse;
@override final  String? secteurId;
@override final  String? zoneId;
@override final  String? zoneCode;

/// Create a copy of RequestReponsableSecteur
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestReponsableSecteurCopyWith<_RequestReponsableSecteur> get copyWith => __$RequestReponsableSecteurCopyWithImpl<_RequestReponsableSecteur>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestReponsableSecteurToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestReponsableSecteur'))
    ..add(DiagnosticsProperty('secteurResponsableName', secteurResponsableName))..add(DiagnosticsProperty('secteurCode', secteurCode))..add(DiagnosticsProperty('dateCreated', dateCreated))..add(DiagnosticsProperty('secteurName', secteurName))..add(DiagnosticsProperty('contactResponsable', contactResponsable))..add(DiagnosticsProperty('emailResponsable', emailResponsable))..add(DiagnosticsProperty('adresse', adresse))..add(DiagnosticsProperty('secteurId', secteurId))..add(DiagnosticsProperty('zoneId', zoneId))..add(DiagnosticsProperty('zoneCode', zoneCode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestReponsableSecteur&&(identical(other.secteurResponsableName, secteurResponsableName) || other.secteurResponsableName == secteurResponsableName)&&(identical(other.secteurCode, secteurCode) || other.secteurCode == secteurCode)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.secteurName, secteurName) || other.secteurName == secteurName)&&(identical(other.contactResponsable, contactResponsable) || other.contactResponsable == contactResponsable)&&(identical(other.emailResponsable, emailResponsable) || other.emailResponsable == emailResponsable)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.secteurId, secteurId) || other.secteurId == secteurId)&&(identical(other.zoneId, zoneId) || other.zoneId == zoneId)&&(identical(other.zoneCode, zoneCode) || other.zoneCode == zoneCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,secteurResponsableName,secteurCode,dateCreated,secteurName,contactResponsable,emailResponsable,adresse,secteurId,zoneId,zoneCode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestReponsableSecteur(secteurResponsableName: $secteurResponsableName, secteurCode: $secteurCode, dateCreated: $dateCreated, secteurName: $secteurName, contactResponsable: $contactResponsable, emailResponsable: $emailResponsable, adresse: $adresse, secteurId: $secteurId, zoneId: $zoneId, zoneCode: $zoneCode)';
}


}

/// @nodoc
abstract mixin class _$RequestReponsableSecteurCopyWith<$Res> implements $RequestReponsableSecteurCopyWith<$Res> {
  factory _$RequestReponsableSecteurCopyWith(_RequestReponsableSecteur value, $Res Function(_RequestReponsableSecteur) _then) = __$RequestReponsableSecteurCopyWithImpl;
@override @useResult
$Res call({
 String? secteurResponsableName, String? secteurCode, String? dateCreated, String? secteurName, String? contactResponsable, String? emailResponsable, String? adresse, String? secteurId, String? zoneId, String? zoneCode
});




}
/// @nodoc
class __$RequestReponsableSecteurCopyWithImpl<$Res>
    implements _$RequestReponsableSecteurCopyWith<$Res> {
  __$RequestReponsableSecteurCopyWithImpl(this._self, this._then);

  final _RequestReponsableSecteur _self;
  final $Res Function(_RequestReponsableSecteur) _then;

/// Create a copy of RequestReponsableSecteur
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? secteurResponsableName = freezed,Object? secteurCode = freezed,Object? dateCreated = freezed,Object? secteurName = freezed,Object? contactResponsable = freezed,Object? emailResponsable = freezed,Object? adresse = freezed,Object? secteurId = freezed,Object? zoneId = freezed,Object? zoneCode = freezed,}) {
  return _then(_RequestReponsableSecteur(
secteurResponsableName: freezed == secteurResponsableName ? _self.secteurResponsableName : secteurResponsableName // ignore: cast_nullable_to_non_nullable
as String?,secteurCode: freezed == secteurCode ? _self.secteurCode : secteurCode // ignore: cast_nullable_to_non_nullable
as String?,dateCreated: freezed == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String?,secteurName: freezed == secteurName ? _self.secteurName : secteurName // ignore: cast_nullable_to_non_nullable
as String?,contactResponsable: freezed == contactResponsable ? _self.contactResponsable : contactResponsable // ignore: cast_nullable_to_non_nullable
as String?,emailResponsable: freezed == emailResponsable ? _self.emailResponsable : emailResponsable // ignore: cast_nullable_to_non_nullable
as String?,adresse: freezed == adresse ? _self.adresse : adresse // ignore: cast_nullable_to_non_nullable
as String?,secteurId: freezed == secteurId ? _self.secteurId : secteurId // ignore: cast_nullable_to_non_nullable
as String?,zoneId: freezed == zoneId ? _self.zoneId : zoneId // ignore: cast_nullable_to_non_nullable
as String?,zoneCode: freezed == zoneCode ? _self.zoneCode : zoneCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RequestReponsableZone implements DiagnosticableTreeMixin {

 String? get zoneResponsableName; String? get zoneCode; String? get dateCreated; String? get zoneName; String? get contactResponsable; String? get emailResponsable; String? get adresse; String? get zoneId;
/// Create a copy of RequestReponsableZone
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestReponsableZoneCopyWith<RequestReponsableZone> get copyWith => _$RequestReponsableZoneCopyWithImpl<RequestReponsableZone>(this as RequestReponsableZone, _$identity);

  /// Serializes this RequestReponsableZone to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestReponsableZone'))
    ..add(DiagnosticsProperty('zoneResponsableName', zoneResponsableName))..add(DiagnosticsProperty('zoneCode', zoneCode))..add(DiagnosticsProperty('dateCreated', dateCreated))..add(DiagnosticsProperty('zoneName', zoneName))..add(DiagnosticsProperty('contactResponsable', contactResponsable))..add(DiagnosticsProperty('emailResponsable', emailResponsable))..add(DiagnosticsProperty('adresse', adresse))..add(DiagnosticsProperty('zoneId', zoneId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestReponsableZone&&(identical(other.zoneResponsableName, zoneResponsableName) || other.zoneResponsableName == zoneResponsableName)&&(identical(other.zoneCode, zoneCode) || other.zoneCode == zoneCode)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.zoneName, zoneName) || other.zoneName == zoneName)&&(identical(other.contactResponsable, contactResponsable) || other.contactResponsable == contactResponsable)&&(identical(other.emailResponsable, emailResponsable) || other.emailResponsable == emailResponsable)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.zoneId, zoneId) || other.zoneId == zoneId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,zoneResponsableName,zoneCode,dateCreated,zoneName,contactResponsable,emailResponsable,adresse,zoneId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestReponsableZone(zoneResponsableName: $zoneResponsableName, zoneCode: $zoneCode, dateCreated: $dateCreated, zoneName: $zoneName, contactResponsable: $contactResponsable, emailResponsable: $emailResponsable, adresse: $adresse, zoneId: $zoneId)';
}


}

/// @nodoc
abstract mixin class $RequestReponsableZoneCopyWith<$Res>  {
  factory $RequestReponsableZoneCopyWith(RequestReponsableZone value, $Res Function(RequestReponsableZone) _then) = _$RequestReponsableZoneCopyWithImpl;
@useResult
$Res call({
 String? zoneResponsableName, String? zoneCode, String? dateCreated, String? zoneName, String? contactResponsable, String? emailResponsable, String? adresse, String? zoneId
});




}
/// @nodoc
class _$RequestReponsableZoneCopyWithImpl<$Res>
    implements $RequestReponsableZoneCopyWith<$Res> {
  _$RequestReponsableZoneCopyWithImpl(this._self, this._then);

  final RequestReponsableZone _self;
  final $Res Function(RequestReponsableZone) _then;

/// Create a copy of RequestReponsableZone
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? zoneResponsableName = freezed,Object? zoneCode = freezed,Object? dateCreated = freezed,Object? zoneName = freezed,Object? contactResponsable = freezed,Object? emailResponsable = freezed,Object? adresse = freezed,Object? zoneId = freezed,}) {
  return _then(_self.copyWith(
zoneResponsableName: freezed == zoneResponsableName ? _self.zoneResponsableName : zoneResponsableName // ignore: cast_nullable_to_non_nullable
as String?,zoneCode: freezed == zoneCode ? _self.zoneCode : zoneCode // ignore: cast_nullable_to_non_nullable
as String?,dateCreated: freezed == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String?,zoneName: freezed == zoneName ? _self.zoneName : zoneName // ignore: cast_nullable_to_non_nullable
as String?,contactResponsable: freezed == contactResponsable ? _self.contactResponsable : contactResponsable // ignore: cast_nullable_to_non_nullable
as String?,emailResponsable: freezed == emailResponsable ? _self.emailResponsable : emailResponsable // ignore: cast_nullable_to_non_nullable
as String?,adresse: freezed == adresse ? _self.adresse : adresse // ignore: cast_nullable_to_non_nullable
as String?,zoneId: freezed == zoneId ? _self.zoneId : zoneId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestReponsableZone].
extension RequestReponsableZonePatterns on RequestReponsableZone {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestReponsableZone value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestReponsableZone() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestReponsableZone value)  $default,){
final _that = this;
switch (_that) {
case _RequestReponsableZone():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestReponsableZone value)?  $default,){
final _that = this;
switch (_that) {
case _RequestReponsableZone() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? zoneResponsableName,  String? zoneCode,  String? dateCreated,  String? zoneName,  String? contactResponsable,  String? emailResponsable,  String? adresse,  String? zoneId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestReponsableZone() when $default != null:
return $default(_that.zoneResponsableName,_that.zoneCode,_that.dateCreated,_that.zoneName,_that.contactResponsable,_that.emailResponsable,_that.adresse,_that.zoneId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? zoneResponsableName,  String? zoneCode,  String? dateCreated,  String? zoneName,  String? contactResponsable,  String? emailResponsable,  String? adresse,  String? zoneId)  $default,) {final _that = this;
switch (_that) {
case _RequestReponsableZone():
return $default(_that.zoneResponsableName,_that.zoneCode,_that.dateCreated,_that.zoneName,_that.contactResponsable,_that.emailResponsable,_that.adresse,_that.zoneId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? zoneResponsableName,  String? zoneCode,  String? dateCreated,  String? zoneName,  String? contactResponsable,  String? emailResponsable,  String? adresse,  String? zoneId)?  $default,) {final _that = this;
switch (_that) {
case _RequestReponsableZone() when $default != null:
return $default(_that.zoneResponsableName,_that.zoneCode,_that.dateCreated,_that.zoneName,_that.contactResponsable,_that.emailResponsable,_that.adresse,_that.zoneId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestReponsableZone with DiagnosticableTreeMixin implements RequestReponsableZone {
   _RequestReponsableZone({this.zoneResponsableName, this.zoneCode, this.dateCreated, this.zoneName, this.contactResponsable, this.emailResponsable, this.adresse, this.zoneId});
  factory _RequestReponsableZone.fromJson(Map<String, dynamic> json) => _$RequestReponsableZoneFromJson(json);

@override final  String? zoneResponsableName;
@override final  String? zoneCode;
@override final  String? dateCreated;
@override final  String? zoneName;
@override final  String? contactResponsable;
@override final  String? emailResponsable;
@override final  String? adresse;
@override final  String? zoneId;

/// Create a copy of RequestReponsableZone
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestReponsableZoneCopyWith<_RequestReponsableZone> get copyWith => __$RequestReponsableZoneCopyWithImpl<_RequestReponsableZone>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestReponsableZoneToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestReponsableZone'))
    ..add(DiagnosticsProperty('zoneResponsableName', zoneResponsableName))..add(DiagnosticsProperty('zoneCode', zoneCode))..add(DiagnosticsProperty('dateCreated', dateCreated))..add(DiagnosticsProperty('zoneName', zoneName))..add(DiagnosticsProperty('contactResponsable', contactResponsable))..add(DiagnosticsProperty('emailResponsable', emailResponsable))..add(DiagnosticsProperty('adresse', adresse))..add(DiagnosticsProperty('zoneId', zoneId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestReponsableZone&&(identical(other.zoneResponsableName, zoneResponsableName) || other.zoneResponsableName == zoneResponsableName)&&(identical(other.zoneCode, zoneCode) || other.zoneCode == zoneCode)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.zoneName, zoneName) || other.zoneName == zoneName)&&(identical(other.contactResponsable, contactResponsable) || other.contactResponsable == contactResponsable)&&(identical(other.emailResponsable, emailResponsable) || other.emailResponsable == emailResponsable)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.zoneId, zoneId) || other.zoneId == zoneId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,zoneResponsableName,zoneCode,dateCreated,zoneName,contactResponsable,emailResponsable,adresse,zoneId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestReponsableZone(zoneResponsableName: $zoneResponsableName, zoneCode: $zoneCode, dateCreated: $dateCreated, zoneName: $zoneName, contactResponsable: $contactResponsable, emailResponsable: $emailResponsable, adresse: $adresse, zoneId: $zoneId)';
}


}

/// @nodoc
abstract mixin class _$RequestReponsableZoneCopyWith<$Res> implements $RequestReponsableZoneCopyWith<$Res> {
  factory _$RequestReponsableZoneCopyWith(_RequestReponsableZone value, $Res Function(_RequestReponsableZone) _then) = __$RequestReponsableZoneCopyWithImpl;
@override @useResult
$Res call({
 String? zoneResponsableName, String? zoneCode, String? dateCreated, String? zoneName, String? contactResponsable, String? emailResponsable, String? adresse, String? zoneId
});




}
/// @nodoc
class __$RequestReponsableZoneCopyWithImpl<$Res>
    implements _$RequestReponsableZoneCopyWith<$Res> {
  __$RequestReponsableZoneCopyWithImpl(this._self, this._then);

  final _RequestReponsableZone _self;
  final $Res Function(_RequestReponsableZone) _then;

/// Create a copy of RequestReponsableZone
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? zoneResponsableName = freezed,Object? zoneCode = freezed,Object? dateCreated = freezed,Object? zoneName = freezed,Object? contactResponsable = freezed,Object? emailResponsable = freezed,Object? adresse = freezed,Object? zoneId = freezed,}) {
  return _then(_RequestReponsableZone(
zoneResponsableName: freezed == zoneResponsableName ? _self.zoneResponsableName : zoneResponsableName // ignore: cast_nullable_to_non_nullable
as String?,zoneCode: freezed == zoneCode ? _self.zoneCode : zoneCode // ignore: cast_nullable_to_non_nullable
as String?,dateCreated: freezed == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String?,zoneName: freezed == zoneName ? _self.zoneName : zoneName // ignore: cast_nullable_to_non_nullable
as String?,contactResponsable: freezed == contactResponsable ? _self.contactResponsable : contactResponsable // ignore: cast_nullable_to_non_nullable
as String?,emailResponsable: freezed == emailResponsable ? _self.emailResponsable : emailResponsable // ignore: cast_nullable_to_non_nullable
as String?,adresse: freezed == adresse ? _self.adresse : adresse // ignore: cast_nullable_to_non_nullable
as String?,zoneId: freezed == zoneId ? _self.zoneId : zoneId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RequestAuthenProfileUpdateZone implements DiagnosticableTreeMixin {

 String get secteurId;
/// Create a copy of RequestAuthenProfileUpdateZone
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestAuthenProfileUpdateZoneCopyWith<RequestAuthenProfileUpdateZone> get copyWith => _$RequestAuthenProfileUpdateZoneCopyWithImpl<RequestAuthenProfileUpdateZone>(this as RequestAuthenProfileUpdateZone, _$identity);

  /// Serializes this RequestAuthenProfileUpdateZone to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestAuthenProfileUpdateZone'))
    ..add(DiagnosticsProperty('secteurId', secteurId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestAuthenProfileUpdateZone&&(identical(other.secteurId, secteurId) || other.secteurId == secteurId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,secteurId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestAuthenProfileUpdateZone(secteurId: $secteurId)';
}


}

/// @nodoc
abstract mixin class $RequestAuthenProfileUpdateZoneCopyWith<$Res>  {
  factory $RequestAuthenProfileUpdateZoneCopyWith(RequestAuthenProfileUpdateZone value, $Res Function(RequestAuthenProfileUpdateZone) _then) = _$RequestAuthenProfileUpdateZoneCopyWithImpl;
@useResult
$Res call({
 String secteurId
});




}
/// @nodoc
class _$RequestAuthenProfileUpdateZoneCopyWithImpl<$Res>
    implements $RequestAuthenProfileUpdateZoneCopyWith<$Res> {
  _$RequestAuthenProfileUpdateZoneCopyWithImpl(this._self, this._then);

  final RequestAuthenProfileUpdateZone _self;
  final $Res Function(RequestAuthenProfileUpdateZone) _then;

/// Create a copy of RequestAuthenProfileUpdateZone
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? secteurId = null,}) {
  return _then(_self.copyWith(
secteurId: null == secteurId ? _self.secteurId : secteurId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestAuthenProfileUpdateZone].
extension RequestAuthenProfileUpdateZonePatterns on RequestAuthenProfileUpdateZone {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestAuthenProfileUpdateZone value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestAuthenProfileUpdateZone() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestAuthenProfileUpdateZone value)  $default,){
final _that = this;
switch (_that) {
case _RequestAuthenProfileUpdateZone():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestAuthenProfileUpdateZone value)?  $default,){
final _that = this;
switch (_that) {
case _RequestAuthenProfileUpdateZone() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String secteurId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestAuthenProfileUpdateZone() when $default != null:
return $default(_that.secteurId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String secteurId)  $default,) {final _that = this;
switch (_that) {
case _RequestAuthenProfileUpdateZone():
return $default(_that.secteurId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String secteurId)?  $default,) {final _that = this;
switch (_that) {
case _RequestAuthenProfileUpdateZone() when $default != null:
return $default(_that.secteurId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestAuthenProfileUpdateZone with DiagnosticableTreeMixin implements RequestAuthenProfileUpdateZone {
   _RequestAuthenProfileUpdateZone({required this.secteurId});
  factory _RequestAuthenProfileUpdateZone.fromJson(Map<String, dynamic> json) => _$RequestAuthenProfileUpdateZoneFromJson(json);

@override final  String secteurId;

/// Create a copy of RequestAuthenProfileUpdateZone
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestAuthenProfileUpdateZoneCopyWith<_RequestAuthenProfileUpdateZone> get copyWith => __$RequestAuthenProfileUpdateZoneCopyWithImpl<_RequestAuthenProfileUpdateZone>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestAuthenProfileUpdateZoneToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestAuthenProfileUpdateZone'))
    ..add(DiagnosticsProperty('secteurId', secteurId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestAuthenProfileUpdateZone&&(identical(other.secteurId, secteurId) || other.secteurId == secteurId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,secteurId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestAuthenProfileUpdateZone(secteurId: $secteurId)';
}


}

/// @nodoc
abstract mixin class _$RequestAuthenProfileUpdateZoneCopyWith<$Res> implements $RequestAuthenProfileUpdateZoneCopyWith<$Res> {
  factory _$RequestAuthenProfileUpdateZoneCopyWith(_RequestAuthenProfileUpdateZone value, $Res Function(_RequestAuthenProfileUpdateZone) _then) = __$RequestAuthenProfileUpdateZoneCopyWithImpl;
@override @useResult
$Res call({
 String secteurId
});




}
/// @nodoc
class __$RequestAuthenProfileUpdateZoneCopyWithImpl<$Res>
    implements _$RequestAuthenProfileUpdateZoneCopyWith<$Res> {
  __$RequestAuthenProfileUpdateZoneCopyWithImpl(this._self, this._then);

  final _RequestAuthenProfileUpdateZone _self;
  final $Res Function(_RequestAuthenProfileUpdateZone) _then;

/// Create a copy of RequestAuthenProfileUpdateZone
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? secteurId = null,}) {
  return _then(_RequestAuthenProfileUpdateZone(
secteurId: null == secteurId ? _self.secteurId : secteurId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RequestRapportCelluleAdministration implements DiagnosticableTreeMixin {

 String get codeZone; String get fullNameRespoZone; String get contactRespoZone; String get codeSecteur; String get fullNameRespoSecteur; String get contactRespoSecteur; String get codeCellule; String get fullNameRespoCellule; String get contactRespoCellule; String get jourCellule; String get offrande; String get nombreBaptiser; String get nombreNonBaptiser; List<Map<String, dynamic>> get discipleCellule; String get id; String get formAdministrationIsSubmit; String get formAdministrationSubmitDate;
/// Create a copy of RequestRapportCelluleAdministration
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestRapportCelluleAdministrationCopyWith<RequestRapportCelluleAdministration> get copyWith => _$RequestRapportCelluleAdministrationCopyWithImpl<RequestRapportCelluleAdministration>(this as RequestRapportCelluleAdministration, _$identity);

  /// Serializes this RequestRapportCelluleAdministration to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestRapportCelluleAdministration'))
    ..add(DiagnosticsProperty('codeZone', codeZone))..add(DiagnosticsProperty('fullNameRespoZone', fullNameRespoZone))..add(DiagnosticsProperty('contactRespoZone', contactRespoZone))..add(DiagnosticsProperty('codeSecteur', codeSecteur))..add(DiagnosticsProperty('fullNameRespoSecteur', fullNameRespoSecteur))..add(DiagnosticsProperty('contactRespoSecteur', contactRespoSecteur))..add(DiagnosticsProperty('codeCellule', codeCellule))..add(DiagnosticsProperty('fullNameRespoCellule', fullNameRespoCellule))..add(DiagnosticsProperty('contactRespoCellule', contactRespoCellule))..add(DiagnosticsProperty('jourCellule', jourCellule))..add(DiagnosticsProperty('offrande', offrande))..add(DiagnosticsProperty('nombreBaptiser', nombreBaptiser))..add(DiagnosticsProperty('nombreNonBaptiser', nombreNonBaptiser))..add(DiagnosticsProperty('discipleCellule', discipleCellule))..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('formAdministrationIsSubmit', formAdministrationIsSubmit))..add(DiagnosticsProperty('formAdministrationSubmitDate', formAdministrationSubmitDate));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestRapportCelluleAdministration&&(identical(other.codeZone, codeZone) || other.codeZone == codeZone)&&(identical(other.fullNameRespoZone, fullNameRespoZone) || other.fullNameRespoZone == fullNameRespoZone)&&(identical(other.contactRespoZone, contactRespoZone) || other.contactRespoZone == contactRespoZone)&&(identical(other.codeSecteur, codeSecteur) || other.codeSecteur == codeSecteur)&&(identical(other.fullNameRespoSecteur, fullNameRespoSecteur) || other.fullNameRespoSecteur == fullNameRespoSecteur)&&(identical(other.contactRespoSecteur, contactRespoSecteur) || other.contactRespoSecteur == contactRespoSecteur)&&(identical(other.codeCellule, codeCellule) || other.codeCellule == codeCellule)&&(identical(other.fullNameRespoCellule, fullNameRespoCellule) || other.fullNameRespoCellule == fullNameRespoCellule)&&(identical(other.contactRespoCellule, contactRespoCellule) || other.contactRespoCellule == contactRespoCellule)&&(identical(other.jourCellule, jourCellule) || other.jourCellule == jourCellule)&&(identical(other.offrande, offrande) || other.offrande == offrande)&&(identical(other.nombreBaptiser, nombreBaptiser) || other.nombreBaptiser == nombreBaptiser)&&(identical(other.nombreNonBaptiser, nombreNonBaptiser) || other.nombreNonBaptiser == nombreNonBaptiser)&&const DeepCollectionEquality().equals(other.discipleCellule, discipleCellule)&&(identical(other.id, id) || other.id == id)&&(identical(other.formAdministrationIsSubmit, formAdministrationIsSubmit) || other.formAdministrationIsSubmit == formAdministrationIsSubmit)&&(identical(other.formAdministrationSubmitDate, formAdministrationSubmitDate) || other.formAdministrationSubmitDate == formAdministrationSubmitDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,codeZone,fullNameRespoZone,contactRespoZone,codeSecteur,fullNameRespoSecteur,contactRespoSecteur,codeCellule,fullNameRespoCellule,contactRespoCellule,jourCellule,offrande,nombreBaptiser,nombreNonBaptiser,const DeepCollectionEquality().hash(discipleCellule),id,formAdministrationIsSubmit,formAdministrationSubmitDate);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestRapportCelluleAdministration(codeZone: $codeZone, fullNameRespoZone: $fullNameRespoZone, contactRespoZone: $contactRespoZone, codeSecteur: $codeSecteur, fullNameRespoSecteur: $fullNameRespoSecteur, contactRespoSecteur: $contactRespoSecteur, codeCellule: $codeCellule, fullNameRespoCellule: $fullNameRespoCellule, contactRespoCellule: $contactRespoCellule, jourCellule: $jourCellule, offrande: $offrande, nombreBaptiser: $nombreBaptiser, nombreNonBaptiser: $nombreNonBaptiser, discipleCellule: $discipleCellule, id: $id, formAdministrationIsSubmit: $formAdministrationIsSubmit, formAdministrationSubmitDate: $formAdministrationSubmitDate)';
}


}

/// @nodoc
abstract mixin class $RequestRapportCelluleAdministrationCopyWith<$Res>  {
  factory $RequestRapportCelluleAdministrationCopyWith(RequestRapportCelluleAdministration value, $Res Function(RequestRapportCelluleAdministration) _then) = _$RequestRapportCelluleAdministrationCopyWithImpl;
@useResult
$Res call({
 String codeZone, String fullNameRespoZone, String contactRespoZone, String codeSecteur, String fullNameRespoSecteur, String contactRespoSecteur, String codeCellule, String fullNameRespoCellule, String contactRespoCellule, String jourCellule, String offrande, String nombreBaptiser, String nombreNonBaptiser, List<Map<String, dynamic>> discipleCellule, String id, String formAdministrationIsSubmit, String formAdministrationSubmitDate
});




}
/// @nodoc
class _$RequestRapportCelluleAdministrationCopyWithImpl<$Res>
    implements $RequestRapportCelluleAdministrationCopyWith<$Res> {
  _$RequestRapportCelluleAdministrationCopyWithImpl(this._self, this._then);

  final RequestRapportCelluleAdministration _self;
  final $Res Function(RequestRapportCelluleAdministration) _then;

/// Create a copy of RequestRapportCelluleAdministration
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? codeZone = null,Object? fullNameRespoZone = null,Object? contactRespoZone = null,Object? codeSecteur = null,Object? fullNameRespoSecteur = null,Object? contactRespoSecteur = null,Object? codeCellule = null,Object? fullNameRespoCellule = null,Object? contactRespoCellule = null,Object? jourCellule = null,Object? offrande = null,Object? nombreBaptiser = null,Object? nombreNonBaptiser = null,Object? discipleCellule = null,Object? id = null,Object? formAdministrationIsSubmit = null,Object? formAdministrationSubmitDate = null,}) {
  return _then(_self.copyWith(
codeZone: null == codeZone ? _self.codeZone : codeZone // ignore: cast_nullable_to_non_nullable
as String,fullNameRespoZone: null == fullNameRespoZone ? _self.fullNameRespoZone : fullNameRespoZone // ignore: cast_nullable_to_non_nullable
as String,contactRespoZone: null == contactRespoZone ? _self.contactRespoZone : contactRespoZone // ignore: cast_nullable_to_non_nullable
as String,codeSecteur: null == codeSecteur ? _self.codeSecteur : codeSecteur // ignore: cast_nullable_to_non_nullable
as String,fullNameRespoSecteur: null == fullNameRespoSecteur ? _self.fullNameRespoSecteur : fullNameRespoSecteur // ignore: cast_nullable_to_non_nullable
as String,contactRespoSecteur: null == contactRespoSecteur ? _self.contactRespoSecteur : contactRespoSecteur // ignore: cast_nullable_to_non_nullable
as String,codeCellule: null == codeCellule ? _self.codeCellule : codeCellule // ignore: cast_nullable_to_non_nullable
as String,fullNameRespoCellule: null == fullNameRespoCellule ? _self.fullNameRespoCellule : fullNameRespoCellule // ignore: cast_nullable_to_non_nullable
as String,contactRespoCellule: null == contactRespoCellule ? _self.contactRespoCellule : contactRespoCellule // ignore: cast_nullable_to_non_nullable
as String,jourCellule: null == jourCellule ? _self.jourCellule : jourCellule // ignore: cast_nullable_to_non_nullable
as String,offrande: null == offrande ? _self.offrande : offrande // ignore: cast_nullable_to_non_nullable
as String,nombreBaptiser: null == nombreBaptiser ? _self.nombreBaptiser : nombreBaptiser // ignore: cast_nullable_to_non_nullable
as String,nombreNonBaptiser: null == nombreNonBaptiser ? _self.nombreNonBaptiser : nombreNonBaptiser // ignore: cast_nullable_to_non_nullable
as String,discipleCellule: null == discipleCellule ? _self.discipleCellule : discipleCellule // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,formAdministrationIsSubmit: null == formAdministrationIsSubmit ? _self.formAdministrationIsSubmit : formAdministrationIsSubmit // ignore: cast_nullable_to_non_nullable
as String,formAdministrationSubmitDate: null == formAdministrationSubmitDate ? _self.formAdministrationSubmitDate : formAdministrationSubmitDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestRapportCelluleAdministration].
extension RequestRapportCelluleAdministrationPatterns on RequestRapportCelluleAdministration {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestRapportCelluleAdministration value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestRapportCelluleAdministration() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestRapportCelluleAdministration value)  $default,){
final _that = this;
switch (_that) {
case _RequestRapportCelluleAdministration():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestRapportCelluleAdministration value)?  $default,){
final _that = this;
switch (_that) {
case _RequestRapportCelluleAdministration() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String codeZone,  String fullNameRespoZone,  String contactRespoZone,  String codeSecteur,  String fullNameRespoSecteur,  String contactRespoSecteur,  String codeCellule,  String fullNameRespoCellule,  String contactRespoCellule,  String jourCellule,  String offrande,  String nombreBaptiser,  String nombreNonBaptiser,  List<Map<String, dynamic>> discipleCellule,  String id,  String formAdministrationIsSubmit,  String formAdministrationSubmitDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestRapportCelluleAdministration() when $default != null:
return $default(_that.codeZone,_that.fullNameRespoZone,_that.contactRespoZone,_that.codeSecteur,_that.fullNameRespoSecteur,_that.contactRespoSecteur,_that.codeCellule,_that.fullNameRespoCellule,_that.contactRespoCellule,_that.jourCellule,_that.offrande,_that.nombreBaptiser,_that.nombreNonBaptiser,_that.discipleCellule,_that.id,_that.formAdministrationIsSubmit,_that.formAdministrationSubmitDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String codeZone,  String fullNameRespoZone,  String contactRespoZone,  String codeSecteur,  String fullNameRespoSecteur,  String contactRespoSecteur,  String codeCellule,  String fullNameRespoCellule,  String contactRespoCellule,  String jourCellule,  String offrande,  String nombreBaptiser,  String nombreNonBaptiser,  List<Map<String, dynamic>> discipleCellule,  String id,  String formAdministrationIsSubmit,  String formAdministrationSubmitDate)  $default,) {final _that = this;
switch (_that) {
case _RequestRapportCelluleAdministration():
return $default(_that.codeZone,_that.fullNameRespoZone,_that.contactRespoZone,_that.codeSecteur,_that.fullNameRespoSecteur,_that.contactRespoSecteur,_that.codeCellule,_that.fullNameRespoCellule,_that.contactRespoCellule,_that.jourCellule,_that.offrande,_that.nombreBaptiser,_that.nombreNonBaptiser,_that.discipleCellule,_that.id,_that.formAdministrationIsSubmit,_that.formAdministrationSubmitDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String codeZone,  String fullNameRespoZone,  String contactRespoZone,  String codeSecteur,  String fullNameRespoSecteur,  String contactRespoSecteur,  String codeCellule,  String fullNameRespoCellule,  String contactRespoCellule,  String jourCellule,  String offrande,  String nombreBaptiser,  String nombreNonBaptiser,  List<Map<String, dynamic>> discipleCellule,  String id,  String formAdministrationIsSubmit,  String formAdministrationSubmitDate)?  $default,) {final _that = this;
switch (_that) {
case _RequestRapportCelluleAdministration() when $default != null:
return $default(_that.codeZone,_that.fullNameRespoZone,_that.contactRespoZone,_that.codeSecteur,_that.fullNameRespoSecteur,_that.contactRespoSecteur,_that.codeCellule,_that.fullNameRespoCellule,_that.contactRespoCellule,_that.jourCellule,_that.offrande,_that.nombreBaptiser,_that.nombreNonBaptiser,_that.discipleCellule,_that.id,_that.formAdministrationIsSubmit,_that.formAdministrationSubmitDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestRapportCelluleAdministration with DiagnosticableTreeMixin implements RequestRapportCelluleAdministration {
   _RequestRapportCelluleAdministration({required this.codeZone, required this.fullNameRespoZone, required this.contactRespoZone, required this.codeSecteur, required this.fullNameRespoSecteur, required this.contactRespoSecteur, required this.codeCellule, required this.fullNameRespoCellule, required this.contactRespoCellule, required this.jourCellule, required this.offrande, required this.nombreBaptiser, required this.nombreNonBaptiser, required final  List<Map<String, dynamic>> discipleCellule, required this.id, required this.formAdministrationIsSubmit, required this.formAdministrationSubmitDate}): _discipleCellule = discipleCellule;
  factory _RequestRapportCelluleAdministration.fromJson(Map<String, dynamic> json) => _$RequestRapportCelluleAdministrationFromJson(json);

@override final  String codeZone;
@override final  String fullNameRespoZone;
@override final  String contactRespoZone;
@override final  String codeSecteur;
@override final  String fullNameRespoSecteur;
@override final  String contactRespoSecteur;
@override final  String codeCellule;
@override final  String fullNameRespoCellule;
@override final  String contactRespoCellule;
@override final  String jourCellule;
@override final  String offrande;
@override final  String nombreBaptiser;
@override final  String nombreNonBaptiser;
 final  List<Map<String, dynamic>> _discipleCellule;
@override List<Map<String, dynamic>> get discipleCellule {
  if (_discipleCellule is EqualUnmodifiableListView) return _discipleCellule;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_discipleCellule);
}

@override final  String id;
@override final  String formAdministrationIsSubmit;
@override final  String formAdministrationSubmitDate;

/// Create a copy of RequestRapportCelluleAdministration
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestRapportCelluleAdministrationCopyWith<_RequestRapportCelluleAdministration> get copyWith => __$RequestRapportCelluleAdministrationCopyWithImpl<_RequestRapportCelluleAdministration>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestRapportCelluleAdministrationToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestRapportCelluleAdministration'))
    ..add(DiagnosticsProperty('codeZone', codeZone))..add(DiagnosticsProperty('fullNameRespoZone', fullNameRespoZone))..add(DiagnosticsProperty('contactRespoZone', contactRespoZone))..add(DiagnosticsProperty('codeSecteur', codeSecteur))..add(DiagnosticsProperty('fullNameRespoSecteur', fullNameRespoSecteur))..add(DiagnosticsProperty('contactRespoSecteur', contactRespoSecteur))..add(DiagnosticsProperty('codeCellule', codeCellule))..add(DiagnosticsProperty('fullNameRespoCellule', fullNameRespoCellule))..add(DiagnosticsProperty('contactRespoCellule', contactRespoCellule))..add(DiagnosticsProperty('jourCellule', jourCellule))..add(DiagnosticsProperty('offrande', offrande))..add(DiagnosticsProperty('nombreBaptiser', nombreBaptiser))..add(DiagnosticsProperty('nombreNonBaptiser', nombreNonBaptiser))..add(DiagnosticsProperty('discipleCellule', discipleCellule))..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('formAdministrationIsSubmit', formAdministrationIsSubmit))..add(DiagnosticsProperty('formAdministrationSubmitDate', formAdministrationSubmitDate));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestRapportCelluleAdministration&&(identical(other.codeZone, codeZone) || other.codeZone == codeZone)&&(identical(other.fullNameRespoZone, fullNameRespoZone) || other.fullNameRespoZone == fullNameRespoZone)&&(identical(other.contactRespoZone, contactRespoZone) || other.contactRespoZone == contactRespoZone)&&(identical(other.codeSecteur, codeSecteur) || other.codeSecteur == codeSecteur)&&(identical(other.fullNameRespoSecteur, fullNameRespoSecteur) || other.fullNameRespoSecteur == fullNameRespoSecteur)&&(identical(other.contactRespoSecteur, contactRespoSecteur) || other.contactRespoSecteur == contactRespoSecteur)&&(identical(other.codeCellule, codeCellule) || other.codeCellule == codeCellule)&&(identical(other.fullNameRespoCellule, fullNameRespoCellule) || other.fullNameRespoCellule == fullNameRespoCellule)&&(identical(other.contactRespoCellule, contactRespoCellule) || other.contactRespoCellule == contactRespoCellule)&&(identical(other.jourCellule, jourCellule) || other.jourCellule == jourCellule)&&(identical(other.offrande, offrande) || other.offrande == offrande)&&(identical(other.nombreBaptiser, nombreBaptiser) || other.nombreBaptiser == nombreBaptiser)&&(identical(other.nombreNonBaptiser, nombreNonBaptiser) || other.nombreNonBaptiser == nombreNonBaptiser)&&const DeepCollectionEquality().equals(other._discipleCellule, _discipleCellule)&&(identical(other.id, id) || other.id == id)&&(identical(other.formAdministrationIsSubmit, formAdministrationIsSubmit) || other.formAdministrationIsSubmit == formAdministrationIsSubmit)&&(identical(other.formAdministrationSubmitDate, formAdministrationSubmitDate) || other.formAdministrationSubmitDate == formAdministrationSubmitDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,codeZone,fullNameRespoZone,contactRespoZone,codeSecteur,fullNameRespoSecteur,contactRespoSecteur,codeCellule,fullNameRespoCellule,contactRespoCellule,jourCellule,offrande,nombreBaptiser,nombreNonBaptiser,const DeepCollectionEquality().hash(_discipleCellule),id,formAdministrationIsSubmit,formAdministrationSubmitDate);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestRapportCelluleAdministration(codeZone: $codeZone, fullNameRespoZone: $fullNameRespoZone, contactRespoZone: $contactRespoZone, codeSecteur: $codeSecteur, fullNameRespoSecteur: $fullNameRespoSecteur, contactRespoSecteur: $contactRespoSecteur, codeCellule: $codeCellule, fullNameRespoCellule: $fullNameRespoCellule, contactRespoCellule: $contactRespoCellule, jourCellule: $jourCellule, offrande: $offrande, nombreBaptiser: $nombreBaptiser, nombreNonBaptiser: $nombreNonBaptiser, discipleCellule: $discipleCellule, id: $id, formAdministrationIsSubmit: $formAdministrationIsSubmit, formAdministrationSubmitDate: $formAdministrationSubmitDate)';
}


}

/// @nodoc
abstract mixin class _$RequestRapportCelluleAdministrationCopyWith<$Res> implements $RequestRapportCelluleAdministrationCopyWith<$Res> {
  factory _$RequestRapportCelluleAdministrationCopyWith(_RequestRapportCelluleAdministration value, $Res Function(_RequestRapportCelluleAdministration) _then) = __$RequestRapportCelluleAdministrationCopyWithImpl;
@override @useResult
$Res call({
 String codeZone, String fullNameRespoZone, String contactRespoZone, String codeSecteur, String fullNameRespoSecteur, String contactRespoSecteur, String codeCellule, String fullNameRespoCellule, String contactRespoCellule, String jourCellule, String offrande, String nombreBaptiser, String nombreNonBaptiser, List<Map<String, dynamic>> discipleCellule, String id, String formAdministrationIsSubmit, String formAdministrationSubmitDate
});




}
/// @nodoc
class __$RequestRapportCelluleAdministrationCopyWithImpl<$Res>
    implements _$RequestRapportCelluleAdministrationCopyWith<$Res> {
  __$RequestRapportCelluleAdministrationCopyWithImpl(this._self, this._then);

  final _RequestRapportCelluleAdministration _self;
  final $Res Function(_RequestRapportCelluleAdministration) _then;

/// Create a copy of RequestRapportCelluleAdministration
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? codeZone = null,Object? fullNameRespoZone = null,Object? contactRespoZone = null,Object? codeSecteur = null,Object? fullNameRespoSecteur = null,Object? contactRespoSecteur = null,Object? codeCellule = null,Object? fullNameRespoCellule = null,Object? contactRespoCellule = null,Object? jourCellule = null,Object? offrande = null,Object? nombreBaptiser = null,Object? nombreNonBaptiser = null,Object? discipleCellule = null,Object? id = null,Object? formAdministrationIsSubmit = null,Object? formAdministrationSubmitDate = null,}) {
  return _then(_RequestRapportCelluleAdministration(
codeZone: null == codeZone ? _self.codeZone : codeZone // ignore: cast_nullable_to_non_nullable
as String,fullNameRespoZone: null == fullNameRespoZone ? _self.fullNameRespoZone : fullNameRespoZone // ignore: cast_nullable_to_non_nullable
as String,contactRespoZone: null == contactRespoZone ? _self.contactRespoZone : contactRespoZone // ignore: cast_nullable_to_non_nullable
as String,codeSecteur: null == codeSecteur ? _self.codeSecteur : codeSecteur // ignore: cast_nullable_to_non_nullable
as String,fullNameRespoSecteur: null == fullNameRespoSecteur ? _self.fullNameRespoSecteur : fullNameRespoSecteur // ignore: cast_nullable_to_non_nullable
as String,contactRespoSecteur: null == contactRespoSecteur ? _self.contactRespoSecteur : contactRespoSecteur // ignore: cast_nullable_to_non_nullable
as String,codeCellule: null == codeCellule ? _self.codeCellule : codeCellule // ignore: cast_nullable_to_non_nullable
as String,fullNameRespoCellule: null == fullNameRespoCellule ? _self.fullNameRespoCellule : fullNameRespoCellule // ignore: cast_nullable_to_non_nullable
as String,contactRespoCellule: null == contactRespoCellule ? _self.contactRespoCellule : contactRespoCellule // ignore: cast_nullable_to_non_nullable
as String,jourCellule: null == jourCellule ? _self.jourCellule : jourCellule // ignore: cast_nullable_to_non_nullable
as String,offrande: null == offrande ? _self.offrande : offrande // ignore: cast_nullable_to_non_nullable
as String,nombreBaptiser: null == nombreBaptiser ? _self.nombreBaptiser : nombreBaptiser // ignore: cast_nullable_to_non_nullable
as String,nombreNonBaptiser: null == nombreNonBaptiser ? _self.nombreNonBaptiser : nombreNonBaptiser // ignore: cast_nullable_to_non_nullable
as String,discipleCellule: null == discipleCellule ? _self._discipleCellule : discipleCellule // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,formAdministrationIsSubmit: null == formAdministrationIsSubmit ? _self.formAdministrationIsSubmit : formAdministrationIsSubmit // ignore: cast_nullable_to_non_nullable
as String,formAdministrationSubmitDate: null == formAdministrationSubmitDate ? _self.formAdministrationSubmitDate : formAdministrationSubmitDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RequestGeneriqueKey<T> implements DiagnosticableTreeMixin {

 T get id;
/// Create a copy of RequestGeneriqueKey
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestGeneriqueKeyCopyWith<T, RequestGeneriqueKey<T>> get copyWith => _$RequestGeneriqueKeyCopyWithImpl<T, RequestGeneriqueKey<T>>(this as RequestGeneriqueKey<T>, _$identity);

  /// Serializes this RequestGeneriqueKey to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestGeneriqueKey<$T>'))
    ..add(DiagnosticsProperty('id', id));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestGeneriqueKey<T>&&const DeepCollectionEquality().equals(other.id, id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(id));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestGeneriqueKey<$T>(id: $id)';
}


}

/// @nodoc
abstract mixin class $RequestGeneriqueKeyCopyWith<T,$Res>  {
  factory $RequestGeneriqueKeyCopyWith(RequestGeneriqueKey<T> value, $Res Function(RequestGeneriqueKey<T>) _then) = _$RequestGeneriqueKeyCopyWithImpl;
@useResult
$Res call({
 T id
});




}
/// @nodoc
class _$RequestGeneriqueKeyCopyWithImpl<T,$Res>
    implements $RequestGeneriqueKeyCopyWith<T, $Res> {
  _$RequestGeneriqueKeyCopyWithImpl(this._self, this._then);

  final RequestGeneriqueKey<T> _self;
  final $Res Function(RequestGeneriqueKey<T>) _then;

/// Create a copy of RequestGeneriqueKey
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as T,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestGeneriqueKey].
extension RequestGeneriqueKeyPatterns<T> on RequestGeneriqueKey<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestGeneriqueKey<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestGeneriqueKey() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestGeneriqueKey<T> value)  $default,){
final _that = this;
switch (_that) {
case _RequestGeneriqueKey():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestGeneriqueKey<T> value)?  $default,){
final _that = this;
switch (_that) {
case _RequestGeneriqueKey() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( T id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestGeneriqueKey() when $default != null:
return $default(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( T id)  $default,) {final _that = this;
switch (_that) {
case _RequestGeneriqueKey():
return $default(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( T id)?  $default,) {final _that = this;
switch (_that) {
case _RequestGeneriqueKey() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _RequestGeneriqueKey<T> with DiagnosticableTreeMixin implements RequestGeneriqueKey<T> {
  const _RequestGeneriqueKey({required this.id});
  factory _RequestGeneriqueKey.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$RequestGeneriqueKeyFromJson(json,fromJsonT);

@override final  T id;

/// Create a copy of RequestGeneriqueKey
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestGeneriqueKeyCopyWith<T, _RequestGeneriqueKey<T>> get copyWith => __$RequestGeneriqueKeyCopyWithImpl<T, _RequestGeneriqueKey<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$RequestGeneriqueKeyToJson<T>(this, toJsonT);
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestGeneriqueKey<$T>'))
    ..add(DiagnosticsProperty('id', id));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestGeneriqueKey<T>&&const DeepCollectionEquality().equals(other.id, id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(id));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestGeneriqueKey<$T>(id: $id)';
}


}

/// @nodoc
abstract mixin class _$RequestGeneriqueKeyCopyWith<T,$Res> implements $RequestGeneriqueKeyCopyWith<T, $Res> {
  factory _$RequestGeneriqueKeyCopyWith(_RequestGeneriqueKey<T> value, $Res Function(_RequestGeneriqueKey<T>) _then) = __$RequestGeneriqueKeyCopyWithImpl;
@override @useResult
$Res call({
 T id
});




}
/// @nodoc
class __$RequestGeneriqueKeyCopyWithImpl<T,$Res>
    implements _$RequestGeneriqueKeyCopyWith<T, $Res> {
  __$RequestGeneriqueKeyCopyWithImpl(this._self, this._then);

  final _RequestGeneriqueKey<T> _self;
  final $Res Function(_RequestGeneriqueKey<T>) _then;

/// Create a copy of RequestGeneriqueKey
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,}) {
  return _then(_RequestGeneriqueKey<T>(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}


/// @nodoc
mixin _$RequestImpliciteConnexion implements DiagnosticableTreeMixin {

 String get deviceId;
/// Create a copy of RequestImpliciteConnexion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestImpliciteConnexionCopyWith<RequestImpliciteConnexion> get copyWith => _$RequestImpliciteConnexionCopyWithImpl<RequestImpliciteConnexion>(this as RequestImpliciteConnexion, _$identity);

  /// Serializes this RequestImpliciteConnexion to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestImpliciteConnexion'))
    ..add(DiagnosticsProperty('deviceId', deviceId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestImpliciteConnexion&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestImpliciteConnexion(deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class $RequestImpliciteConnexionCopyWith<$Res>  {
  factory $RequestImpliciteConnexionCopyWith(RequestImpliciteConnexion value, $Res Function(RequestImpliciteConnexion) _then) = _$RequestImpliciteConnexionCopyWithImpl;
@useResult
$Res call({
 String deviceId
});




}
/// @nodoc
class _$RequestImpliciteConnexionCopyWithImpl<$Res>
    implements $RequestImpliciteConnexionCopyWith<$Res> {
  _$RequestImpliciteConnexionCopyWithImpl(this._self, this._then);

  final RequestImpliciteConnexion _self;
  final $Res Function(RequestImpliciteConnexion) _then;

/// Create a copy of RequestImpliciteConnexion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceId = null,}) {
  return _then(_self.copyWith(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestImpliciteConnexion].
extension RequestImpliciteConnexionPatterns on RequestImpliciteConnexion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestImpliciteConnexion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestImpliciteConnexion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestImpliciteConnexion value)  $default,){
final _that = this;
switch (_that) {
case _RequestImpliciteConnexion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestImpliciteConnexion value)?  $default,){
final _that = this;
switch (_that) {
case _RequestImpliciteConnexion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String deviceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestImpliciteConnexion() when $default != null:
return $default(_that.deviceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String deviceId)  $default,) {final _that = this;
switch (_that) {
case _RequestImpliciteConnexion():
return $default(_that.deviceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String deviceId)?  $default,) {final _that = this;
switch (_that) {
case _RequestImpliciteConnexion() when $default != null:
return $default(_that.deviceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestImpliciteConnexion with DiagnosticableTreeMixin implements RequestImpliciteConnexion {
   _RequestImpliciteConnexion({required this.deviceId});
  factory _RequestImpliciteConnexion.fromJson(Map<String, dynamic> json) => _$RequestImpliciteConnexionFromJson(json);

@override final  String deviceId;

/// Create a copy of RequestImpliciteConnexion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestImpliciteConnexionCopyWith<_RequestImpliciteConnexion> get copyWith => __$RequestImpliciteConnexionCopyWithImpl<_RequestImpliciteConnexion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestImpliciteConnexionToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestImpliciteConnexion'))
    ..add(DiagnosticsProperty('deviceId', deviceId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestImpliciteConnexion&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestImpliciteConnexion(deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class _$RequestImpliciteConnexionCopyWith<$Res> implements $RequestImpliciteConnexionCopyWith<$Res> {
  factory _$RequestImpliciteConnexionCopyWith(_RequestImpliciteConnexion value, $Res Function(_RequestImpliciteConnexion) _then) = __$RequestImpliciteConnexionCopyWithImpl;
@override @useResult
$Res call({
 String deviceId
});




}
/// @nodoc
class __$RequestImpliciteConnexionCopyWithImpl<$Res>
    implements _$RequestImpliciteConnexionCopyWith<$Res> {
  __$RequestImpliciteConnexionCopyWithImpl(this._self, this._then);

  final _RequestImpliciteConnexion _self;
  final $Res Function(_RequestImpliciteConnexion) _then;

/// Create a copy of RequestImpliciteConnexion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = null,}) {
  return _then(_RequestImpliciteConnexion(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RequestItemSection implements DiagnosticableTreeMixin {

 String get name; int get count;
/// Create a copy of RequestItemSection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestItemSectionCopyWith<RequestItemSection> get copyWith => _$RequestItemSectionCopyWithImpl<RequestItemSection>(this as RequestItemSection, _$identity);

  /// Serializes this RequestItemSection to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestItemSection'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('count', count));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestItemSection&&(identical(other.name, name) || other.name == name)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,count);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestItemSection(name: $name, count: $count)';
}


}

/// @nodoc
abstract mixin class $RequestItemSectionCopyWith<$Res>  {
  factory $RequestItemSectionCopyWith(RequestItemSection value, $Res Function(RequestItemSection) _then) = _$RequestItemSectionCopyWithImpl;
@useResult
$Res call({
 String name, int count
});




}
/// @nodoc
class _$RequestItemSectionCopyWithImpl<$Res>
    implements $RequestItemSectionCopyWith<$Res> {
  _$RequestItemSectionCopyWithImpl(this._self, this._then);

  final RequestItemSection _self;
  final $Res Function(RequestItemSection) _then;

/// Create a copy of RequestItemSection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? count = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestItemSection].
extension RequestItemSectionPatterns on RequestItemSection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestItemSection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestItemSection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestItemSection value)  $default,){
final _that = this;
switch (_that) {
case _RequestItemSection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestItemSection value)?  $default,){
final _that = this;
switch (_that) {
case _RequestItemSection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestItemSection() when $default != null:
return $default(_that.name,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int count)  $default,) {final _that = this;
switch (_that) {
case _RequestItemSection():
return $default(_that.name,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int count)?  $default,) {final _that = this;
switch (_that) {
case _RequestItemSection() when $default != null:
return $default(_that.name,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestItemSection with DiagnosticableTreeMixin implements RequestItemSection {
   _RequestItemSection({required this.name, this.count = 0});
  factory _RequestItemSection.fromJson(Map<String, dynamic> json) => _$RequestItemSectionFromJson(json);

@override final  String name;
@override@JsonKey() final  int count;

/// Create a copy of RequestItemSection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestItemSectionCopyWith<_RequestItemSection> get copyWith => __$RequestItemSectionCopyWithImpl<_RequestItemSection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestItemSectionToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestItemSection'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('count', count));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestItemSection&&(identical(other.name, name) || other.name == name)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,count);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestItemSection(name: $name, count: $count)';
}


}

/// @nodoc
abstract mixin class _$RequestItemSectionCopyWith<$Res> implements $RequestItemSectionCopyWith<$Res> {
  factory _$RequestItemSectionCopyWith(_RequestItemSection value, $Res Function(_RequestItemSection) _then) = __$RequestItemSectionCopyWithImpl;
@override @useResult
$Res call({
 String name, int count
});




}
/// @nodoc
class __$RequestItemSectionCopyWithImpl<$Res>
    implements _$RequestItemSectionCopyWith<$Res> {
  __$RequestItemSectionCopyWithImpl(this._self, this._then);

  final _RequestItemSection _self;
  final $Res Function(_RequestItemSection) _then;

/// Create a copy of RequestItemSection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? count = null,}) {
  return _then(_RequestItemSection(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RequestSection implements DiagnosticableTreeMixin {

 String get title; List<RequestItemSection> get items;
/// Create a copy of RequestSection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestSectionCopyWith<RequestSection> get copyWith => _$RequestSectionCopyWithImpl<RequestSection>(this as RequestSection, _$identity);

  /// Serializes this RequestSection to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestSection'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('items', items));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestSection&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(items));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestSection(title: $title, items: $items)';
}


}

/// @nodoc
abstract mixin class $RequestSectionCopyWith<$Res>  {
  factory $RequestSectionCopyWith(RequestSection value, $Res Function(RequestSection) _then) = _$RequestSectionCopyWithImpl;
@useResult
$Res call({
 String title, List<RequestItemSection> items
});




}
/// @nodoc
class _$RequestSectionCopyWithImpl<$Res>
    implements $RequestSectionCopyWith<$Res> {
  _$RequestSectionCopyWithImpl(this._self, this._then);

  final RequestSection _self;
  final $Res Function(RequestSection) _then;

/// Create a copy of RequestSection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? items = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<RequestItemSection>,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestSection].
extension RequestSectionPatterns on RequestSection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestSection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestSection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestSection value)  $default,){
final _that = this;
switch (_that) {
case _RequestSection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestSection value)?  $default,){
final _that = this;
switch (_that) {
case _RequestSection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  List<RequestItemSection> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestSection() when $default != null:
return $default(_that.title,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  List<RequestItemSection> items)  $default,) {final _that = this;
switch (_that) {
case _RequestSection():
return $default(_that.title,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  List<RequestItemSection> items)?  $default,) {final _that = this;
switch (_that) {
case _RequestSection() when $default != null:
return $default(_that.title,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestSection with DiagnosticableTreeMixin implements RequestSection {
   _RequestSection({required this.title, final  List<RequestItemSection> items = const []}): _items = items;
  factory _RequestSection.fromJson(Map<String, dynamic> json) => _$RequestSectionFromJson(json);

@override final  String title;
 final  List<RequestItemSection> _items;
@override@JsonKey() List<RequestItemSection> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of RequestSection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestSectionCopyWith<_RequestSection> get copyWith => __$RequestSectionCopyWithImpl<_RequestSection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestSectionToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestSection'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('items', items));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestSection&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(_items));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestSection(title: $title, items: $items)';
}


}

/// @nodoc
abstract mixin class _$RequestSectionCopyWith<$Res> implements $RequestSectionCopyWith<$Res> {
  factory _$RequestSectionCopyWith(_RequestSection value, $Res Function(_RequestSection) _then) = __$RequestSectionCopyWithImpl;
@override @useResult
$Res call({
 String title, List<RequestItemSection> items
});




}
/// @nodoc
class __$RequestSectionCopyWithImpl<$Res>
    implements _$RequestSectionCopyWith<$Res> {
  __$RequestSectionCopyWithImpl(this._self, this._then);

  final _RequestSection _self;
  final $Res Function(_RequestSection) _then;

/// Create a copy of RequestSection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? items = null,}) {
  return _then(_RequestSection(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<RequestItemSection>,
  ));
}


}


/// @nodoc
mixin _$RequestHumaneSectionAssistance implements DiagnosticableTreeMixin {

 String get title; String get name; int get cout;
/// Create a copy of RequestHumaneSectionAssistance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestHumaneSectionAssistanceCopyWith<RequestHumaneSectionAssistance> get copyWith => _$RequestHumaneSectionAssistanceCopyWithImpl<RequestHumaneSectionAssistance>(this as RequestHumaneSectionAssistance, _$identity);

  /// Serializes this RequestHumaneSectionAssistance to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestHumaneSectionAssistance'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('cout', cout));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestHumaneSectionAssistance&&(identical(other.title, title) || other.title == title)&&(identical(other.name, name) || other.name == name)&&(identical(other.cout, cout) || other.cout == cout));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,name,cout);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestHumaneSectionAssistance(title: $title, name: $name, cout: $cout)';
}


}

/// @nodoc
abstract mixin class $RequestHumaneSectionAssistanceCopyWith<$Res>  {
  factory $RequestHumaneSectionAssistanceCopyWith(RequestHumaneSectionAssistance value, $Res Function(RequestHumaneSectionAssistance) _then) = _$RequestHumaneSectionAssistanceCopyWithImpl;
@useResult
$Res call({
 String title, String name, int cout
});




}
/// @nodoc
class _$RequestHumaneSectionAssistanceCopyWithImpl<$Res>
    implements $RequestHumaneSectionAssistanceCopyWith<$Res> {
  _$RequestHumaneSectionAssistanceCopyWithImpl(this._self, this._then);

  final RequestHumaneSectionAssistance _self;
  final $Res Function(RequestHumaneSectionAssistance) _then;

/// Create a copy of RequestHumaneSectionAssistance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? name = null,Object? cout = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cout: null == cout ? _self.cout : cout // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestHumaneSectionAssistance].
extension RequestHumaneSectionAssistancePatterns on RequestHumaneSectionAssistance {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestHumaneSectionAssistance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestHumaneSectionAssistance() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestHumaneSectionAssistance value)  $default,){
final _that = this;
switch (_that) {
case _RequestHumaneSectionAssistance():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestHumaneSectionAssistance value)?  $default,){
final _that = this;
switch (_that) {
case _RequestHumaneSectionAssistance() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String name,  int cout)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestHumaneSectionAssistance() when $default != null:
return $default(_that.title,_that.name,_that.cout);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String name,  int cout)  $default,) {final _that = this;
switch (_that) {
case _RequestHumaneSectionAssistance():
return $default(_that.title,_that.name,_that.cout);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String name,  int cout)?  $default,) {final _that = this;
switch (_that) {
case _RequestHumaneSectionAssistance() when $default != null:
return $default(_that.title,_that.name,_that.cout);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestHumaneSectionAssistance with DiagnosticableTreeMixin implements RequestHumaneSectionAssistance {
   _RequestHumaneSectionAssistance({this.title = "", this.name = "", this.cout = 0});
  factory _RequestHumaneSectionAssistance.fromJson(Map<String, dynamic> json) => _$RequestHumaneSectionAssistanceFromJson(json);

@override@JsonKey() final  String title;
@override@JsonKey() final  String name;
@override@JsonKey() final  int cout;

/// Create a copy of RequestHumaneSectionAssistance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestHumaneSectionAssistanceCopyWith<_RequestHumaneSectionAssistance> get copyWith => __$RequestHumaneSectionAssistanceCopyWithImpl<_RequestHumaneSectionAssistance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestHumaneSectionAssistanceToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestHumaneSectionAssistance'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('cout', cout));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestHumaneSectionAssistance&&(identical(other.title, title) || other.title == title)&&(identical(other.name, name) || other.name == name)&&(identical(other.cout, cout) || other.cout == cout));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,name,cout);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestHumaneSectionAssistance(title: $title, name: $name, cout: $cout)';
}


}

/// @nodoc
abstract mixin class _$RequestHumaneSectionAssistanceCopyWith<$Res> implements $RequestHumaneSectionAssistanceCopyWith<$Res> {
  factory _$RequestHumaneSectionAssistanceCopyWith(_RequestHumaneSectionAssistance value, $Res Function(_RequestHumaneSectionAssistance) _then) = __$RequestHumaneSectionAssistanceCopyWithImpl;
@override @useResult
$Res call({
 String title, String name, int cout
});




}
/// @nodoc
class __$RequestHumaneSectionAssistanceCopyWithImpl<$Res>
    implements _$RequestHumaneSectionAssistanceCopyWith<$Res> {
  __$RequestHumaneSectionAssistanceCopyWithImpl(this._self, this._then);

  final _RequestHumaneSectionAssistance _self;
  final $Res Function(_RequestHumaneSectionAssistance) _then;

/// Create a copy of RequestHumaneSectionAssistance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? name = null,Object? cout = null,}) {
  return _then(_RequestHumaneSectionAssistance(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cout: null == cout ? _self.cout : cout // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RequestRapportCelluleAssistance implements DiagnosticableTreeMixin {

 String get nombreBaptiser; List<Map<String, dynamic>> get nomBaptiserStat; List<Map<String, dynamic>> get nouveauBaptiserStat; List<Map<String, dynamic>> get inviterStat; List<Map<String, dynamic>> get formationStat; List<Map<String, dynamic>> get sectionVisite; List<Map<String, dynamic>> get sectionActivite; List<Map<String, dynamic>> get sectionOuvrier; List<Map<String, dynamic>> get autres; String get id; String get formAssistanceIsSubmit; String get formAssistanceSubmitDate;
/// Create a copy of RequestRapportCelluleAssistance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestRapportCelluleAssistanceCopyWith<RequestRapportCelluleAssistance> get copyWith => _$RequestRapportCelluleAssistanceCopyWithImpl<RequestRapportCelluleAssistance>(this as RequestRapportCelluleAssistance, _$identity);

  /// Serializes this RequestRapportCelluleAssistance to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestRapportCelluleAssistance'))
    ..add(DiagnosticsProperty('nombreBaptiser', nombreBaptiser))..add(DiagnosticsProperty('nomBaptiserStat', nomBaptiserStat))..add(DiagnosticsProperty('nouveauBaptiserStat', nouveauBaptiserStat))..add(DiagnosticsProperty('inviterStat', inviterStat))..add(DiagnosticsProperty('formationStat', formationStat))..add(DiagnosticsProperty('sectionVisite', sectionVisite))..add(DiagnosticsProperty('sectionActivite', sectionActivite))..add(DiagnosticsProperty('sectionOuvrier', sectionOuvrier))..add(DiagnosticsProperty('autres', autres))..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('formAssistanceIsSubmit', formAssistanceIsSubmit))..add(DiagnosticsProperty('formAssistanceSubmitDate', formAssistanceSubmitDate));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestRapportCelluleAssistance&&(identical(other.nombreBaptiser, nombreBaptiser) || other.nombreBaptiser == nombreBaptiser)&&const DeepCollectionEquality().equals(other.nomBaptiserStat, nomBaptiserStat)&&const DeepCollectionEquality().equals(other.nouveauBaptiserStat, nouveauBaptiserStat)&&const DeepCollectionEquality().equals(other.inviterStat, inviterStat)&&const DeepCollectionEquality().equals(other.formationStat, formationStat)&&const DeepCollectionEquality().equals(other.sectionVisite, sectionVisite)&&const DeepCollectionEquality().equals(other.sectionActivite, sectionActivite)&&const DeepCollectionEquality().equals(other.sectionOuvrier, sectionOuvrier)&&const DeepCollectionEquality().equals(other.autres, autres)&&(identical(other.id, id) || other.id == id)&&(identical(other.formAssistanceIsSubmit, formAssistanceIsSubmit) || other.formAssistanceIsSubmit == formAssistanceIsSubmit)&&(identical(other.formAssistanceSubmitDate, formAssistanceSubmitDate) || other.formAssistanceSubmitDate == formAssistanceSubmitDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nombreBaptiser,const DeepCollectionEquality().hash(nomBaptiserStat),const DeepCollectionEquality().hash(nouveauBaptiserStat),const DeepCollectionEquality().hash(inviterStat),const DeepCollectionEquality().hash(formationStat),const DeepCollectionEquality().hash(sectionVisite),const DeepCollectionEquality().hash(sectionActivite),const DeepCollectionEquality().hash(sectionOuvrier),const DeepCollectionEquality().hash(autres),id,formAssistanceIsSubmit,formAssistanceSubmitDate);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestRapportCelluleAssistance(nombreBaptiser: $nombreBaptiser, nomBaptiserStat: $nomBaptiserStat, nouveauBaptiserStat: $nouveauBaptiserStat, inviterStat: $inviterStat, formationStat: $formationStat, sectionVisite: $sectionVisite, sectionActivite: $sectionActivite, sectionOuvrier: $sectionOuvrier, autres: $autres, id: $id, formAssistanceIsSubmit: $formAssistanceIsSubmit, formAssistanceSubmitDate: $formAssistanceSubmitDate)';
}


}

/// @nodoc
abstract mixin class $RequestRapportCelluleAssistanceCopyWith<$Res>  {
  factory $RequestRapportCelluleAssistanceCopyWith(RequestRapportCelluleAssistance value, $Res Function(RequestRapportCelluleAssistance) _then) = _$RequestRapportCelluleAssistanceCopyWithImpl;
@useResult
$Res call({
 String nombreBaptiser, List<Map<String, dynamic>> nomBaptiserStat, List<Map<String, dynamic>> nouveauBaptiserStat, List<Map<String, dynamic>> inviterStat, List<Map<String, dynamic>> formationStat, List<Map<String, dynamic>> sectionVisite, List<Map<String, dynamic>> sectionActivite, List<Map<String, dynamic>> sectionOuvrier, List<Map<String, dynamic>> autres, String id, String formAssistanceIsSubmit, String formAssistanceSubmitDate
});




}
/// @nodoc
class _$RequestRapportCelluleAssistanceCopyWithImpl<$Res>
    implements $RequestRapportCelluleAssistanceCopyWith<$Res> {
  _$RequestRapportCelluleAssistanceCopyWithImpl(this._self, this._then);

  final RequestRapportCelluleAssistance _self;
  final $Res Function(RequestRapportCelluleAssistance) _then;

/// Create a copy of RequestRapportCelluleAssistance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nombreBaptiser = null,Object? nomBaptiserStat = null,Object? nouveauBaptiserStat = null,Object? inviterStat = null,Object? formationStat = null,Object? sectionVisite = null,Object? sectionActivite = null,Object? sectionOuvrier = null,Object? autres = null,Object? id = null,Object? formAssistanceIsSubmit = null,Object? formAssistanceSubmitDate = null,}) {
  return _then(_self.copyWith(
nombreBaptiser: null == nombreBaptiser ? _self.nombreBaptiser : nombreBaptiser // ignore: cast_nullable_to_non_nullable
as String,nomBaptiserStat: null == nomBaptiserStat ? _self.nomBaptiserStat : nomBaptiserStat // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,nouveauBaptiserStat: null == nouveauBaptiserStat ? _self.nouveauBaptiserStat : nouveauBaptiserStat // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,inviterStat: null == inviterStat ? _self.inviterStat : inviterStat // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,formationStat: null == formationStat ? _self.formationStat : formationStat // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,sectionVisite: null == sectionVisite ? _self.sectionVisite : sectionVisite // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,sectionActivite: null == sectionActivite ? _self.sectionActivite : sectionActivite // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,sectionOuvrier: null == sectionOuvrier ? _self.sectionOuvrier : sectionOuvrier // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,autres: null == autres ? _self.autres : autres // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,formAssistanceIsSubmit: null == formAssistanceIsSubmit ? _self.formAssistanceIsSubmit : formAssistanceIsSubmit // ignore: cast_nullable_to_non_nullable
as String,formAssistanceSubmitDate: null == formAssistanceSubmitDate ? _self.formAssistanceSubmitDate : formAssistanceSubmitDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestRapportCelluleAssistance].
extension RequestRapportCelluleAssistancePatterns on RequestRapportCelluleAssistance {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestRapportCelluleAssistance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestRapportCelluleAssistance() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestRapportCelluleAssistance value)  $default,){
final _that = this;
switch (_that) {
case _RequestRapportCelluleAssistance():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestRapportCelluleAssistance value)?  $default,){
final _that = this;
switch (_that) {
case _RequestRapportCelluleAssistance() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nombreBaptiser,  List<Map<String, dynamic>> nomBaptiserStat,  List<Map<String, dynamic>> nouveauBaptiserStat,  List<Map<String, dynamic>> inviterStat,  List<Map<String, dynamic>> formationStat,  List<Map<String, dynamic>> sectionVisite,  List<Map<String, dynamic>> sectionActivite,  List<Map<String, dynamic>> sectionOuvrier,  List<Map<String, dynamic>> autres,  String id,  String formAssistanceIsSubmit,  String formAssistanceSubmitDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestRapportCelluleAssistance() when $default != null:
return $default(_that.nombreBaptiser,_that.nomBaptiserStat,_that.nouveauBaptiserStat,_that.inviterStat,_that.formationStat,_that.sectionVisite,_that.sectionActivite,_that.sectionOuvrier,_that.autres,_that.id,_that.formAssistanceIsSubmit,_that.formAssistanceSubmitDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nombreBaptiser,  List<Map<String, dynamic>> nomBaptiserStat,  List<Map<String, dynamic>> nouveauBaptiserStat,  List<Map<String, dynamic>> inviterStat,  List<Map<String, dynamic>> formationStat,  List<Map<String, dynamic>> sectionVisite,  List<Map<String, dynamic>> sectionActivite,  List<Map<String, dynamic>> sectionOuvrier,  List<Map<String, dynamic>> autres,  String id,  String formAssistanceIsSubmit,  String formAssistanceSubmitDate)  $default,) {final _that = this;
switch (_that) {
case _RequestRapportCelluleAssistance():
return $default(_that.nombreBaptiser,_that.nomBaptiserStat,_that.nouveauBaptiserStat,_that.inviterStat,_that.formationStat,_that.sectionVisite,_that.sectionActivite,_that.sectionOuvrier,_that.autres,_that.id,_that.formAssistanceIsSubmit,_that.formAssistanceSubmitDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nombreBaptiser,  List<Map<String, dynamic>> nomBaptiserStat,  List<Map<String, dynamic>> nouveauBaptiserStat,  List<Map<String, dynamic>> inviterStat,  List<Map<String, dynamic>> formationStat,  List<Map<String, dynamic>> sectionVisite,  List<Map<String, dynamic>> sectionActivite,  List<Map<String, dynamic>> sectionOuvrier,  List<Map<String, dynamic>> autres,  String id,  String formAssistanceIsSubmit,  String formAssistanceSubmitDate)?  $default,) {final _that = this;
switch (_that) {
case _RequestRapportCelluleAssistance() when $default != null:
return $default(_that.nombreBaptiser,_that.nomBaptiserStat,_that.nouveauBaptiserStat,_that.inviterStat,_that.formationStat,_that.sectionVisite,_that.sectionActivite,_that.sectionOuvrier,_that.autres,_that.id,_that.formAssistanceIsSubmit,_that.formAssistanceSubmitDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestRapportCelluleAssistance with DiagnosticableTreeMixin implements RequestRapportCelluleAssistance {
   _RequestRapportCelluleAssistance({required this.nombreBaptiser, required final  List<Map<String, dynamic>> nomBaptiserStat, required final  List<Map<String, dynamic>> nouveauBaptiserStat, required final  List<Map<String, dynamic>> inviterStat, required final  List<Map<String, dynamic>> formationStat, required final  List<Map<String, dynamic>> sectionVisite, required final  List<Map<String, dynamic>> sectionActivite, required final  List<Map<String, dynamic>> sectionOuvrier, required final  List<Map<String, dynamic>> autres, required this.id, required this.formAssistanceIsSubmit, required this.formAssistanceSubmitDate}): _nomBaptiserStat = nomBaptiserStat,_nouveauBaptiserStat = nouveauBaptiserStat,_inviterStat = inviterStat,_formationStat = formationStat,_sectionVisite = sectionVisite,_sectionActivite = sectionActivite,_sectionOuvrier = sectionOuvrier,_autres = autres;
  factory _RequestRapportCelluleAssistance.fromJson(Map<String, dynamic> json) => _$RequestRapportCelluleAssistanceFromJson(json);

@override final  String nombreBaptiser;
 final  List<Map<String, dynamic>> _nomBaptiserStat;
@override List<Map<String, dynamic>> get nomBaptiserStat {
  if (_nomBaptiserStat is EqualUnmodifiableListView) return _nomBaptiserStat;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nomBaptiserStat);
}

 final  List<Map<String, dynamic>> _nouveauBaptiserStat;
@override List<Map<String, dynamic>> get nouveauBaptiserStat {
  if (_nouveauBaptiserStat is EqualUnmodifiableListView) return _nouveauBaptiserStat;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nouveauBaptiserStat);
}

 final  List<Map<String, dynamic>> _inviterStat;
@override List<Map<String, dynamic>> get inviterStat {
  if (_inviterStat is EqualUnmodifiableListView) return _inviterStat;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_inviterStat);
}

 final  List<Map<String, dynamic>> _formationStat;
@override List<Map<String, dynamic>> get formationStat {
  if (_formationStat is EqualUnmodifiableListView) return _formationStat;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_formationStat);
}

 final  List<Map<String, dynamic>> _sectionVisite;
@override List<Map<String, dynamic>> get sectionVisite {
  if (_sectionVisite is EqualUnmodifiableListView) return _sectionVisite;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sectionVisite);
}

 final  List<Map<String, dynamic>> _sectionActivite;
@override List<Map<String, dynamic>> get sectionActivite {
  if (_sectionActivite is EqualUnmodifiableListView) return _sectionActivite;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sectionActivite);
}

 final  List<Map<String, dynamic>> _sectionOuvrier;
@override List<Map<String, dynamic>> get sectionOuvrier {
  if (_sectionOuvrier is EqualUnmodifiableListView) return _sectionOuvrier;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sectionOuvrier);
}

 final  List<Map<String, dynamic>> _autres;
@override List<Map<String, dynamic>> get autres {
  if (_autres is EqualUnmodifiableListView) return _autres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_autres);
}

@override final  String id;
@override final  String formAssistanceIsSubmit;
@override final  String formAssistanceSubmitDate;

/// Create a copy of RequestRapportCelluleAssistance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestRapportCelluleAssistanceCopyWith<_RequestRapportCelluleAssistance> get copyWith => __$RequestRapportCelluleAssistanceCopyWithImpl<_RequestRapportCelluleAssistance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestRapportCelluleAssistanceToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestRapportCelluleAssistance'))
    ..add(DiagnosticsProperty('nombreBaptiser', nombreBaptiser))..add(DiagnosticsProperty('nomBaptiserStat', nomBaptiserStat))..add(DiagnosticsProperty('nouveauBaptiserStat', nouveauBaptiserStat))..add(DiagnosticsProperty('inviterStat', inviterStat))..add(DiagnosticsProperty('formationStat', formationStat))..add(DiagnosticsProperty('sectionVisite', sectionVisite))..add(DiagnosticsProperty('sectionActivite', sectionActivite))..add(DiagnosticsProperty('sectionOuvrier', sectionOuvrier))..add(DiagnosticsProperty('autres', autres))..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('formAssistanceIsSubmit', formAssistanceIsSubmit))..add(DiagnosticsProperty('formAssistanceSubmitDate', formAssistanceSubmitDate));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestRapportCelluleAssistance&&(identical(other.nombreBaptiser, nombreBaptiser) || other.nombreBaptiser == nombreBaptiser)&&const DeepCollectionEquality().equals(other._nomBaptiserStat, _nomBaptiserStat)&&const DeepCollectionEquality().equals(other._nouveauBaptiserStat, _nouveauBaptiserStat)&&const DeepCollectionEquality().equals(other._inviterStat, _inviterStat)&&const DeepCollectionEquality().equals(other._formationStat, _formationStat)&&const DeepCollectionEquality().equals(other._sectionVisite, _sectionVisite)&&const DeepCollectionEquality().equals(other._sectionActivite, _sectionActivite)&&const DeepCollectionEquality().equals(other._sectionOuvrier, _sectionOuvrier)&&const DeepCollectionEquality().equals(other._autres, _autres)&&(identical(other.id, id) || other.id == id)&&(identical(other.formAssistanceIsSubmit, formAssistanceIsSubmit) || other.formAssistanceIsSubmit == formAssistanceIsSubmit)&&(identical(other.formAssistanceSubmitDate, formAssistanceSubmitDate) || other.formAssistanceSubmitDate == formAssistanceSubmitDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nombreBaptiser,const DeepCollectionEquality().hash(_nomBaptiserStat),const DeepCollectionEquality().hash(_nouveauBaptiserStat),const DeepCollectionEquality().hash(_inviterStat),const DeepCollectionEquality().hash(_formationStat),const DeepCollectionEquality().hash(_sectionVisite),const DeepCollectionEquality().hash(_sectionActivite),const DeepCollectionEquality().hash(_sectionOuvrier),const DeepCollectionEquality().hash(_autres),id,formAssistanceIsSubmit,formAssistanceSubmitDate);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestRapportCelluleAssistance(nombreBaptiser: $nombreBaptiser, nomBaptiserStat: $nomBaptiserStat, nouveauBaptiserStat: $nouveauBaptiserStat, inviterStat: $inviterStat, formationStat: $formationStat, sectionVisite: $sectionVisite, sectionActivite: $sectionActivite, sectionOuvrier: $sectionOuvrier, autres: $autres, id: $id, formAssistanceIsSubmit: $formAssistanceIsSubmit, formAssistanceSubmitDate: $formAssistanceSubmitDate)';
}


}

/// @nodoc
abstract mixin class _$RequestRapportCelluleAssistanceCopyWith<$Res> implements $RequestRapportCelluleAssistanceCopyWith<$Res> {
  factory _$RequestRapportCelluleAssistanceCopyWith(_RequestRapportCelluleAssistance value, $Res Function(_RequestRapportCelluleAssistance) _then) = __$RequestRapportCelluleAssistanceCopyWithImpl;
@override @useResult
$Res call({
 String nombreBaptiser, List<Map<String, dynamic>> nomBaptiserStat, List<Map<String, dynamic>> nouveauBaptiserStat, List<Map<String, dynamic>> inviterStat, List<Map<String, dynamic>> formationStat, List<Map<String, dynamic>> sectionVisite, List<Map<String, dynamic>> sectionActivite, List<Map<String, dynamic>> sectionOuvrier, List<Map<String, dynamic>> autres, String id, String formAssistanceIsSubmit, String formAssistanceSubmitDate
});




}
/// @nodoc
class __$RequestRapportCelluleAssistanceCopyWithImpl<$Res>
    implements _$RequestRapportCelluleAssistanceCopyWith<$Res> {
  __$RequestRapportCelluleAssistanceCopyWithImpl(this._self, this._then);

  final _RequestRapportCelluleAssistance _self;
  final $Res Function(_RequestRapportCelluleAssistance) _then;

/// Create a copy of RequestRapportCelluleAssistance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nombreBaptiser = null,Object? nomBaptiserStat = null,Object? nouveauBaptiserStat = null,Object? inviterStat = null,Object? formationStat = null,Object? sectionVisite = null,Object? sectionActivite = null,Object? sectionOuvrier = null,Object? autres = null,Object? id = null,Object? formAssistanceIsSubmit = null,Object? formAssistanceSubmitDate = null,}) {
  return _then(_RequestRapportCelluleAssistance(
nombreBaptiser: null == nombreBaptiser ? _self.nombreBaptiser : nombreBaptiser // ignore: cast_nullable_to_non_nullable
as String,nomBaptiserStat: null == nomBaptiserStat ? _self._nomBaptiserStat : nomBaptiserStat // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,nouveauBaptiserStat: null == nouveauBaptiserStat ? _self._nouveauBaptiserStat : nouveauBaptiserStat // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,inviterStat: null == inviterStat ? _self._inviterStat : inviterStat // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,formationStat: null == formationStat ? _self._formationStat : formationStat // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,sectionVisite: null == sectionVisite ? _self._sectionVisite : sectionVisite // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,sectionActivite: null == sectionActivite ? _self._sectionActivite : sectionActivite // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,sectionOuvrier: null == sectionOuvrier ? _self._sectionOuvrier : sectionOuvrier // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,autres: null == autres ? _self._autres : autres // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,formAssistanceIsSubmit: null == formAssistanceIsSubmit ? _self.formAssistanceIsSubmit : formAssistanceIsSubmit // ignore: cast_nullable_to_non_nullable
as String,formAssistanceSubmitDate: null == formAssistanceSubmitDate ? _self.formAssistanceSubmitDate : formAssistanceSubmitDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
