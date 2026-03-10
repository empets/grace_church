// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authen_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequestAuthenProfile {

 String get name; String get dateNaissance; String get zoneResidence; String get profileImage; String get contact; String get email; String get nationalite; String get dateInscription;
/// Create a copy of RequestAuthenProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestAuthenProfileCopyWith<RequestAuthenProfile> get copyWith => _$RequestAuthenProfileCopyWithImpl<RequestAuthenProfile>(this as RequestAuthenProfile, _$identity);

  /// Serializes this RequestAuthenProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestAuthenProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.dateNaissance, dateNaissance) || other.dateNaissance == dateNaissance)&&(identical(other.zoneResidence, zoneResidence) || other.zoneResidence == zoneResidence)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.email, email) || other.email == email)&&(identical(other.nationalite, nationalite) || other.nationalite == nationalite)&&(identical(other.dateInscription, dateInscription) || other.dateInscription == dateInscription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,dateNaissance,zoneResidence,profileImage,contact,email,nationalite,dateInscription);

@override
String toString() {
  return 'RequestAuthenProfile(name: $name, dateNaissance: $dateNaissance, zoneResidence: $zoneResidence, profileImage: $profileImage, contact: $contact, email: $email, nationalite: $nationalite, dateInscription: $dateInscription)';
}


}

/// @nodoc
abstract mixin class $RequestAuthenProfileCopyWith<$Res>  {
  factory $RequestAuthenProfileCopyWith(RequestAuthenProfile value, $Res Function(RequestAuthenProfile) _then) = _$RequestAuthenProfileCopyWithImpl;
@useResult
$Res call({
 String name, String dateNaissance, String zoneResidence, String profileImage, String contact, String email, String nationalite, String dateInscription
});




}
/// @nodoc
class _$RequestAuthenProfileCopyWithImpl<$Res>
    implements $RequestAuthenProfileCopyWith<$Res> {
  _$RequestAuthenProfileCopyWithImpl(this._self, this._then);

  final RequestAuthenProfile _self;
  final $Res Function(RequestAuthenProfile) _then;

/// Create a copy of RequestAuthenProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? dateNaissance = null,Object? zoneResidence = null,Object? profileImage = null,Object? contact = null,Object? email = null,Object? nationalite = null,Object? dateInscription = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dateNaissance: null == dateNaissance ? _self.dateNaissance : dateNaissance // ignore: cast_nullable_to_non_nullable
as String,zoneResidence: null == zoneResidence ? _self.zoneResidence : zoneResidence // ignore: cast_nullable_to_non_nullable
as String,profileImage: null == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String,contact: null == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,nationalite: null == nationalite ? _self.nationalite : nationalite // ignore: cast_nullable_to_non_nullable
as String,dateInscription: null == dateInscription ? _self.dateInscription : dateInscription // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestAuthenProfile].
extension RequestAuthenProfilePatterns on RequestAuthenProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestAuthenProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestAuthenProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestAuthenProfile value)  $default,){
final _that = this;
switch (_that) {
case _RequestAuthenProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestAuthenProfile value)?  $default,){
final _that = this;
switch (_that) {
case _RequestAuthenProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String dateNaissance,  String zoneResidence,  String profileImage,  String contact,  String email,  String nationalite,  String dateInscription)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestAuthenProfile() when $default != null:
return $default(_that.name,_that.dateNaissance,_that.zoneResidence,_that.profileImage,_that.contact,_that.email,_that.nationalite,_that.dateInscription);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String dateNaissance,  String zoneResidence,  String profileImage,  String contact,  String email,  String nationalite,  String dateInscription)  $default,) {final _that = this;
switch (_that) {
case _RequestAuthenProfile():
return $default(_that.name,_that.dateNaissance,_that.zoneResidence,_that.profileImage,_that.contact,_that.email,_that.nationalite,_that.dateInscription);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String dateNaissance,  String zoneResidence,  String profileImage,  String contact,  String email,  String nationalite,  String dateInscription)?  $default,) {final _that = this;
switch (_that) {
case _RequestAuthenProfile() when $default != null:
return $default(_that.name,_that.dateNaissance,_that.zoneResidence,_that.profileImage,_that.contact,_that.email,_that.nationalite,_that.dateInscription);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestAuthenProfile implements RequestAuthenProfile {
   _RequestAuthenProfile({required this.name, required this.dateNaissance, required this.zoneResidence, required this.profileImage, required this.contact, required this.email, required this.nationalite, required this.dateInscription});
  factory _RequestAuthenProfile.fromJson(Map<String, dynamic> json) => _$RequestAuthenProfileFromJson(json);

@override final  String name;
@override final  String dateNaissance;
@override final  String zoneResidence;
@override final  String profileImage;
@override final  String contact;
@override final  String email;
@override final  String nationalite;
@override final  String dateInscription;

/// Create a copy of RequestAuthenProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestAuthenProfileCopyWith<_RequestAuthenProfile> get copyWith => __$RequestAuthenProfileCopyWithImpl<_RequestAuthenProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestAuthenProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestAuthenProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.dateNaissance, dateNaissance) || other.dateNaissance == dateNaissance)&&(identical(other.zoneResidence, zoneResidence) || other.zoneResidence == zoneResidence)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.email, email) || other.email == email)&&(identical(other.nationalite, nationalite) || other.nationalite == nationalite)&&(identical(other.dateInscription, dateInscription) || other.dateInscription == dateInscription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,dateNaissance,zoneResidence,profileImage,contact,email,nationalite,dateInscription);

@override
String toString() {
  return 'RequestAuthenProfile(name: $name, dateNaissance: $dateNaissance, zoneResidence: $zoneResidence, profileImage: $profileImage, contact: $contact, email: $email, nationalite: $nationalite, dateInscription: $dateInscription)';
}


}

/// @nodoc
abstract mixin class _$RequestAuthenProfileCopyWith<$Res> implements $RequestAuthenProfileCopyWith<$Res> {
  factory _$RequestAuthenProfileCopyWith(_RequestAuthenProfile value, $Res Function(_RequestAuthenProfile) _then) = __$RequestAuthenProfileCopyWithImpl;
@override @useResult
$Res call({
 String name, String dateNaissance, String zoneResidence, String profileImage, String contact, String email, String nationalite, String dateInscription
});




}
/// @nodoc
class __$RequestAuthenProfileCopyWithImpl<$Res>
    implements _$RequestAuthenProfileCopyWith<$Res> {
  __$RequestAuthenProfileCopyWithImpl(this._self, this._then);

  final _RequestAuthenProfile _self;
  final $Res Function(_RequestAuthenProfile) _then;

/// Create a copy of RequestAuthenProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? dateNaissance = null,Object? zoneResidence = null,Object? profileImage = null,Object? contact = null,Object? email = null,Object? nationalite = null,Object? dateInscription = null,}) {
  return _then(_RequestAuthenProfile(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dateNaissance: null == dateNaissance ? _self.dateNaissance : dateNaissance // ignore: cast_nullable_to_non_nullable
as String,zoneResidence: null == zoneResidence ? _self.zoneResidence : zoneResidence // ignore: cast_nullable_to_non_nullable
as String,profileImage: null == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String,contact: null == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,nationalite: null == nationalite ? _self.nationalite : nationalite // ignore: cast_nullable_to_non_nullable
as String,dateInscription: null == dateInscription ? _self.dateInscription : dateInscription // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RequestAuthenSocial {

 String get statusSocial; String get activity; String get nivauEtude; String get matrimonial; String get orphelin;
/// Create a copy of RequestAuthenSocial
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestAuthenSocialCopyWith<RequestAuthenSocial> get copyWith => _$RequestAuthenSocialCopyWithImpl<RequestAuthenSocial>(this as RequestAuthenSocial, _$identity);

  /// Serializes this RequestAuthenSocial to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestAuthenSocial&&(identical(other.statusSocial, statusSocial) || other.statusSocial == statusSocial)&&(identical(other.activity, activity) || other.activity == activity)&&(identical(other.nivauEtude, nivauEtude) || other.nivauEtude == nivauEtude)&&(identical(other.matrimonial, matrimonial) || other.matrimonial == matrimonial)&&(identical(other.orphelin, orphelin) || other.orphelin == orphelin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusSocial,activity,nivauEtude,matrimonial,orphelin);

@override
String toString() {
  return 'RequestAuthenSocial(statusSocial: $statusSocial, activity: $activity, nivauEtude: $nivauEtude, matrimonial: $matrimonial, orphelin: $orphelin)';
}


}

/// @nodoc
abstract mixin class $RequestAuthenSocialCopyWith<$Res>  {
  factory $RequestAuthenSocialCopyWith(RequestAuthenSocial value, $Res Function(RequestAuthenSocial) _then) = _$RequestAuthenSocialCopyWithImpl;
@useResult
$Res call({
 String statusSocial, String activity, String nivauEtude, String matrimonial, String orphelin
});




}
/// @nodoc
class _$RequestAuthenSocialCopyWithImpl<$Res>
    implements $RequestAuthenSocialCopyWith<$Res> {
  _$RequestAuthenSocialCopyWithImpl(this._self, this._then);

  final RequestAuthenSocial _self;
  final $Res Function(RequestAuthenSocial) _then;

/// Create a copy of RequestAuthenSocial
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusSocial = null,Object? activity = null,Object? nivauEtude = null,Object? matrimonial = null,Object? orphelin = null,}) {
  return _then(_self.copyWith(
statusSocial: null == statusSocial ? _self.statusSocial : statusSocial // ignore: cast_nullable_to_non_nullable
as String,activity: null == activity ? _self.activity : activity // ignore: cast_nullable_to_non_nullable
as String,nivauEtude: null == nivauEtude ? _self.nivauEtude : nivauEtude // ignore: cast_nullable_to_non_nullable
as String,matrimonial: null == matrimonial ? _self.matrimonial : matrimonial // ignore: cast_nullable_to_non_nullable
as String,orphelin: null == orphelin ? _self.orphelin : orphelin // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestAuthenSocial].
extension RequestAuthenSocialPatterns on RequestAuthenSocial {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestAuthenSocial value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestAuthenSocial() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestAuthenSocial value)  $default,){
final _that = this;
switch (_that) {
case _RequestAuthenSocial():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestAuthenSocial value)?  $default,){
final _that = this;
switch (_that) {
case _RequestAuthenSocial() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String statusSocial,  String activity,  String nivauEtude,  String matrimonial,  String orphelin)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestAuthenSocial() when $default != null:
return $default(_that.statusSocial,_that.activity,_that.nivauEtude,_that.matrimonial,_that.orphelin);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String statusSocial,  String activity,  String nivauEtude,  String matrimonial,  String orphelin)  $default,) {final _that = this;
switch (_that) {
case _RequestAuthenSocial():
return $default(_that.statusSocial,_that.activity,_that.nivauEtude,_that.matrimonial,_that.orphelin);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String statusSocial,  String activity,  String nivauEtude,  String matrimonial,  String orphelin)?  $default,) {final _that = this;
switch (_that) {
case _RequestAuthenSocial() when $default != null:
return $default(_that.statusSocial,_that.activity,_that.nivauEtude,_that.matrimonial,_that.orphelin);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestAuthenSocial implements RequestAuthenSocial {
   _RequestAuthenSocial({required this.statusSocial, required this.activity, required this.nivauEtude, required this.matrimonial, required this.orphelin});
  factory _RequestAuthenSocial.fromJson(Map<String, dynamic> json) => _$RequestAuthenSocialFromJson(json);

@override final  String statusSocial;
@override final  String activity;
@override final  String nivauEtude;
@override final  String matrimonial;
@override final  String orphelin;

/// Create a copy of RequestAuthenSocial
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestAuthenSocialCopyWith<_RequestAuthenSocial> get copyWith => __$RequestAuthenSocialCopyWithImpl<_RequestAuthenSocial>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestAuthenSocialToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestAuthenSocial&&(identical(other.statusSocial, statusSocial) || other.statusSocial == statusSocial)&&(identical(other.activity, activity) || other.activity == activity)&&(identical(other.nivauEtude, nivauEtude) || other.nivauEtude == nivauEtude)&&(identical(other.matrimonial, matrimonial) || other.matrimonial == matrimonial)&&(identical(other.orphelin, orphelin) || other.orphelin == orphelin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusSocial,activity,nivauEtude,matrimonial,orphelin);

@override
String toString() {
  return 'RequestAuthenSocial(statusSocial: $statusSocial, activity: $activity, nivauEtude: $nivauEtude, matrimonial: $matrimonial, orphelin: $orphelin)';
}


}

/// @nodoc
abstract mixin class _$RequestAuthenSocialCopyWith<$Res> implements $RequestAuthenSocialCopyWith<$Res> {
  factory _$RequestAuthenSocialCopyWith(_RequestAuthenSocial value, $Res Function(_RequestAuthenSocial) _then) = __$RequestAuthenSocialCopyWithImpl;
@override @useResult
$Res call({
 String statusSocial, String activity, String nivauEtude, String matrimonial, String orphelin
});




}
/// @nodoc
class __$RequestAuthenSocialCopyWithImpl<$Res>
    implements _$RequestAuthenSocialCopyWith<$Res> {
  __$RequestAuthenSocialCopyWithImpl(this._self, this._then);

  final _RequestAuthenSocial _self;
  final $Res Function(_RequestAuthenSocial) _then;

/// Create a copy of RequestAuthenSocial
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusSocial = null,Object? activity = null,Object? nivauEtude = null,Object? matrimonial = null,Object? orphelin = null,}) {
  return _then(_RequestAuthenSocial(
statusSocial: null == statusSocial ? _self.statusSocial : statusSocial // ignore: cast_nullable_to_non_nullable
as String,activity: null == activity ? _self.activity : activity // ignore: cast_nullable_to_non_nullable
as String,nivauEtude: null == nivauEtude ? _self.nivauEtude : nivauEtude // ignore: cast_nullable_to_non_nullable
as String,matrimonial: null == matrimonial ? _self.matrimonial : matrimonial // ignore: cast_nullable_to_non_nullable
as String,orphelin: null == orphelin ? _self.orphelin : orphelin // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RequestAuthenSpiritualLife {

 String get statusSpirituel; String get dateBaptme; String get cellulePriere; String get encadreur;
/// Create a copy of RequestAuthenSpiritualLife
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestAuthenSpiritualLifeCopyWith<RequestAuthenSpiritualLife> get copyWith => _$RequestAuthenSpiritualLifeCopyWithImpl<RequestAuthenSpiritualLife>(this as RequestAuthenSpiritualLife, _$identity);

  /// Serializes this RequestAuthenSpiritualLife to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestAuthenSpiritualLife&&(identical(other.statusSpirituel, statusSpirituel) || other.statusSpirituel == statusSpirituel)&&(identical(other.dateBaptme, dateBaptme) || other.dateBaptme == dateBaptme)&&(identical(other.cellulePriere, cellulePriere) || other.cellulePriere == cellulePriere)&&(identical(other.encadreur, encadreur) || other.encadreur == encadreur));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusSpirituel,dateBaptme,cellulePriere,encadreur);

@override
String toString() {
  return 'RequestAuthenSpiritualLife(statusSpirituel: $statusSpirituel, dateBaptme: $dateBaptme, cellulePriere: $cellulePriere, encadreur: $encadreur)';
}


}

/// @nodoc
abstract mixin class $RequestAuthenSpiritualLifeCopyWith<$Res>  {
  factory $RequestAuthenSpiritualLifeCopyWith(RequestAuthenSpiritualLife value, $Res Function(RequestAuthenSpiritualLife) _then) = _$RequestAuthenSpiritualLifeCopyWithImpl;
@useResult
$Res call({
 String statusSpirituel, String dateBaptme, String cellulePriere, String encadreur
});




}
/// @nodoc
class _$RequestAuthenSpiritualLifeCopyWithImpl<$Res>
    implements $RequestAuthenSpiritualLifeCopyWith<$Res> {
  _$RequestAuthenSpiritualLifeCopyWithImpl(this._self, this._then);

  final RequestAuthenSpiritualLife _self;
  final $Res Function(RequestAuthenSpiritualLife) _then;

/// Create a copy of RequestAuthenSpiritualLife
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusSpirituel = null,Object? dateBaptme = null,Object? cellulePriere = null,Object? encadreur = null,}) {
  return _then(_self.copyWith(
statusSpirituel: null == statusSpirituel ? _self.statusSpirituel : statusSpirituel // ignore: cast_nullable_to_non_nullable
as String,dateBaptme: null == dateBaptme ? _self.dateBaptme : dateBaptme // ignore: cast_nullable_to_non_nullable
as String,cellulePriere: null == cellulePriere ? _self.cellulePriere : cellulePriere // ignore: cast_nullable_to_non_nullable
as String,encadreur: null == encadreur ? _self.encadreur : encadreur // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestAuthenSpiritualLife].
extension RequestAuthenSpiritualLifePatterns on RequestAuthenSpiritualLife {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestAuthenSpiritualLife value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestAuthenSpiritualLife() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestAuthenSpiritualLife value)  $default,){
final _that = this;
switch (_that) {
case _RequestAuthenSpiritualLife():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestAuthenSpiritualLife value)?  $default,){
final _that = this;
switch (_that) {
case _RequestAuthenSpiritualLife() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String statusSpirituel,  String dateBaptme,  String cellulePriere,  String encadreur)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestAuthenSpiritualLife() when $default != null:
return $default(_that.statusSpirituel,_that.dateBaptme,_that.cellulePriere,_that.encadreur);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String statusSpirituel,  String dateBaptme,  String cellulePriere,  String encadreur)  $default,) {final _that = this;
switch (_that) {
case _RequestAuthenSpiritualLife():
return $default(_that.statusSpirituel,_that.dateBaptme,_that.cellulePriere,_that.encadreur);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String statusSpirituel,  String dateBaptme,  String cellulePriere,  String encadreur)?  $default,) {final _that = this;
switch (_that) {
case _RequestAuthenSpiritualLife() when $default != null:
return $default(_that.statusSpirituel,_that.dateBaptme,_that.cellulePriere,_that.encadreur);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestAuthenSpiritualLife implements RequestAuthenSpiritualLife {
   _RequestAuthenSpiritualLife({required this.statusSpirituel, required this.dateBaptme, required this.cellulePriere, required this.encadreur});
  factory _RequestAuthenSpiritualLife.fromJson(Map<String, dynamic> json) => _$RequestAuthenSpiritualLifeFromJson(json);

@override final  String statusSpirituel;
@override final  String dateBaptme;
@override final  String cellulePriere;
@override final  String encadreur;

/// Create a copy of RequestAuthenSpiritualLife
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestAuthenSpiritualLifeCopyWith<_RequestAuthenSpiritualLife> get copyWith => __$RequestAuthenSpiritualLifeCopyWithImpl<_RequestAuthenSpiritualLife>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestAuthenSpiritualLifeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestAuthenSpiritualLife&&(identical(other.statusSpirituel, statusSpirituel) || other.statusSpirituel == statusSpirituel)&&(identical(other.dateBaptme, dateBaptme) || other.dateBaptme == dateBaptme)&&(identical(other.cellulePriere, cellulePriere) || other.cellulePriere == cellulePriere)&&(identical(other.encadreur, encadreur) || other.encadreur == encadreur));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusSpirituel,dateBaptme,cellulePriere,encadreur);

@override
String toString() {
  return 'RequestAuthenSpiritualLife(statusSpirituel: $statusSpirituel, dateBaptme: $dateBaptme, cellulePriere: $cellulePriere, encadreur: $encadreur)';
}


}

/// @nodoc
abstract mixin class _$RequestAuthenSpiritualLifeCopyWith<$Res> implements $RequestAuthenSpiritualLifeCopyWith<$Res> {
  factory _$RequestAuthenSpiritualLifeCopyWith(_RequestAuthenSpiritualLife value, $Res Function(_RequestAuthenSpiritualLife) _then) = __$RequestAuthenSpiritualLifeCopyWithImpl;
@override @useResult
$Res call({
 String statusSpirituel, String dateBaptme, String cellulePriere, String encadreur
});




}
/// @nodoc
class __$RequestAuthenSpiritualLifeCopyWithImpl<$Res>
    implements _$RequestAuthenSpiritualLifeCopyWith<$Res> {
  __$RequestAuthenSpiritualLifeCopyWithImpl(this._self, this._then);

  final _RequestAuthenSpiritualLife _self;
  final $Res Function(_RequestAuthenSpiritualLife) _then;

/// Create a copy of RequestAuthenSpiritualLife
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusSpirituel = null,Object? dateBaptme = null,Object? cellulePriere = null,Object? encadreur = null,}) {
  return _then(_RequestAuthenSpiritualLife(
statusSpirituel: null == statusSpirituel ? _self.statusSpirituel : statusSpirituel // ignore: cast_nullable_to_non_nullable
as String,dateBaptme: null == dateBaptme ? _self.dateBaptme : dateBaptme // ignore: cast_nullable_to_non_nullable
as String,cellulePriere: null == cellulePriere ? _self.cellulePriere : cellulePriere // ignore: cast_nullable_to_non_nullable
as String,encadreur: null == encadreur ? _self.encadreur : encadreur // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RequestAuthenEngagement {

 String get departement; String get competence; String get disponibiliry;
/// Create a copy of RequestAuthenEngagement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestAuthenEngagementCopyWith<RequestAuthenEngagement> get copyWith => _$RequestAuthenEngagementCopyWithImpl<RequestAuthenEngagement>(this as RequestAuthenEngagement, _$identity);

  /// Serializes this RequestAuthenEngagement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestAuthenEngagement&&(identical(other.departement, departement) || other.departement == departement)&&(identical(other.competence, competence) || other.competence == competence)&&(identical(other.disponibiliry, disponibiliry) || other.disponibiliry == disponibiliry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,departement,competence,disponibiliry);

@override
String toString() {
  return 'RequestAuthenEngagement(departement: $departement, competence: $competence, disponibiliry: $disponibiliry)';
}


}

/// @nodoc
abstract mixin class $RequestAuthenEngagementCopyWith<$Res>  {
  factory $RequestAuthenEngagementCopyWith(RequestAuthenEngagement value, $Res Function(RequestAuthenEngagement) _then) = _$RequestAuthenEngagementCopyWithImpl;
@useResult
$Res call({
 String departement, String competence, String disponibiliry
});




}
/// @nodoc
class _$RequestAuthenEngagementCopyWithImpl<$Res>
    implements $RequestAuthenEngagementCopyWith<$Res> {
  _$RequestAuthenEngagementCopyWithImpl(this._self, this._then);

  final RequestAuthenEngagement _self;
  final $Res Function(RequestAuthenEngagement) _then;

/// Create a copy of RequestAuthenEngagement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? departement = null,Object? competence = null,Object? disponibiliry = null,}) {
  return _then(_self.copyWith(
departement: null == departement ? _self.departement : departement // ignore: cast_nullable_to_non_nullable
as String,competence: null == competence ? _self.competence : competence // ignore: cast_nullable_to_non_nullable
as String,disponibiliry: null == disponibiliry ? _self.disponibiliry : disponibiliry // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestAuthenEngagement].
extension RequestAuthenEngagementPatterns on RequestAuthenEngagement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestAuthenEngagement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestAuthenEngagement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestAuthenEngagement value)  $default,){
final _that = this;
switch (_that) {
case _RequestAuthenEngagement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestAuthenEngagement value)?  $default,){
final _that = this;
switch (_that) {
case _RequestAuthenEngagement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String departement,  String competence,  String disponibiliry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestAuthenEngagement() when $default != null:
return $default(_that.departement,_that.competence,_that.disponibiliry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String departement,  String competence,  String disponibiliry)  $default,) {final _that = this;
switch (_that) {
case _RequestAuthenEngagement():
return $default(_that.departement,_that.competence,_that.disponibiliry);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String departement,  String competence,  String disponibiliry)?  $default,) {final _that = this;
switch (_that) {
case _RequestAuthenEngagement() when $default != null:
return $default(_that.departement,_that.competence,_that.disponibiliry);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestAuthenEngagement implements RequestAuthenEngagement {
   _RequestAuthenEngagement({required this.departement, required this.competence, required this.disponibiliry});
  factory _RequestAuthenEngagement.fromJson(Map<String, dynamic> json) => _$RequestAuthenEngagementFromJson(json);

@override final  String departement;
@override final  String competence;
@override final  String disponibiliry;

/// Create a copy of RequestAuthenEngagement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestAuthenEngagementCopyWith<_RequestAuthenEngagement> get copyWith => __$RequestAuthenEngagementCopyWithImpl<_RequestAuthenEngagement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestAuthenEngagementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestAuthenEngagement&&(identical(other.departement, departement) || other.departement == departement)&&(identical(other.competence, competence) || other.competence == competence)&&(identical(other.disponibiliry, disponibiliry) || other.disponibiliry == disponibiliry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,departement,competence,disponibiliry);

@override
String toString() {
  return 'RequestAuthenEngagement(departement: $departement, competence: $competence, disponibiliry: $disponibiliry)';
}


}

/// @nodoc
abstract mixin class _$RequestAuthenEngagementCopyWith<$Res> implements $RequestAuthenEngagementCopyWith<$Res> {
  factory _$RequestAuthenEngagementCopyWith(_RequestAuthenEngagement value, $Res Function(_RequestAuthenEngagement) _then) = __$RequestAuthenEngagementCopyWithImpl;
@override @useResult
$Res call({
 String departement, String competence, String disponibiliry
});




}
/// @nodoc
class __$RequestAuthenEngagementCopyWithImpl<$Res>
    implements _$RequestAuthenEngagementCopyWith<$Res> {
  __$RequestAuthenEngagementCopyWithImpl(this._self, this._then);

  final _RequestAuthenEngagement _self;
  final $Res Function(_RequestAuthenEngagement) _then;

/// Create a copy of RequestAuthenEngagement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? departement = null,Object? competence = null,Object? disponibiliry = null,}) {
  return _then(_RequestAuthenEngagement(
departement: null == departement ? _self.departement : departement // ignore: cast_nullable_to_non_nullable
as String,competence: null == competence ? _self.competence : competence // ignore: cast_nullable_to_non_nullable
as String,disponibiliry: null == disponibiliry ? _self.disponibiliry : disponibiliry // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RequestAuthenProfileUpdateKey {

 String get menberId;
/// Create a copy of RequestAuthenProfileUpdateKey
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestAuthenProfileUpdateKeyCopyWith<RequestAuthenProfileUpdateKey> get copyWith => _$RequestAuthenProfileUpdateKeyCopyWithImpl<RequestAuthenProfileUpdateKey>(this as RequestAuthenProfileUpdateKey, _$identity);

  /// Serializes this RequestAuthenProfileUpdateKey to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestAuthenProfileUpdateKey&&(identical(other.menberId, menberId) || other.menberId == menberId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menberId);

@override
String toString() {
  return 'RequestAuthenProfileUpdateKey(menberId: $menberId)';
}


}

/// @nodoc
abstract mixin class $RequestAuthenProfileUpdateKeyCopyWith<$Res>  {
  factory $RequestAuthenProfileUpdateKeyCopyWith(RequestAuthenProfileUpdateKey value, $Res Function(RequestAuthenProfileUpdateKey) _then) = _$RequestAuthenProfileUpdateKeyCopyWithImpl;
@useResult
$Res call({
 String menberId
});




}
/// @nodoc
class _$RequestAuthenProfileUpdateKeyCopyWithImpl<$Res>
    implements $RequestAuthenProfileUpdateKeyCopyWith<$Res> {
  _$RequestAuthenProfileUpdateKeyCopyWithImpl(this._self, this._then);

  final RequestAuthenProfileUpdateKey _self;
  final $Res Function(RequestAuthenProfileUpdateKey) _then;

/// Create a copy of RequestAuthenProfileUpdateKey
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? menberId = null,}) {
  return _then(_self.copyWith(
menberId: null == menberId ? _self.menberId : menberId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestAuthenProfileUpdateKey].
extension RequestAuthenProfileUpdateKeyPatterns on RequestAuthenProfileUpdateKey {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestAuthenProfileUpdateKey value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestAuthenProfileUpdateKey() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestAuthenProfileUpdateKey value)  $default,){
final _that = this;
switch (_that) {
case _RequestAuthenProfileUpdateKey():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestAuthenProfileUpdateKey value)?  $default,){
final _that = this;
switch (_that) {
case _RequestAuthenProfileUpdateKey() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String menberId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestAuthenProfileUpdateKey() when $default != null:
return $default(_that.menberId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String menberId)  $default,) {final _that = this;
switch (_that) {
case _RequestAuthenProfileUpdateKey():
return $default(_that.menberId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String menberId)?  $default,) {final _that = this;
switch (_that) {
case _RequestAuthenProfileUpdateKey() when $default != null:
return $default(_that.menberId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestAuthenProfileUpdateKey implements RequestAuthenProfileUpdateKey {
   _RequestAuthenProfileUpdateKey({required this.menberId});
  factory _RequestAuthenProfileUpdateKey.fromJson(Map<String, dynamic> json) => _$RequestAuthenProfileUpdateKeyFromJson(json);

@override final  String menberId;

/// Create a copy of RequestAuthenProfileUpdateKey
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestAuthenProfileUpdateKeyCopyWith<_RequestAuthenProfileUpdateKey> get copyWith => __$RequestAuthenProfileUpdateKeyCopyWithImpl<_RequestAuthenProfileUpdateKey>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestAuthenProfileUpdateKeyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestAuthenProfileUpdateKey&&(identical(other.menberId, menberId) || other.menberId == menberId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menberId);

@override
String toString() {
  return 'RequestAuthenProfileUpdateKey(menberId: $menberId)';
}


}

/// @nodoc
abstract mixin class _$RequestAuthenProfileUpdateKeyCopyWith<$Res> implements $RequestAuthenProfileUpdateKeyCopyWith<$Res> {
  factory _$RequestAuthenProfileUpdateKeyCopyWith(_RequestAuthenProfileUpdateKey value, $Res Function(_RequestAuthenProfileUpdateKey) _then) = __$RequestAuthenProfileUpdateKeyCopyWithImpl;
@override @useResult
$Res call({
 String menberId
});




}
/// @nodoc
class __$RequestAuthenProfileUpdateKeyCopyWithImpl<$Res>
    implements _$RequestAuthenProfileUpdateKeyCopyWith<$Res> {
  __$RequestAuthenProfileUpdateKeyCopyWithImpl(this._self, this._then);

  final _RequestAuthenProfileUpdateKey _self;
  final $Res Function(_RequestAuthenProfileUpdateKey) _then;

/// Create a copy of RequestAuthenProfileUpdateKey
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? menberId = null,}) {
  return _then(_RequestAuthenProfileUpdateKey(
menberId: null == menberId ? _self.menberId : menberId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RequestAuthenProfileUpdateImage {

 String get profileImage; String get menberId;
/// Create a copy of RequestAuthenProfileUpdateImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestAuthenProfileUpdateImageCopyWith<RequestAuthenProfileUpdateImage> get copyWith => _$RequestAuthenProfileUpdateImageCopyWithImpl<RequestAuthenProfileUpdateImage>(this as RequestAuthenProfileUpdateImage, _$identity);

  /// Serializes this RequestAuthenProfileUpdateImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestAuthenProfileUpdateImage&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.menberId, menberId) || other.menberId == menberId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profileImage,menberId);

@override
String toString() {
  return 'RequestAuthenProfileUpdateImage(profileImage: $profileImage, menberId: $menberId)';
}


}

/// @nodoc
abstract mixin class $RequestAuthenProfileUpdateImageCopyWith<$Res>  {
  factory $RequestAuthenProfileUpdateImageCopyWith(RequestAuthenProfileUpdateImage value, $Res Function(RequestAuthenProfileUpdateImage) _then) = _$RequestAuthenProfileUpdateImageCopyWithImpl;
@useResult
$Res call({
 String profileImage, String menberId
});




}
/// @nodoc
class _$RequestAuthenProfileUpdateImageCopyWithImpl<$Res>
    implements $RequestAuthenProfileUpdateImageCopyWith<$Res> {
  _$RequestAuthenProfileUpdateImageCopyWithImpl(this._self, this._then);

  final RequestAuthenProfileUpdateImage _self;
  final $Res Function(RequestAuthenProfileUpdateImage) _then;

/// Create a copy of RequestAuthenProfileUpdateImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profileImage = null,Object? menberId = null,}) {
  return _then(_self.copyWith(
profileImage: null == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String,menberId: null == menberId ? _self.menberId : menberId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestAuthenProfileUpdateImage].
extension RequestAuthenProfileUpdateImagePatterns on RequestAuthenProfileUpdateImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestAuthenProfileUpdateImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestAuthenProfileUpdateImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestAuthenProfileUpdateImage value)  $default,){
final _that = this;
switch (_that) {
case _RequestAuthenProfileUpdateImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestAuthenProfileUpdateImage value)?  $default,){
final _that = this;
switch (_that) {
case _RequestAuthenProfileUpdateImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String profileImage,  String menberId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestAuthenProfileUpdateImage() when $default != null:
return $default(_that.profileImage,_that.menberId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String profileImage,  String menberId)  $default,) {final _that = this;
switch (_that) {
case _RequestAuthenProfileUpdateImage():
return $default(_that.profileImage,_that.menberId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String profileImage,  String menberId)?  $default,) {final _that = this;
switch (_that) {
case _RequestAuthenProfileUpdateImage() when $default != null:
return $default(_that.profileImage,_that.menberId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestAuthenProfileUpdateImage implements RequestAuthenProfileUpdateImage {
   _RequestAuthenProfileUpdateImage({required this.profileImage, required this.menberId});
  factory _RequestAuthenProfileUpdateImage.fromJson(Map<String, dynamic> json) => _$RequestAuthenProfileUpdateImageFromJson(json);

@override final  String profileImage;
@override final  String menberId;

/// Create a copy of RequestAuthenProfileUpdateImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestAuthenProfileUpdateImageCopyWith<_RequestAuthenProfileUpdateImage> get copyWith => __$RequestAuthenProfileUpdateImageCopyWithImpl<_RequestAuthenProfileUpdateImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestAuthenProfileUpdateImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestAuthenProfileUpdateImage&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.menberId, menberId) || other.menberId == menberId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profileImage,menberId);

@override
String toString() {
  return 'RequestAuthenProfileUpdateImage(profileImage: $profileImage, menberId: $menberId)';
}


}

/// @nodoc
abstract mixin class _$RequestAuthenProfileUpdateImageCopyWith<$Res> implements $RequestAuthenProfileUpdateImageCopyWith<$Res> {
  factory _$RequestAuthenProfileUpdateImageCopyWith(_RequestAuthenProfileUpdateImage value, $Res Function(_RequestAuthenProfileUpdateImage) _then) = __$RequestAuthenProfileUpdateImageCopyWithImpl;
@override @useResult
$Res call({
 String profileImage, String menberId
});




}
/// @nodoc
class __$RequestAuthenProfileUpdateImageCopyWithImpl<$Res>
    implements _$RequestAuthenProfileUpdateImageCopyWith<$Res> {
  __$RequestAuthenProfileUpdateImageCopyWithImpl(this._self, this._then);

  final _RequestAuthenProfileUpdateImage _self;
  final $Res Function(_RequestAuthenProfileUpdateImage) _then;

/// Create a copy of RequestAuthenProfileUpdateImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profileImage = null,Object? menberId = null,}) {
  return _then(_RequestAuthenProfileUpdateImage(
profileImage: null == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String,menberId: null == menberId ? _self.menberId : menberId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
