import '../entities/post.dart';

abstract class PostRepository {
  /// Yields a list of posts. 
  /// The stream will first emit data from the local database (if any), 
  /// and then fetch from the remote API, update the local database, 
  /// and emit the fresh data.
  Stream<List<Post>> getPosts();
}
