import 'package:istorya/core/providers/common_providers.dart';
import 'package:istorya/feature/auth/models/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'auth_api.dart';
import 'auth_repository.dart';

part 'auth_provider.g.dart';

@riverpod
AuthAPI authAPI(Ref ref) => AuthAPI(ref.watch(httpClientProvider));

@riverpod
AuthRepository authRepository(Ref ref) => AuthRepository(
  ref.watch(authAPIProvider),
  ref.watch(secureStorageProvider),
);

@riverpod
class AuthProvider extends _$AuthProvider {
  @override
  Future<User?> build() async {
    return await ref.read(authRepositoryProvider).getUser();
  }

  Future<void> login(String email, String password) async {
    try {
      state = const AsyncLoading();
      final authResponse = await ref
          .read(authRepositoryProvider)
          .login(email, password);
      state = AsyncData(authResponse.user);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> logout() async {
    try {
      await ref.read(authRepositoryProvider).logout();
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
