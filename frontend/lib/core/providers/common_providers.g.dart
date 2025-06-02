// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(httpClient)
const httpClientProvider = HttpClientProvider._();

final class HttpClientProvider
    extends $FunctionalProvider<http.Client, http.Client>
    with $Provider<http.Client> {
  const HttpClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'httpClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$httpClientHash();

  @$internal
  @override
  $ProviderElement<http.Client> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  http.Client create(Ref ref) {
    return httpClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(http.Client value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<http.Client>(value),
    );
  }
}

String _$httpClientHash() => r'7f0620a393673068316af3b9d3fe7fff063ec774';

@ProviderFor(secureStorage)
const secureStorageProvider = SecureStorageProvider._();

final class SecureStorageProvider
    extends $FunctionalProvider<FlutterSecureStorage, FlutterSecureStorage>
    with $Provider<FlutterSecureStorage> {
  const SecureStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'secureStorageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$secureStorageHash();

  @$internal
  @override
  $ProviderElement<FlutterSecureStorage> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FlutterSecureStorage create(Ref ref) {
    return secureStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlutterSecureStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<FlutterSecureStorage>(value),
    );
  }
}

String _$secureStorageHash() => r'5f0f1e7075cbfc89c9f88bceffd63f21bf812b87';

@ProviderFor(socketService)
const socketServiceProvider = SocketServiceProvider._();

final class SocketServiceProvider
    extends $FunctionalProvider<SocketService, SocketService>
    with $Provider<SocketService> {
  const SocketServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'socketServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$socketServiceHash();

  @$internal
  @override
  $ProviderElement<SocketService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SocketService create(Ref ref) {
    return socketService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SocketService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<SocketService>(value),
    );
  }
}

String _$socketServiceHash() => r'9747a79a7fbc36111e25fab1d6659e3af916b249';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
