import 'package:bookshelf/app/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  final _router = GoRouter(routes: $appRoutes);

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _router);
  }
}
