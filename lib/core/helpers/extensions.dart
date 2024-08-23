import 'package:flutter/material.dart';
import 'package:math_app/features/game/ui/screens/game_screen.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushToGameScreen(int operationCount, int numbersSpeed) {
    return Navigator.of(this).push(MaterialPageRoute(
      builder: (context) => GameScreen(
          operationCount: operationCount, numbersSpeed: numbersSpeed),
    ));
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, arguments: arguments, predicate);
  }

  void pop() => Navigator.of(this).pop();
}
