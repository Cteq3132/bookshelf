import 'package:bookshelf/app/navigation/routes.dart';
import 'package:bookshelf/shared/infra/authentication/port/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:signals_flutter/signals_flutter.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final email = signal<String?>(null);
  final password = signal<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              onChanged: (newValue) => email.set(newValue),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              onChanged: (newValue) => password.set(newValue),
            ),
            const SizedBox(height: 16),
            Builder(builder: (context) {
              final emailValue = watchSignal(context, email);
              final passwordValue = watchSignal(context, password);

              return MaterialButton(
                onPressed: (emailValue != null && emailValue.isNotEmpty) &&
                        (passwordValue != null && passwordValue.isNotEmpty)
                    ? () async {
                        final auth =
                            GetIt.instance.get<AuthenticationService>();
                        await auth.loginWithEmail(emailValue, passwordValue);
                        if (context.mounted) {
                          const HomeRoute().go(context);
                          return;
                        }
                      }
                    : null,
                child: const Text('Login'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
