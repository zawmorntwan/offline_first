import '../entities/post.dart';
import '../entities/outbox_mutation.dart';

abstract class PostRepository {
  /// Yields a list of posts. 
  /// The stream will first emit data from the local database (if any), 
  /// and then fetch from the remote API, update the local database, 
  /// and emit the fresh data.
  Stream<List<Post>> getPosts();

  /// Create a new post (offline first).
  Future<void> createPost(Post post);

  /// Get the current outbox mutations.
  Stream<List<OutboxMutation>> getOutbox();

  /// Sync all pending outbox mutations.
  Future<void> syncOutbox();

  /// Delete an outbox mutation (e.g. discard failed item)
  Future<void> discardOutboxMutation(String id);
}
