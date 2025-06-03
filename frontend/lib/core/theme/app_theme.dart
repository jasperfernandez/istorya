import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF1E88E5);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Colors.blue,
      onPrimary: Colors.white,
      secondary: Colors.blueAccent,
      onSecondary: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black87,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
}
