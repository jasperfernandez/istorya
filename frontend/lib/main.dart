import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:istorya/core/theme/app_theme.dart';
import 'package:istorya/feature/auth/presantation/pages/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: Istorya()));
}

class Istorya extends StatelessWidget {
  const Istorya({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Istorya',
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}
