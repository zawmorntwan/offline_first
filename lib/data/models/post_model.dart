import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/post.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
abstract class PostModel with _$PostModel {
  const factory PostModel({
    required dynamic id,
    required int userId,
    required String title,
    required String body,
    @Default(0) int isSyncPending,
    @Default(0) int hasSyncFailed,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}

extension PostModelX on PostModel {
  Post toEntity() {
    return Post(
      id: id.toString(),
      userId: userId,
      title: title,
      body: body,
      isSyncPending: isSyncPending == 1,
      hasSyncFailed: hasSyncFailed == 1,
    );
  }
}

extension PostX on Post {
  PostModel toModel() {
    return PostModel(
      id: id,
      userId: userId,
      title: title,
      body: body,
      isSyncPending: isSyncPending ? 1 : 0,
      hasSyncFailed: hasSyncFailed ? 1 : 0,
    );
  }
}
