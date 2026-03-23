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
mixin _$EmptyRequest {



  /// Serializes this EmptyRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmptyRequest);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
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

class _EmptyRequest implements EmptyRequest {
   _EmptyRequest();
  factory _EmptyRequest.fromJson(Map<String, dynamic> json) => _$EmptyRequestFromJson(json);




@override
Map<String, dynamic> toJson() {
  return _$EmptyRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmptyRequest);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmptyRequest()';
}


}





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
mixin _$RequestCellule {

 String? get responsable; String? get celluleCode; String? get date; String? get nom; String? get description; double? get latitude; double? get longitude; String? get adresse; String? get celluleId;
/// Create a copy of RequestCellule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestCelluleCopyWith<RequestCellule> get copyWith => _$RequestCelluleCopyWithImpl<RequestCellule>(this as RequestCellule, _$identity);

  /// Serializes this RequestCellule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestCellule&&(identical(other.responsable, responsable) || other.responsable == responsable)&&(identical(other.celluleCode, celluleCode) || other.celluleCode == celluleCode)&&(identical(other.date, date) || other.date == date)&&(identical(other.nom, nom) || other.nom == nom)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.celluleId, celluleId) || other.celluleId == celluleId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,responsable,celluleCode,date,nom,description,latitude,longitude,adresse,celluleId);

@override
String toString() {
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

class _RequestCellule implements RequestCellule {
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
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestCellule&&(identical(other.responsable, responsable) || other.responsable == responsable)&&(identical(other.celluleCode, celluleCode) || other.celluleCode == celluleCode)&&(identical(other.date, date) || other.date == date)&&(identical(other.nom, nom) || other.nom == nom)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.celluleId, celluleId) || other.celluleId == celluleId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,responsable,celluleCode,date,nom,description,latitude,longitude,adresse,celluleId);

@override
String toString() {
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
mixin _$RequestReponsableCellule {

 String? get responsable; String? get celluleCode; String? get date; String? get celluleName; String? get contact; String? get email; String? get adresse; String? get celluleId;
/// Create a copy of RequestReponsableCellule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestReponsableCelluleCopyWith<RequestReponsableCellule> get copyWith => _$RequestReponsableCelluleCopyWithImpl<RequestReponsableCellule>(this as RequestReponsableCellule, _$identity);

  /// Serializes this RequestReponsableCellule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestReponsableCellule&&(identical(other.responsable, responsable) || other.responsable == responsable)&&(identical(other.celluleCode, celluleCode) || other.celluleCode == celluleCode)&&(identical(other.date, date) || other.date == date)&&(identical(other.celluleName, celluleName) || other.celluleName == celluleName)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.email, email) || other.email == email)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.celluleId, celluleId) || other.celluleId == celluleId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,responsable,celluleCode,date,celluleName,contact,email,adresse,celluleId);

@override
String toString() {
  return 'RequestReponsableCellule(responsable: $responsable, celluleCode: $celluleCode, date: $date, celluleName: $celluleName, contact: $contact, email: $email, adresse: $adresse, celluleId: $celluleId)';
}


}

/// @nodoc
abstract mixin class $RequestReponsableCelluleCopyWith<$Res>  {
  factory $RequestReponsableCelluleCopyWith(RequestReponsableCellule value, $Res Function(RequestReponsableCellule) _then) = _$RequestReponsableCelluleCopyWithImpl;
@useResult
$Res call({
 String? responsable, String? celluleCode, String? date, String? celluleName, String? contact, String? email, String? adresse, String? celluleId
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
@pragma('vm:prefer-inline') @override $Res call({Object? responsable = freezed,Object? celluleCode = freezed,Object? date = freezed,Object? celluleName = freezed,Object? contact = freezed,Object? email = freezed,Object? adresse = freezed,Object? celluleId = freezed,}) {
  return _then(_self.copyWith(
responsable: freezed == responsable ? _self.responsable : responsable // ignore: cast_nullable_to_non_nullable
as String?,celluleCode: freezed == celluleCode ? _self.celluleCode : celluleCode // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,celluleName: freezed == celluleName ? _self.celluleName : celluleName // ignore: cast_nullable_to_non_nullable
as String?,contact: freezed == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,adresse: freezed == adresse ? _self.adresse : adresse // ignore: cast_nullable_to_non_nullable
as String?,celluleId: freezed == celluleId ? _self.celluleId : celluleId // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? responsable,  String? celluleCode,  String? date,  String? celluleName,  String? contact,  String? email,  String? adresse,  String? celluleId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestReponsableCellule() when $default != null:
return $default(_that.responsable,_that.celluleCode,_that.date,_that.celluleName,_that.contact,_that.email,_that.adresse,_that.celluleId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? responsable,  String? celluleCode,  String? date,  String? celluleName,  String? contact,  String? email,  String? adresse,  String? celluleId)  $default,) {final _that = this;
switch (_that) {
case _RequestReponsableCellule():
return $default(_that.responsable,_that.celluleCode,_that.date,_that.celluleName,_that.contact,_that.email,_that.adresse,_that.celluleId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? responsable,  String? celluleCode,  String? date,  String? celluleName,  String? contact,  String? email,  String? adresse,  String? celluleId)?  $default,) {final _that = this;
switch (_that) {
case _RequestReponsableCellule() when $default != null:
return $default(_that.responsable,_that.celluleCode,_that.date,_that.celluleName,_that.contact,_that.email,_that.adresse,_that.celluleId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestReponsableCellule implements RequestReponsableCellule {
   _RequestReponsableCellule({this.responsable, this.celluleCode, this.date, this.celluleName, this.contact, this.email, this.adresse, this.celluleId});
  factory _RequestReponsableCellule.fromJson(Map<String, dynamic> json) => _$RequestReponsableCelluleFromJson(json);

@override final  String? responsable;
@override final  String? celluleCode;
@override final  String? date;
@override final  String? celluleName;
@override final  String? contact;
@override final  String? email;
@override final  String? adresse;
@override final  String? celluleId;

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
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestReponsableCellule&&(identical(other.responsable, responsable) || other.responsable == responsable)&&(identical(other.celluleCode, celluleCode) || other.celluleCode == celluleCode)&&(identical(other.date, date) || other.date == date)&&(identical(other.celluleName, celluleName) || other.celluleName == celluleName)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.email, email) || other.email == email)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.celluleId, celluleId) || other.celluleId == celluleId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,responsable,celluleCode,date,celluleName,contact,email,adresse,celluleId);

@override
String toString() {
  return 'RequestReponsableCellule(responsable: $responsable, celluleCode: $celluleCode, date: $date, celluleName: $celluleName, contact: $contact, email: $email, adresse: $adresse, celluleId: $celluleId)';
}


}

/// @nodoc
abstract mixin class _$RequestReponsableCelluleCopyWith<$Res> implements $RequestReponsableCelluleCopyWith<$Res> {
  factory _$RequestReponsableCelluleCopyWith(_RequestReponsableCellule value, $Res Function(_RequestReponsableCellule) _then) = __$RequestReponsableCelluleCopyWithImpl;
@override @useResult
$Res call({
 String? responsable, String? celluleCode, String? date, String? celluleName, String? contact, String? email, String? adresse, String? celluleId
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
@override @pragma('vm:prefer-inline') $Res call({Object? responsable = freezed,Object? celluleCode = freezed,Object? date = freezed,Object? celluleName = freezed,Object? contact = freezed,Object? email = freezed,Object? adresse = freezed,Object? celluleId = freezed,}) {
  return _then(_RequestReponsableCellule(
responsable: freezed == responsable ? _self.responsable : responsable // ignore: cast_nullable_to_non_nullable
as String?,celluleCode: freezed == celluleCode ? _self.celluleCode : celluleCode // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,celluleName: freezed == celluleName ? _self.celluleName : celluleName // ignore: cast_nullable_to_non_nullable
as String?,contact: freezed == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,adresse: freezed == adresse ? _self.adresse : adresse // ignore: cast_nullable_to_non_nullable
as String?,celluleId: freezed == celluleId ? _self.celluleId : celluleId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
