// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dio)
final dioProvider = DioProvider._();

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'fe8960d513b40b38c3d2d1c5e5d493532cf85cfe';

@ProviderFor(postApiService)
final postApiServiceProvider = PostApiServiceProvider._();

final class PostApiServiceProvider
    extends $FunctionalProvider<PostApiService, PostApiService, PostApiService>
    with $Provider<PostApiService> {
  PostApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postApiServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postApiServiceHash();

  @$internal
  @override
  $ProviderElement<PostApiService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PostApiService create(Ref ref) {
    return postApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostApiService>(value),
    );
  }
}

String _$postApiServiceHash() => r'875bbc874bc20490bab599a5fcdc7282048f9c76';

@ProviderFor(databaseHelper)
final databaseHelperProvider = DatabaseHelperProvider._();

final class DatabaseHelperProvider
    extends $FunctionalProvider<DatabaseHelper, DatabaseHelper, DatabaseHelper>
    with $Provider<DatabaseHelper> {
  DatabaseHelperProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'databaseHelperProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$databaseHelperHash();

  @$internal
  @override
  $ProviderElement<DatabaseHelper> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DatabaseHelper create(Ref ref) {
    return databaseHelper(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DatabaseHelper value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DatabaseHelper>(value),
    );
  }
}

String _$databaseHelperHash() => r'3c872a6be504a5942fbf7213cf260628ebc873ed';

@ProviderFor(postRepository)
final postRepositoryProvider = PostRepositoryProvider._();

final class PostRepositoryProvider
    extends $FunctionalProvider<PostRepository, PostRepository, PostRepository>
    with $Provider<PostRepository> {
  PostRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postRepositoryHash();

  @$internal
  @override
  $ProviderElement<PostRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PostRepository create(Ref ref) {
    return postRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostRepository>(value),
    );
  }
}

String _$postRepositoryHash() => r'e660b985781222a903cb92a44d4a3d42482a0ed3';

@ProviderFor(getPostsUseCase)
final getPostsUseCaseProvider = GetPostsUseCaseProvider._();

final class GetPostsUseCaseProvider
    extends
        $FunctionalProvider<GetPostsUseCase, GetPostsUseCase, GetPostsUseCase>
    with $Provider<GetPostsUseCase> {
  GetPostsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPostsUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPostsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetPostsUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetPostsUseCase create(Ref ref) {
    return getPostsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetPostsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetPostsUseCase>(value),
    );
  }
}

String _$getPostsUseCaseHash() => r'1c0a6faa4afac7ca487f9f44974b390a8745fbfa';

@ProviderFor(connectivityService)
final connectivityServiceProvider = ConnectivityServiceProvider._();

final class ConnectivityServiceProvider
    extends
        $FunctionalProvider<
          ConnectivityService,
          ConnectivityService,
          ConnectivityService
        >
    with $Provider<ConnectivityService> {
  ConnectivityServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectivityServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectivityServiceHash();

  @$internal
  @override
  $ProviderElement<ConnectivityService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ConnectivityService create(Ref ref) {
    return connectivityService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConnectivityService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConnectivityService>(value),
    );
  }
}

String _$connectivityServiceHash() =>
    r'95e1b48f96e075c047a46e92aa33a19a18e68e05';

@ProviderFor(syncOrchestrator)
final syncOrchestratorProvider = SyncOrchestratorProvider._();

final class SyncOrchestratorProvider
    extends
        $FunctionalProvider<
          SyncOrchestrator,
          SyncOrchestrator,
          SyncOrchestrator
        >
    with $Provider<SyncOrchestrator> {
  SyncOrchestratorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncOrchestratorProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncOrchestratorHash();

  @$internal
  @override
  $ProviderElement<SyncOrchestrator> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SyncOrchestrator create(Ref ref) {
    return syncOrchestrator(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SyncOrchestrator value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SyncOrchestrator>(value),
    );
  }
}

String _$syncOrchestratorHash() => r'b117b843a651a9da4d650abdeebd2ef37cacba9e';

@ProviderFor(posts)
final postsProvider = PostsProvider._();

final class PostsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Post>>,
          List<Post>,
          Stream<List<Post>>
        >
    with $FutureModifier<List<Post>>, $StreamProvider<List<Post>> {
  PostsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postsHash();

  @$internal
  @override
  $StreamProviderElement<List<Post>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Post>> create(Ref ref) {
    return posts(ref);
  }
}

String _$postsHash() => r'73d14a610f1d6c9144cf372ae733aeb42831906d';

@ProviderFor(outboxMutations)
final outboxMutationsProvider = OutboxMutationsProvider._();

final class OutboxMutationsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<OutboxMutation>>,
          List<OutboxMutation>,
          Stream<List<OutboxMutation>>
        >
    with
        $FutureModifier<List<OutboxMutation>>,
        $StreamProvider<List<OutboxMutation>> {
  OutboxMutationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'outboxMutationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$outboxMutationsHash();

  @$internal
  @override
  $StreamProviderElement<List<OutboxMutation>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<OutboxMutation>> create(Ref ref) {
    return outboxMutations(ref);
  }
}

String _$outboxMutationsHash() => r'6058a2768efb62151295d2ba9e0aaa2532f38ebb';

@ProviderFor(isOnline)
final isOnlineProvider = IsOnlineProvider._();

final class IsOnlineProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  IsOnlineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isOnlineProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isOnlineHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return isOnline(ref);
  }
}

String _$isOnlineHash() => r'b97bf97d1cda8b90f0930a54aa2225492a8f175e';
