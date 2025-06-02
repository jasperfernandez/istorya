import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:istorya/core/constants/api_routes.dart';
import 'package:istorya/core/exceptions/validation_exception.dart';
import 'package:istorya/feature/auth/models/login_response.dart';

abstract class IAuthAPI {
  Future<LoginResponse> login(String email, String password);
  Future<void> logout(String token);
}

class AuthAPI implements IAuthAPI {
  final http.Client client;

  AuthAPI(this.client);

  @override
  Future<LoginResponse> login(String email, String password) async {
    final response = await client.post(
      Uri.parse(ApiRoutes.login),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      return LoginResponse.fromJson(data);
    } else if (response.statusCode == 422) {
      final data = jsonDecode(response.body);
      final message = data['message'] ?? 'Validation failed.';
      final errors = FieldErrors.fromJson(data['errors'] ?? {});

      throw ValidationException(message: message, errors: errors);
    } else {
      throw Exception('Failed to login.');
    }
  }

  @override
  Future<void> logout(String token) async {
    final response = await client.post(
      Uri.parse(ApiRoutes.logout),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to logout.');
    }
  }
}
