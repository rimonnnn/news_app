import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/features/artical_details_screen/artical_details_screen.dart';
import 'package:news_app/features/home_screen/cubit/home_cubit.dart';
import 'package:news_app/features/home_screen/home_screen.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';
import 'package:news_app/features/search_result_screen/cubit/search_cubit.dart';
import 'package:news_app/features/search_result_screen/search_result_screen.dart';

class RouterGeneratorConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.homeScreen,
    routes: [
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => HomeCubit(),
            child: HomeScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.searchScreen,
        name: AppRoutes.searchScreen,
        builder: (BuildContext context, GoRouterState state) {
          return Container();
        },
      ),
      GoRoute(
        path: AppRoutes.searchResultScreen,
        name: AppRoutes.searchResultScreen,
        builder: (BuildContext context, GoRouterState state) {
          String query = state.extra as String;
          return BlocProvider(
            create: (context) => SearchCubit(),
            child: SearchResultScreen(query: query),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.articalDetailsScreen,
        name: AppRoutes.articalDetailsScreen,
        builder: (BuildContext context, GoRouterState state) {
          Article article = state.extra as Article;
          return ArticalDetailsScreen(article: article);
        },
      ),
    ],
  );
}
