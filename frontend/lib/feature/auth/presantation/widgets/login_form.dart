import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:istorya/core/exceptions/validation_exception.dart';
import 'package:istorya/feature/auth/application/auth_provider.dart';
import 'package:istorya/feature/auth/data/models/user.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  FieldErrors _fieldErrors = FieldErrors();

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<User?>>(authNotifierProvider, (previous, next) {
      if (next is AsyncError) {
        if (next.error is ValidationException) {
          final validationError = next.error as ValidationException;
          setState(() {
            _fieldErrors = validationError.errors;
            _passwordController.clear();
          });

          // ScaffoldMessenger.of(
          //   context,
          // ).showSnackBar(SnackBar(content: Text(validationError.message)));
        }
      }

      if (next is AsyncLoading) {
        setState(() {
          _fieldErrors.clear();
        });
      }

      if (next is AsyncData && next.value != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Welcome to Istortya ${next.value!.name}!')),
        );
      }
    });

    void login() {
      if (_formKey.currentState!.validate()) {
        ref
            .read(authNotifierProvider.notifier)
            .login(
              _emailController.text.trim(),
              _passwordController.text.trim(),
            );
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Log In', style: Theme.of(context).textTheme.headlineMedium),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
              errorText: _fieldErrors.first('email'),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email.';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              errorText: _fieldErrors.first('password'),
            ),
            obscureText: _obscurePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password.';
              }
              return null;
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final user = ref.watch(authNotifierProvider);

              return ElevatedButton(
                onPressed: login,
                child:
                    user.isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Log In'),
              );
            },
          ),
        ],
      ),
    );
  }
}
