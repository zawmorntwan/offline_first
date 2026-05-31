import 'dart:async';
import 'connectivity_service.dart';
import '../../domain/repositories/post_repository.dart';

class SyncOrchestrator {
  final ConnectivityService _connectivityService;
  final PostRepository _postRepository;
  StreamSubscription<bool>? _subscription;

  SyncOrchestrator(this._connectivityService, this._postRepository) {
    _init();
  }

  void _init() {
    _subscription = _connectivityService.isOnlineStream.listen((isOnline) {
      if (isOnline) {
        _postRepository.syncOutbox();
      }
    });
  }

  void dispose() {
    _subscription?.cancel();
  }
}
