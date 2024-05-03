import 'package:bookshelf/app/navigation/routes.dart';
import 'package:bookshelf/shared/infra/authentication/port/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () async {
            final auth = GetIt.instance.get<AuthenticationService>();
            await auth.loginWithOtp('email@test.fr');
            if (context.mounted) {
              const HomeRoute().go(context);
              return;
            }
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
