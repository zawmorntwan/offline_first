import 'dart:convert';
import 'package:uuid/uuid.dart';
import '../../domain/entities/post.dart';
import '../../domain/entities/outbox_mutation.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/local/database_helper.dart';
import '../datasources/remote/post_api_service.dart';
import '../models/post_model.dart';

class PostRepositoryImpl implements PostRepository {
  final PostApiService apiService;
  final DatabaseHelper databaseHelper;
  final Uuid _uuid = const Uuid();

  PostRepositoryImpl({
    required this.apiService,
    required this.databaseHelper,
  });

  @override
  Stream<List<Post>> getPosts() async* {
    // 1. Fetch from local database (including pending offline ones)
    try {
      final localPosts = await databaseHelper.getPosts();
      if (localPosts.isNotEmpty) {
        yield localPosts.map((model) => model.toEntity()).toList();
      } else {
        yield [];
      }
    } catch (e) {
      // Ignored
    }

    // 2. Fetch from remote API
    try {
      final remotePosts = await apiService.fetchPosts();
      
      // 3. Update local database (clear non-pending, insert new)
      await databaseHelper.clearNonPendingPosts();
      await databaseHelper.insertPosts(remotePosts);

      // 4. Fetch the merged set from DB to ensure UI has both pending and remote
      final mergedPosts = await databaseHelper.getPosts();
      yield mergedPosts.map((model) => model.toEntity()).toList();
    } catch (e) {
      // Offline: just rely on local data yielded above
    }
  }

  @override
  Future<void> createPost(Post post) async {
    final String localId = _uuid.v4();
    
    // 1. Save to local DB with pending flag
    final model = post.copyWith(id: localId, isSyncPending: true).toModel();
    await databaseHelper.insertPost(model);

    // 2. Create OutboxMutation
    final payload = {
      'title': post.title,
      'body': post.body,
      'userId': post.userId,
    };
    
    final mutation = OutboxMutation(
      id: _uuid.v4(),
      method: 'POST',
      path: '/posts',
      payload: jsonEncode(payload),
      createdAt: DateTime.now().millisecondsSinceEpoch,
      localEntityId: localId,
    );

    await databaseHelper.insertOutboxMutation(mutation);
  }

  @override
  Stream<List<OutboxMutation>> getOutbox() async* {
    while (true) {
      final mutations = await databaseHelper.getOutboxMutations();
      yield mutations;
      await Future.delayed(const Duration(seconds: 2)); // Simple polling for now
    }
  }

  @override
  Future<void> syncOutbox() async {
    final mutations = await databaseHelper.getOutboxMutations();

    for (final mutation in mutations) {
      try {
        if (mutation.method == 'POST') {
          final payload = jsonDecode(mutation.payload);
          final serverPost = await apiService.createPost(payload);

          // Delete the fake local post and the outbox mutation
          await databaseHelper.deletePost(mutation.localEntityId);
          await databaseHelper.deleteOutboxMutation(mutation.id);

          // Insert the real server post
          await databaseHelper.insertPost(serverPost);
        }
      } catch (e) {
        // Mark as failed and increment retry
        await databaseHelper.incrementOutboxRetryCount(mutation.id);
        await databaseHelper.markPostSyncFailed(mutation.localEntityId, true);
      }
    }
  }

  @override
  Future<void> discardOutboxMutation(String id) async {
    final mutations = await databaseHelper.getOutboxMutations();
    final mutation = mutations.firstWhere((m) => m.id == id);
    
    // Discard mutation and delete associated local pending entity
    await databaseHelper.deletePost(mutation.localEntityId);
    await databaseHelper.deleteOutboxMutation(id);
  }
}
