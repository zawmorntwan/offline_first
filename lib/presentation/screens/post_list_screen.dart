import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/post.dart';
import '../providers/post_provider.dart';
import '../widgets/connectivity_banner.dart';
import 'sync_screen.dart';

class PostListScreen extends ConsumerStatefulWidget {
  const PostListScreen({super.key});

  @override
  ConsumerState<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends ConsumerState<PostListScreen> {
  
  @override
  void initState() {
    super.initState();
    // Initialize the sync orchestrator so it starts listening
    ref.read(syncOrchestratorProvider);
  }

  void _showCreatePostDialog() {
    final titleController = TextEditingController();
    final bodyController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Create Post'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: bodyController,
                decoration: const InputDecoration(labelText: 'Body'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final newPost = Post(
                  id: '', // Will be assigned UUID in repo
                  userId: 1, // hardcoded user
                  title: titleController.text,
                  body: bodyController.text,
                );
                await ref.read(postRepositoryProvider).createPost(newPost);
                
                if (!context.mounted) return;
                Navigator.pop(context);
                
                ref.invalidate(postsProvider);
                ref.invalidate(outboxMutationsProvider);
              },
              child: const Text('Create'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final postsAsyncValue = ref.watch(postsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Offline-First Posts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            tooltip: 'Sync Settings',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SyncScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(postsProvider);
            },
          ),
        ],
      ),
      body: ConnectivityBanner(
        child: postsAsyncValue.when(
          data: (posts) {
            if (posts.isEmpty) {
              return const Center(child: Text('No posts available.'));
            }
            return RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(postsProvider);
              },
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  
                  Widget? trailingIcon;
                  if (post.hasSyncFailed) {
                    trailingIcon = const Icon(Icons.warning, color: Colors.red);
                  } else if (post.isSyncPending) {
                    trailingIcon = const Icon(Icons.access_time, color: Colors.grey);
                  }

                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text(
                        post.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        post.body,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: CircleAvatar(
                        child: Text(post.id.substring(0, 1)),
                      ),
                      trailing: trailingIcon,
                    ),
                  );
                },
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, color: Colors.red, size: 48),
                const SizedBox(height: 16),
                Text('Error: \$error'),
                ElevatedButton(
                  onPressed: () => ref.invalidate(postsProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreatePostDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
