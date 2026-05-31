import 'package:freezed_annotation/freezed_annotation.dart';

part 'outbox_mutation.freezed.dart';
part 'outbox_mutation.g.dart';

@freezed
abstract class OutboxMutation with _$OutboxMutation {
  const factory OutboxMutation({
    required String id,
    required String method,
    required String path,
    required String payload,
    required int createdAt,
    @Default(0) int retryCount,
    required String localEntityId,
  }) = _OutboxMutation;

  factory OutboxMutation.fromJson(Map<String, dynamic> json) => _$OutboxMutationFromJson(json);
}
