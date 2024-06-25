import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_news_app/core/routing/routes.dart';
import 'package:simple_news_app/features/data/repos/home_repo.dart';
import 'package:simple_news_app/features/logic/cubit/cubit.dart';
import 'package:simple_news_app/features/ui/screens/home_screen.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => NewsCubit(getIt<HomeRepo>()),
            child: const HomeScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
