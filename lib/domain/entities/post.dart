import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

@freezed
abstract class Post with _$Post {
  const factory Post({
    required String id,
    required int userId,
    required String title,
    required String body,
    @Default(false) bool isSyncPending,
    @Default(false) bool hasSyncFailed,
  }) = _Post;
}
