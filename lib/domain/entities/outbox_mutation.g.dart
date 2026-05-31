// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outbox_mutation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OutboxMutation _$OutboxMutationFromJson(Map<String, dynamic> json) =>
    _OutboxMutation(
      id: json['id'] as String,
      method: json['method'] as String,
      path: json['path'] as String,
      payload: json['payload'] as String,
      createdAt: (json['createdAt'] as num).toInt(),
      retryCount: (json['retryCount'] as num?)?.toInt() ?? 0,
      localEntityId: json['localEntityId'] as String,
    );

Map<String, dynamic> _$OutboxMutationToJson(_OutboxMutation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'method': instance.method,
      'path': instance.path,
      'payload': instance.payload,
      'createdAt': instance.createdAt,
      'retryCount': instance.retryCount,
      'localEntityId': instance.localEntityId,
    };
