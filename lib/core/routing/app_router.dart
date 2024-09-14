import 'package:flutter/material.dart';
import 'package:math_app/core/routing/routers.dart';
import 'package:math_app/features/game/ui/screens/enter_result_screen.dart';
import 'package:math_app/features/game/ui/screens/failure_screen.dart';
import 'package:math_app/features/game/ui/screens/success_screen.dart';
import 'package:math_app/features/learn_counter/ui/screens/learn_counter.dart';
import 'package:math_app/features/stories/ui/screens/play_and_reading_story.dart';
import 'package:math_app/features/stories/ui/screens/stories.dart';
 import '../../features/game/ui/screens/game_screen.dart';
import '../../features/home/ui/screens/home_screen.dart';
import '../../features/onboarding/ui/screens/onboarding_screen.dart';
import '../../features/settings/ui/screens/settings_screen.dart';
import '../../features/start_test/ui/screen/start_test.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    print(settings.name);
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.enterResultScreen:
        return MaterialPageRoute(
          builder: (_) => const EnterResultScreen(
            result: 0,
          ),
        );
      case Routes.gameScreen:
        return MaterialPageRoute(
          builder: (_) => GameScreen(
            numbersSpeed: 0,
            operationCount: 0,
          ),
        );
      case Routes.successScreen:
        return MaterialPageRoute(
          builder: (_) => const SuccessScreen(),
        );
      case Routes.learnCounter:
        return MaterialPageRoute(
          builder: (_) => LearnCounter(),
        );
      case Routes.stories:
        return MaterialPageRoute(
          builder: (_) => Stories(),
        );
      case Routes.readingStory:
        return MaterialPageRoute(
          builder: (_) => const PlayAndReadingStory(),
        );
      case Routes.failureScreen:
        return MaterialPageRoute(
          builder: (_) => const FailureScreen(),
        );
      case Routes.startTest:
        return MaterialPageRoute(
          builder: (_) => const StartTest(),
        );
      case Routes.settingsScreen:
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
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
