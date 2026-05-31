import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:rxdart/rxdart.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  final InternetConnection _internetConnection = InternetConnection();

  /// Debounced stream emitting `true` if actual internet is reachable, `false` otherwise.
  Stream<bool> get isOnlineStream {
    return _connectivity.onConnectivityChanged
        // Watch for connectivity interface changes
        .debounceTime(const Duration(milliseconds: 500))
        .asyncMap((result) async {
      // Even if WiFi is connected, check for actual internet reachability
      return await _internetConnection.hasInternetAccess;
    }).distinct();
  }

  Future<bool> get isOnline async {
    return await _internetConnection.hasInternetAccess;
  }
}
