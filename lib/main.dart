import 'package:bookshelf/app/navigation/router.dart';
import 'package:bookshelf/shared/env.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://cnlcdtqtjdbipvatdqsa.supabase.co',
    anonKey: Env.supabasePublicKey,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RouterBuilder(
      builder: (context, goRouter) {
        return MaterialApp.router(
          title: 'Bookshelf',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routerDelegate: goRouter.routerDelegate,
          routeInformationParser: goRouter.routeInformationParser,
          routeInformationProvider: goRouter.routeInformationProvider,
        );
      },
    );
  }
}
