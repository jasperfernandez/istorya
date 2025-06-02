import 'package:flutter/material.dart';
import 'package:istorya/feature/auth/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: LoginForm()),
      ),
    );
  }
}
