import 'package:bookshelf/modules/book_search/view/book_search_view.dart';
import 'package:bookshelf/modules/home/view/home_view.dart';
import 'package:bookshelf/modules/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/home',
  routes: [
    TypedGoRoute<BookSearchRoute>(
      path: 'book_search',
    )
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeView();
}

class BookSearchRoute extends GoRouteData {
  const BookSearchRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const BookSearchView();
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginView();
}
