import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/post_provider.dart';

class ConnectivityBanner extends ConsumerWidget {
  final Widget child;

  const ConnectivityBanner({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOnlineAsync = ref.watch(isOnlineProvider);
    final outboxAsync = ref.watch(outboxMutationsProvider);

    final bool isOffline = isOnlineAsync.value == false;
    final bool hasPendingSync = (outboxAsync.value?.isNotEmpty ?? false);

    return Column(
      children: [
        if (isOffline && hasPendingSync)
          Container(
            color: Colors.amber,
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              'You\'re offline — changes will sync when connected',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
            ),
          ),
        Expanded(child: child),
      ],
    );
  }
}
