import 'package:istorya/core/providers/common_providers.dart';
import 'package:istorya/feature/auth/data/models/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/datasources/auth_api.dart';
import '../data/repositories/auth_repository.dart';

part 'auth_provider.g.dart';

@riverpod
AuthAPI authAPI(Ref ref) => AuthAPI(ref.watch(httpClientProvider));

@riverpod
AuthRepository authRepository(Ref ref) => AuthRepository(
  ref.watch(authAPIProvider),
  ref.watch(secureStorageProvider),
);

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  Future<User?> build() async {
    return await ref.read(authRepositoryProvider).getUser();
  }

  Future<void> login(String email, String password) async {
    try {
      state = const AsyncLoading();
      final user = await ref
          .read(authRepositoryProvider)
          .login(email, password);
      state = AsyncData(user);
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
