import 'package:bookshelf/app/navigation/routes.dart';
import 'package:bookshelf/shared/infra/authentication/port/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hello World!'),
            const SizedBox(height: 16),
            MaterialButton(
              onPressed: () => const BookSearchRoute().go(context),
              child: const Text('Go to Book Search'),
            ),
            const SizedBox(height: 16),
            MaterialButton(
              onPressed: () async {
                final auth = GetIt.instance.get<AuthenticationService>();
                await auth.logout();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
