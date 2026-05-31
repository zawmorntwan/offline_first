// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostModel _$PostModelFromJson(Map<String, dynamic> json) => _PostModel(
  id: json['id'],
  userId: (json['userId'] as num).toInt(),
  title: json['title'] as String,
  body: json['body'] as String,
  isSyncPending: (json['isSyncPending'] as num?)?.toInt() ?? 0,
  hasSyncFailed: (json['hasSyncFailed'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$PostModelToJson(_PostModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'body': instance.body,
      'isSyncPending': instance.isSyncPending,
      'hasSyncFailed': instance.hasSyncFailed,
    };
