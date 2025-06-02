import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:istorya/core/constants/app_constants.dart';
import 'package:istorya/feature/auth/models/user.dart';
import 'auth_api.dart';

abstract class IAuthRepository {
  Future<User> login(String email, String password);
  Future<void> logout();
  Future<String?> getToken();
  Future<User?> getUser();
  Future<bool> isLoggedIn();
}

class AuthRepository implements IAuthRepository {
  final AuthAPI api;
  final FlutterSecureStorage storage;

  AuthRepository(this.api, this.storage);

  @override
  Future<User> login(String email, String password) async {
    final authResponse = await api.login(email, password);
    await storage.write(key: AppConstants.tokenKey, value: authResponse.token);
    await storage.write(
      key: AppConstants.userKey,
      value: jsonEncode(authResponse.user.toJson()),
    );
    return authResponse.user;
  }

  @override
  Future<void> logout() async {
    final token = await getToken();
    if (token != null) await api.logout(token);
    await storage.delete(key: AppConstants.tokenKey);
    await storage.delete(key: AppConstants.userKey);
  }

  @override
  Future<String?> getToken() => storage.read(key: AppConstants.tokenKey);

  @override
  Future<User?> getUser() async {
    final userJson = await storage.read(key: AppConstants.userKey);
    if (userJson == null) return null;
    try {
      return User.fromJson(jsonDecode(userJson));
    } catch (e) {
      await storage.delete(key: AppConstants.userKey);
      return null;
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null;
  }
}
