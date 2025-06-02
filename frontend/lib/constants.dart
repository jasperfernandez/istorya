import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiPaths {
  static String login = '${dotenv.env['API_BASE_URL']}/login';
  static String register = '${dotenv.env['API_BASE_URL']}/register';
  static String logout = '${dotenv.env['API_BASE_URL']}/logout';
  static String user = '${dotenv.env['API_BASE_URL']}/user';
}

class AppConstants {
  static const String appName = 'Istorya';
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user';
}
