import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/core/routing/routers.dart';
import 'package:math_app/features/game/logic/cubits/game_cubit/game_cubit.dart';
import '../../features/game/ui/screens/game_screen.dart';
import '../../features/home/ui/screens/home_screen.dart';
import '../../features/onboarding/ui/screens/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => GameCubit(),
            child: const HomeScreen(),
          ),
        );
      case Routes.gameScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => GameCubit(),
            child: GameScreen(
              numbersSpeed: 0,
              operationCount: 0,
            ),
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
