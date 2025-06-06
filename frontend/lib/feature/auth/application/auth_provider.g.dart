// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(authAPI)
const authAPIProvider = AuthAPIProvider._();

final class AuthAPIProvider extends $FunctionalProvider<AuthAPI, AuthAPI>
    with $Provider<AuthAPI> {
  const AuthAPIProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authAPIProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authAPIHash();

  @$internal
  @override
  $ProviderElement<AuthAPI> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthAPI create(Ref ref) {
    return authAPI(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthAPI value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<AuthAPI>(value),
    );
  }
}

String _$authAPIHash() => r'6fb63d923a91e271753068c9b48598667922eb92';

@ProviderFor(authRepository)
const authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  const AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'7e4e784659e33e5bba5fbfaeec696e612f3e28a0';

@ProviderFor(AuthNotifier)
const authNotifierProvider = AuthNotifierProvider._();

final class AuthNotifierProvider
    extends $AsyncNotifierProvider<AuthNotifier, User?> {
  const AuthNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authNotifierHash();

  @$internal
  @override
  AuthNotifier create() => AuthNotifier();

  @$internal
  @override
  $AsyncNotifierProviderElement<AuthNotifier, User?> $createElement(
    $ProviderPointer pointer,
  ) => $AsyncNotifierProviderElement(pointer);
}

String _$authNotifierHash() => r'd8bb6b8fd380f1a8f17daa05ee7df3ad1f1e9ccb';

abstract class _$AuthNotifier extends $AsyncNotifier<User?> {
  FutureOr<User?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<User?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<User?>>,
              AsyncValue<User?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
