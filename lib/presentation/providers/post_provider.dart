import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/local/database_helper.dart';
import '../../data/datasources/remote/post_api_service.dart';
import '../../data/repositories/post_repository_impl.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../../domain/usecases/get_posts_usecase.dart';

part 'post_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  return Dio();
}

@Riverpod(keepAlive: true)
PostApiService postApiService(Ref ref) {
  return PostApiService(ref.watch(dioProvider));
}

@Riverpod(keepAlive: true)
DatabaseHelper databaseHelper(Ref ref) {
  return DatabaseHelper.instance;
}

@Riverpod(keepAlive: true)
PostRepository postRepository(Ref ref) {
  return PostRepositoryImpl(
    apiService: ref.watch(postApiServiceProvider),
    databaseHelper: ref.watch(databaseHelperProvider),
  );
}

@Riverpod(keepAlive: true)
GetPostsUseCase getPostsUseCase(Ref ref) {
  return GetPostsUseCase(ref.watch(postRepositoryProvider));
}

@riverpod
Stream<List<Post>> posts(Ref ref) {
  return ref.watch(getPostsUseCaseProvider).call();
}
