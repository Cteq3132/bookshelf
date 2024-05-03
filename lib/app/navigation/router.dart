import 'package:bookshelf/app/navigation/routes.dart';
import 'package:bookshelf/shared/infra/authentication/port/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';

class RouterBuilder extends StatefulWidget {
  const RouterBuilder({
    super.key,
    required this.builder,
  });

  final Widget Function(BuildContext context, GoRouter goRouter) builder;

  @override
  State<RouterBuilder> createState() => _RouterBuilderState();
}

class _RouterBuilderState extends State<RouterBuilder> {
  final auth = GetIt.instance.get<AuthenticationService>();

  late final _router = GoRouter(
    refreshListenable: auth.isLoggedIn.toValueListenable(),
    routes: $appRoutes,
    redirect: (context, state) {
      if (!auth.isLoggedIn.value) {
        return const LoginRoute().location;
      }
      return null;
    },
  );

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _router);
  }
}
