import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/local/database_helper.dart';
import '../datasources/remote/post_api_service.dart';
import '../models/post_model.dart';

class PostRepositoryImpl implements PostRepository {
  final PostApiService apiService;
  final DatabaseHelper databaseHelper;

  PostRepositoryImpl({
    required this.apiService,
    required this.databaseHelper,
  });

  @override
  Stream<List<Post>> getPosts() async* {
    // 1. Fetch from local database
    try {
      final localPosts = await databaseHelper.getPosts();
      if (localPosts.isNotEmpty) {
        yield localPosts.map((model) => model.toEntity()).toList();
      }
    } catch (e) {
      // Handle local DB error or ignore to let remote attempt happen
    }

    // 2. Fetch from remote API
    try {
      final remotePosts = await apiService.fetchPosts();
      
      // 3. Update local database
      await databaseHelper.clearPosts();
      await databaseHelper.insertPosts(remotePosts);

      // 4. Yield fresh data
      yield remotePosts.map((model) => model.toEntity()).toList();
    } catch (e) {
      // If remote fetch fails and we already yielded local data, we just end the stream
      // Alternatively, we could yield an error or throw.
      // But for offline-first, if there's no internet, we just rely on the local data.
    }
  }
}
