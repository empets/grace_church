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

 String? get celluleResponsableName; String? get celluleCode; String? get date; String? get celluleName; String? get contact; String? get email; String? get adresse; String? get celluleId; String? get secteurId; String? get secteurCode;
/// Create a copy of RequestReponsableCellule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestReponsableCelluleCopyWith<RequestReponsableCellule> get copyWith => _$RequestReponsableCelluleCopyWithImpl<RequestReponsableCellule>(this as RequestReponsableCellule, _$identity);

  /// Serializes this RequestReponsableCellule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestReponsableCellule&&(identical(other.celluleResponsableName, celluleResponsableName) || other.celluleResponsableName == celluleResponsableName)&&(identical(other.celluleCode, celluleCode) || other.celluleCode == celluleCode)&&(identical(other.date, date) || other.date == date)&&(identical(other.celluleName, celluleName) || other.celluleName == celluleName)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.email, email) || other.email == email)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.celluleId, celluleId) || other.celluleId == celluleId)&&(identical(other.secteurId, secteurId) || other.secteurId == secteurId)&&(identical(other.secteurCode, secteurCode) || other.secteurCode == secteurCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,celluleResponsableName,celluleCode,date,celluleName,contact,email,adresse,celluleId,secteurId,secteurCode);

@override
String toString() {
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

class _RequestReponsableCellule implements RequestReponsableCellule {
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
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestReponsableCellule&&(identical(other.celluleResponsableName, celluleResponsableName) || other.celluleResponsableName == celluleResponsableName)&&(identical(other.celluleCode, celluleCode) || other.celluleCode == celluleCode)&&(identical(other.date, date) || other.date == date)&&(identical(other.celluleName, celluleName) || other.celluleName == celluleName)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.email, email) || other.email == email)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.celluleId, celluleId) || other.celluleId == celluleId)&&(identical(other.secteurId, secteurId) || other.secteurId == secteurId)&&(identical(other.secteurCode, secteurCode) || other.secteurCode == secteurCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,celluleResponsableName,celluleCode,date,celluleName,contact,email,adresse,celluleId,secteurId,secteurCode);

@override
String toString() {
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
mixin _$RequestReponsableSecteur {

 String? get secteurResponsableName; String? get secteurCode; String? get dateCreated; String? get secteurName; String? get contactResponsable; String? get emailResponsable; String? get adresse; String? get secteurId; String? get zoneId; String? get zoneCode;
/// Create a copy of RequestReponsableSecteur
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestReponsableSecteurCopyWith<RequestReponsableSecteur> get copyWith => _$RequestReponsableSecteurCopyWithImpl<RequestReponsableSecteur>(this as RequestReponsableSecteur, _$identity);

  /// Serializes this RequestReponsableSecteur to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestReponsableSecteur&&(identical(other.secteurResponsableName, secteurResponsableName) || other.secteurResponsableName == secteurResponsableName)&&(identical(other.secteurCode, secteurCode) || other.secteurCode == secteurCode)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.secteurName, secteurName) || other.secteurName == secteurName)&&(identical(other.contactResponsable, contactResponsable) || other.contactResponsable == contactResponsable)&&(identical(other.emailResponsable, emailResponsable) || other.emailResponsable == emailResponsable)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.secteurId, secteurId) || other.secteurId == secteurId)&&(identical(other.zoneId, zoneId) || other.zoneId == zoneId)&&(identical(other.zoneCode, zoneCode) || other.zoneCode == zoneCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,secteurResponsableName,secteurCode,dateCreated,secteurName,contactResponsable,emailResponsable,adresse,secteurId,zoneId,zoneCode);

@override
String toString() {
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

class _RequestReponsableSecteur implements RequestReponsableSecteur {
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
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestReponsableSecteur&&(identical(other.secteurResponsableName, secteurResponsableName) || other.secteurResponsableName == secteurResponsableName)&&(identical(other.secteurCode, secteurCode) || other.secteurCode == secteurCode)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.secteurName, secteurName) || other.secteurName == secteurName)&&(identical(other.contactResponsable, contactResponsable) || other.contactResponsable == contactResponsable)&&(identical(other.emailResponsable, emailResponsable) || other.emailResponsable == emailResponsable)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.secteurId, secteurId) || other.secteurId == secteurId)&&(identical(other.zoneId, zoneId) || other.zoneId == zoneId)&&(identical(other.zoneCode, zoneCode) || other.zoneCode == zoneCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,secteurResponsableName,secteurCode,dateCreated,secteurName,contactResponsable,emailResponsable,adresse,secteurId,zoneId,zoneCode);

@override
String toString() {
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
mixin _$RequestReponsableZone {

 String? get zoneResponsableName; String? get zoneCode; String? get dateCreated; String? get zoneName; String? get contactResponsable; String? get emailResponsable; String? get adresse; String? get zoneId;
/// Create a copy of RequestReponsableZone
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestReponsableZoneCopyWith<RequestReponsableZone> get copyWith => _$RequestReponsableZoneCopyWithImpl<RequestReponsableZone>(this as RequestReponsableZone, _$identity);

  /// Serializes this RequestReponsableZone to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestReponsableZone&&(identical(other.zoneResponsableName, zoneResponsableName) || other.zoneResponsableName == zoneResponsableName)&&(identical(other.zoneCode, zoneCode) || other.zoneCode == zoneCode)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.zoneName, zoneName) || other.zoneName == zoneName)&&(identical(other.contactResponsable, contactResponsable) || other.contactResponsable == contactResponsable)&&(identical(other.emailResponsable, emailResponsable) || other.emailResponsable == emailResponsable)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.zoneId, zoneId) || other.zoneId == zoneId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,zoneResponsableName,zoneCode,dateCreated,zoneName,contactResponsable,emailResponsable,adresse,zoneId);

@override
String toString() {
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

class _RequestReponsableZone implements RequestReponsableZone {
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
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestReponsableZone&&(identical(other.zoneResponsableName, zoneResponsableName) || other.zoneResponsableName == zoneResponsableName)&&(identical(other.zoneCode, zoneCode) || other.zoneCode == zoneCode)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.zoneName, zoneName) || other.zoneName == zoneName)&&(identical(other.contactResponsable, contactResponsable) || other.contactResponsable == contactResponsable)&&(identical(other.emailResponsable, emailResponsable) || other.emailResponsable == emailResponsable)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.zoneId, zoneId) || other.zoneId == zoneId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,zoneResponsableName,zoneCode,dateCreated,zoneName,contactResponsable,emailResponsable,adresse,zoneId);

@override
String toString() {
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
mixin _$RequestAuthenProfileUpdateZone {

 String get secteurId;
/// Create a copy of RequestAuthenProfileUpdateZone
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestAuthenProfileUpdateZoneCopyWith<RequestAuthenProfileUpdateZone> get copyWith => _$RequestAuthenProfileUpdateZoneCopyWithImpl<RequestAuthenProfileUpdateZone>(this as RequestAuthenProfileUpdateZone, _$identity);

  /// Serializes this RequestAuthenProfileUpdateZone to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestAuthenProfileUpdateZone&&(identical(other.secteurId, secteurId) || other.secteurId == secteurId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,secteurId);

@override
String toString() {
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

class _RequestAuthenProfileUpdateZone implements RequestAuthenProfileUpdateZone {
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
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestAuthenProfileUpdateZone&&(identical(other.secteurId, secteurId) || other.secteurId == secteurId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,secteurId);

@override
String toString() {
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
mixin _$RequestRapportCellule {

 String get codeZone; String get fullNameRespoZone; String get contactRespoZone; String get codeSecteur; String get fullNameRespoSecteur; String get contactRespoSecteur; String get codeCellule; String get fullNameRespoCellule; String get contactRespoCellule; String get jourCellule; String get offrande; String get nombreBaptiser; String get nombreNonBaptiser;
/// Create a copy of RequestRapportCellule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestRapportCelluleCopyWith<RequestRapportCellule> get copyWith => _$RequestRapportCelluleCopyWithImpl<RequestRapportCellule>(this as RequestRapportCellule, _$identity);

  /// Serializes this RequestRapportCellule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestRapportCellule&&(identical(other.codeZone, codeZone) || other.codeZone == codeZone)&&(identical(other.fullNameRespoZone, fullNameRespoZone) || other.fullNameRespoZone == fullNameRespoZone)&&(identical(other.contactRespoZone, contactRespoZone) || other.contactRespoZone == contactRespoZone)&&(identical(other.codeSecteur, codeSecteur) || other.codeSecteur == codeSecteur)&&(identical(other.fullNameRespoSecteur, fullNameRespoSecteur) || other.fullNameRespoSecteur == fullNameRespoSecteur)&&(identical(other.contactRespoSecteur, contactRespoSecteur) || other.contactRespoSecteur == contactRespoSecteur)&&(identical(other.codeCellule, codeCellule) || other.codeCellule == codeCellule)&&(identical(other.fullNameRespoCellule, fullNameRespoCellule) || other.fullNameRespoCellule == fullNameRespoCellule)&&(identical(other.contactRespoCellule, contactRespoCellule) || other.contactRespoCellule == contactRespoCellule)&&(identical(other.jourCellule, jourCellule) || other.jourCellule == jourCellule)&&(identical(other.offrande, offrande) || other.offrande == offrande)&&(identical(other.nombreBaptiser, nombreBaptiser) || other.nombreBaptiser == nombreBaptiser)&&(identical(other.nombreNonBaptiser, nombreNonBaptiser) || other.nombreNonBaptiser == nombreNonBaptiser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,codeZone,fullNameRespoZone,contactRespoZone,codeSecteur,fullNameRespoSecteur,contactRespoSecteur,codeCellule,fullNameRespoCellule,contactRespoCellule,jourCellule,offrande,nombreBaptiser,nombreNonBaptiser);

@override
String toString() {
  return 'RequestRapportCellule(codeZone: $codeZone, fullNameRespoZone: $fullNameRespoZone, contactRespoZone: $contactRespoZone, codeSecteur: $codeSecteur, fullNameRespoSecteur: $fullNameRespoSecteur, contactRespoSecteur: $contactRespoSecteur, codeCellule: $codeCellule, fullNameRespoCellule: $fullNameRespoCellule, contactRespoCellule: $contactRespoCellule, jourCellule: $jourCellule, offrande: $offrande, nombreBaptiser: $nombreBaptiser, nombreNonBaptiser: $nombreNonBaptiser)';
}


}

/// @nodoc
abstract mixin class $RequestRapportCelluleCopyWith<$Res>  {
  factory $RequestRapportCelluleCopyWith(RequestRapportCellule value, $Res Function(RequestRapportCellule) _then) = _$RequestRapportCelluleCopyWithImpl;
@useResult
$Res call({
 String codeZone, String fullNameRespoZone, String contactRespoZone, String codeSecteur, String fullNameRespoSecteur, String contactRespoSecteur, String codeCellule, String fullNameRespoCellule, String contactRespoCellule, String jourCellule, String offrande, String nombreBaptiser, String nombreNonBaptiser
});




}
/// @nodoc
class _$RequestRapportCelluleCopyWithImpl<$Res>
    implements $RequestRapportCelluleCopyWith<$Res> {
  _$RequestRapportCelluleCopyWithImpl(this._self, this._then);

  final RequestRapportCellule _self;
  final $Res Function(RequestRapportCellule) _then;

/// Create a copy of RequestRapportCellule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? codeZone = null,Object? fullNameRespoZone = null,Object? contactRespoZone = null,Object? codeSecteur = null,Object? fullNameRespoSecteur = null,Object? contactRespoSecteur = null,Object? codeCellule = null,Object? fullNameRespoCellule = null,Object? contactRespoCellule = null,Object? jourCellule = null,Object? offrande = null,Object? nombreBaptiser = null,Object? nombreNonBaptiser = null,}) {
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
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestRapportCellule].
extension RequestRapportCellulePatterns on RequestRapportCellule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestRapportCellule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestRapportCellule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestRapportCellule value)  $default,){
final _that = this;
switch (_that) {
case _RequestRapportCellule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestRapportCellule value)?  $default,){
final _that = this;
switch (_that) {
case _RequestRapportCellule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String codeZone,  String fullNameRespoZone,  String contactRespoZone,  String codeSecteur,  String fullNameRespoSecteur,  String contactRespoSecteur,  String codeCellule,  String fullNameRespoCellule,  String contactRespoCellule,  String jourCellule,  String offrande,  String nombreBaptiser,  String nombreNonBaptiser)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestRapportCellule() when $default != null:
return $default(_that.codeZone,_that.fullNameRespoZone,_that.contactRespoZone,_that.codeSecteur,_that.fullNameRespoSecteur,_that.contactRespoSecteur,_that.codeCellule,_that.fullNameRespoCellule,_that.contactRespoCellule,_that.jourCellule,_that.offrande,_that.nombreBaptiser,_that.nombreNonBaptiser);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String codeZone,  String fullNameRespoZone,  String contactRespoZone,  String codeSecteur,  String fullNameRespoSecteur,  String contactRespoSecteur,  String codeCellule,  String fullNameRespoCellule,  String contactRespoCellule,  String jourCellule,  String offrande,  String nombreBaptiser,  String nombreNonBaptiser)  $default,) {final _that = this;
switch (_that) {
case _RequestRapportCellule():
return $default(_that.codeZone,_that.fullNameRespoZone,_that.contactRespoZone,_that.codeSecteur,_that.fullNameRespoSecteur,_that.contactRespoSecteur,_that.codeCellule,_that.fullNameRespoCellule,_that.contactRespoCellule,_that.jourCellule,_that.offrande,_that.nombreBaptiser,_that.nombreNonBaptiser);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String codeZone,  String fullNameRespoZone,  String contactRespoZone,  String codeSecteur,  String fullNameRespoSecteur,  String contactRespoSecteur,  String codeCellule,  String fullNameRespoCellule,  String contactRespoCellule,  String jourCellule,  String offrande,  String nombreBaptiser,  String nombreNonBaptiser)?  $default,) {final _that = this;
switch (_that) {
case _RequestRapportCellule() when $default != null:
return $default(_that.codeZone,_that.fullNameRespoZone,_that.contactRespoZone,_that.codeSecteur,_that.fullNameRespoSecteur,_that.contactRespoSecteur,_that.codeCellule,_that.fullNameRespoCellule,_that.contactRespoCellule,_that.jourCellule,_that.offrande,_that.nombreBaptiser,_that.nombreNonBaptiser);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestRapportCellule implements RequestRapportCellule {
   _RequestRapportCellule({required this.codeZone, required this.fullNameRespoZone, required this.contactRespoZone, required this.codeSecteur, required this.fullNameRespoSecteur, required this.contactRespoSecteur, required this.codeCellule, required this.fullNameRespoCellule, required this.contactRespoCellule, required this.jourCellule, required this.offrande, required this.nombreBaptiser, required this.nombreNonBaptiser});
  factory _RequestRapportCellule.fromJson(Map<String, dynamic> json) => _$RequestRapportCelluleFromJson(json);

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

/// Create a copy of RequestRapportCellule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestRapportCelluleCopyWith<_RequestRapportCellule> get copyWith => __$RequestRapportCelluleCopyWithImpl<_RequestRapportCellule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestRapportCelluleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestRapportCellule&&(identical(other.codeZone, codeZone) || other.codeZone == codeZone)&&(identical(other.fullNameRespoZone, fullNameRespoZone) || other.fullNameRespoZone == fullNameRespoZone)&&(identical(other.contactRespoZone, contactRespoZone) || other.contactRespoZone == contactRespoZone)&&(identical(other.codeSecteur, codeSecteur) || other.codeSecteur == codeSecteur)&&(identical(other.fullNameRespoSecteur, fullNameRespoSecteur) || other.fullNameRespoSecteur == fullNameRespoSecteur)&&(identical(other.contactRespoSecteur, contactRespoSecteur) || other.contactRespoSecteur == contactRespoSecteur)&&(identical(other.codeCellule, codeCellule) || other.codeCellule == codeCellule)&&(identical(other.fullNameRespoCellule, fullNameRespoCellule) || other.fullNameRespoCellule == fullNameRespoCellule)&&(identical(other.contactRespoCellule, contactRespoCellule) || other.contactRespoCellule == contactRespoCellule)&&(identical(other.jourCellule, jourCellule) || other.jourCellule == jourCellule)&&(identical(other.offrande, offrande) || other.offrande == offrande)&&(identical(other.nombreBaptiser, nombreBaptiser) || other.nombreBaptiser == nombreBaptiser)&&(identical(other.nombreNonBaptiser, nombreNonBaptiser) || other.nombreNonBaptiser == nombreNonBaptiser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,codeZone,fullNameRespoZone,contactRespoZone,codeSecteur,fullNameRespoSecteur,contactRespoSecteur,codeCellule,fullNameRespoCellule,contactRespoCellule,jourCellule,offrande,nombreBaptiser,nombreNonBaptiser);

@override
String toString() {
  return 'RequestRapportCellule(codeZone: $codeZone, fullNameRespoZone: $fullNameRespoZone, contactRespoZone: $contactRespoZone, codeSecteur: $codeSecteur, fullNameRespoSecteur: $fullNameRespoSecteur, contactRespoSecteur: $contactRespoSecteur, codeCellule: $codeCellule, fullNameRespoCellule: $fullNameRespoCellule, contactRespoCellule: $contactRespoCellule, jourCellule: $jourCellule, offrande: $offrande, nombreBaptiser: $nombreBaptiser, nombreNonBaptiser: $nombreNonBaptiser)';
}


}

/// @nodoc
abstract mixin class _$RequestRapportCelluleCopyWith<$Res> implements $RequestRapportCelluleCopyWith<$Res> {
  factory _$RequestRapportCelluleCopyWith(_RequestRapportCellule value, $Res Function(_RequestRapportCellule) _then) = __$RequestRapportCelluleCopyWithImpl;
@override @useResult
$Res call({
 String codeZone, String fullNameRespoZone, String contactRespoZone, String codeSecteur, String fullNameRespoSecteur, String contactRespoSecteur, String codeCellule, String fullNameRespoCellule, String contactRespoCellule, String jourCellule, String offrande, String nombreBaptiser, String nombreNonBaptiser
});




}
/// @nodoc
class __$RequestRapportCelluleCopyWithImpl<$Res>
    implements _$RequestRapportCelluleCopyWith<$Res> {
  __$RequestRapportCelluleCopyWithImpl(this._self, this._then);

  final _RequestRapportCellule _self;
  final $Res Function(_RequestRapportCellule) _then;

/// Create a copy of RequestRapportCellule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? codeZone = null,Object? fullNameRespoZone = null,Object? contactRespoZone = null,Object? codeSecteur = null,Object? fullNameRespoSecteur = null,Object? contactRespoSecteur = null,Object? codeCellule = null,Object? fullNameRespoCellule = null,Object? contactRespoCellule = null,Object? jourCellule = null,Object? offrande = null,Object? nombreBaptiser = null,Object? nombreNonBaptiser = null,}) {
  return _then(_RequestRapportCellule(
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
as String,
  ));
}


}

// dart format on
