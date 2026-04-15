import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/features/home_screen/home_screen.dart';


class RouterGeneratorConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.homeScreen,
    routes: [
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (BuildContext context, GoRouterState state) {
          return HomeScreen ();
        },
      ),
      GoRoute(
        path: AppRoutes.searchScreen,
        name: AppRoutes.searchScreen,
        builder: (BuildContext context, GoRouterState state) {
          return Container ();
        },
      ),
      GoRoute(
        path: AppRoutes.searchResultScreen,
        name: AppRoutes.searchResultScreen,
        builder: (BuildContext context, GoRouterState state) {
          return Container ();
        },
      ),
    GoRoute(
        path: AppRoutes.articalDetailsScreen,
        name: AppRoutes.articalDetailsScreen,
        builder: (BuildContext context, GoRouterState state) {
          return Container ();
        },
      ),
    ],
  );
}
