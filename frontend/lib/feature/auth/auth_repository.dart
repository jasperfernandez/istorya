import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:istorya/constants.dart';
import 'package:istorya/feature/auth/models/auth_response.dart';
import 'package:istorya/feature/auth/models/user.dart';
import 'auth_api.dart';

class AuthRepository {
  final AuthAPI api;
  final FlutterSecureStorage storage;

  AuthRepository(this.api, this.storage);

  Future<AuthResponse> login(String email, String password) async {
    final authResponse = await api.login(email, password);
    await storage.write(key: AppConstants.tokenKey, value: authResponse.token);
    await storage.write(
      key: AppConstants.userKey,
      value: jsonEncode(authResponse.user.toJson()),
    );
    return authResponse;
  }

  Future<void> logout() async {
    final token = await getToken();
    if (token != null) await api.logout(token);
    await storage.delete(key: AppConstants.tokenKey);
    await storage.delete(key: AppConstants.userKey);
  }

  Future<String?> getToken() => storage.read(key: AppConstants.tokenKey);

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

  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null;
  }
}
