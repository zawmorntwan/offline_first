// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outbox_mutation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OutboxMutation {

 String get id; String get method; String get path; String get payload; int get createdAt; int get retryCount; String get localEntityId;
/// Create a copy of OutboxMutation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutboxMutationCopyWith<OutboxMutation> get copyWith => _$OutboxMutationCopyWithImpl<OutboxMutation>(this as OutboxMutation, _$identity);

  /// Serializes this OutboxMutation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutboxMutation&&(identical(other.id, id) || other.id == id)&&(identical(other.method, method) || other.method == method)&&(identical(other.path, path) || other.path == path)&&(identical(other.payload, payload) || other.payload == payload)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.retryCount, retryCount) || other.retryCount == retryCount)&&(identical(other.localEntityId, localEntityId) || other.localEntityId == localEntityId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,method,path,payload,createdAt,retryCount,localEntityId);

@override
String toString() {
  return 'OutboxMutation(id: $id, method: $method, path: $path, payload: $payload, createdAt: $createdAt, retryCount: $retryCount, localEntityId: $localEntityId)';
}


}

/// @nodoc
abstract mixin class $OutboxMutationCopyWith<$Res>  {
  factory $OutboxMutationCopyWith(OutboxMutation value, $Res Function(OutboxMutation) _then) = _$OutboxMutationCopyWithImpl;
@useResult
$Res call({
 String id, String method, String path, String payload, int createdAt, int retryCount, String localEntityId
});




}
/// @nodoc
class _$OutboxMutationCopyWithImpl<$Res>
    implements $OutboxMutationCopyWith<$Res> {
  _$OutboxMutationCopyWithImpl(this._self, this._then);

  final OutboxMutation _self;
  final $Res Function(OutboxMutation) _then;

/// Create a copy of OutboxMutation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? method = null,Object? path = null,Object? payload = null,Object? createdAt = null,Object? retryCount = null,Object? localEntityId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int,retryCount: null == retryCount ? _self.retryCount : retryCount // ignore: cast_nullable_to_non_nullable
as int,localEntityId: null == localEntityId ? _self.localEntityId : localEntityId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OutboxMutation].
extension OutboxMutationPatterns on OutboxMutation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OutboxMutation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OutboxMutation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OutboxMutation value)  $default,){
final _that = this;
switch (_that) {
case _OutboxMutation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OutboxMutation value)?  $default,){
final _that = this;
switch (_that) {
case _OutboxMutation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String method,  String path,  String payload,  int createdAt,  int retryCount,  String localEntityId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OutboxMutation() when $default != null:
return $default(_that.id,_that.method,_that.path,_that.payload,_that.createdAt,_that.retryCount,_that.localEntityId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String method,  String path,  String payload,  int createdAt,  int retryCount,  String localEntityId)  $default,) {final _that = this;
switch (_that) {
case _OutboxMutation():
return $default(_that.id,_that.method,_that.path,_that.payload,_that.createdAt,_that.retryCount,_that.localEntityId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String method,  String path,  String payload,  int createdAt,  int retryCount,  String localEntityId)?  $default,) {final _that = this;
switch (_that) {
case _OutboxMutation() when $default != null:
return $default(_that.id,_that.method,_that.path,_that.payload,_that.createdAt,_that.retryCount,_that.localEntityId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OutboxMutation implements OutboxMutation {
  const _OutboxMutation({required this.id, required this.method, required this.path, required this.payload, required this.createdAt, this.retryCount = 0, required this.localEntityId});
  factory _OutboxMutation.fromJson(Map<String, dynamic> json) => _$OutboxMutationFromJson(json);

@override final  String id;
@override final  String method;
@override final  String path;
@override final  String payload;
@override final  int createdAt;
@override@JsonKey() final  int retryCount;
@override final  String localEntityId;

/// Create a copy of OutboxMutation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutboxMutationCopyWith<_OutboxMutation> get copyWith => __$OutboxMutationCopyWithImpl<_OutboxMutation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OutboxMutationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutboxMutation&&(identical(other.id, id) || other.id == id)&&(identical(other.method, method) || other.method == method)&&(identical(other.path, path) || other.path == path)&&(identical(other.payload, payload) || other.payload == payload)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.retryCount, retryCount) || other.retryCount == retryCount)&&(identical(other.localEntityId, localEntityId) || other.localEntityId == localEntityId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,method,path,payload,createdAt,retryCount,localEntityId);

@override
String toString() {
  return 'OutboxMutation(id: $id, method: $method, path: $path, payload: $payload, createdAt: $createdAt, retryCount: $retryCount, localEntityId: $localEntityId)';
}


}

/// @nodoc
abstract mixin class _$OutboxMutationCopyWith<$Res> implements $OutboxMutationCopyWith<$Res> {
  factory _$OutboxMutationCopyWith(_OutboxMutation value, $Res Function(_OutboxMutation) _then) = __$OutboxMutationCopyWithImpl;
@override @useResult
$Res call({
 String id, String method, String path, String payload, int createdAt, int retryCount, String localEntityId
});




}
/// @nodoc
class __$OutboxMutationCopyWithImpl<$Res>
    implements _$OutboxMutationCopyWith<$Res> {
  __$OutboxMutationCopyWithImpl(this._self, this._then);

  final _OutboxMutation _self;
  final $Res Function(_OutboxMutation) _then;

/// Create a copy of OutboxMutation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? method = null,Object? path = null,Object? payload = null,Object? createdAt = null,Object? retryCount = null,Object? localEntityId = null,}) {
  return _then(_OutboxMutation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int,retryCount: null == retryCount ? _self.retryCount : retryCount // ignore: cast_nullable_to_non_nullable
as int,localEntityId: null == localEntityId ? _self.localEntityId : localEntityId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
