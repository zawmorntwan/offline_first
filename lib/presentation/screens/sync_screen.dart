import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/post_provider.dart';

class SyncScreen extends ConsumerWidget {
  const SyncScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final outboxAsync = ref.watch(outboxMutationsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sync Settings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: () {
              ref.read(postRepositoryProvider).syncOutbox();
              ref.invalidate(outboxMutationsProvider);
              ref.invalidate(postsProvider);
            },
            tooltip: 'Sync Now',
          )
        ],
      ),
      body: outboxAsync.when(
        data: (mutations) {
          if (mutations.isEmpty) {
            return const Center(child: Text('No pending sync items.'));
          }
          return ListView.builder(
            itemCount: mutations.length,
            itemBuilder: (context, index) {
              final mutation = mutations[index];
              return ListTile(
                leading: const Icon(Icons.cloud_upload),
                title: Text('\${mutation.method} \${mutation.path}'),
                subtitle: Text('Retries: \${mutation.retryCount}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () async {
                    final confirm = await showDialog<bool>(
                      context: context,
                      builder: (c) => AlertDialog(
                        title: const Text('Discard item?'),
                        content: const Text('This will permanently delete this pending change.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(c, false),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(c, true),
                            child: const Text('Discard', style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    );

                    if (confirm == true) {
                      await ref.read(postRepositoryProvider).discardOutboxMutation(mutation.id);
                      ref.invalidate(outboxMutationsProvider);
                      ref.invalidate(postsProvider);
                    }
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: \$err')),
      ),
    );
  }
}
