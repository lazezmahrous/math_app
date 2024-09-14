import 'package:flutter/material.dart';
import '../widgets/flash_timing_numbers_widget.dart';

class GameScreen extends StatefulWidget {
  int operationCount = 0;
  int numbersSpeed = 0;
  GameScreen({
    super.key,
    required this.operationCount,
    required this.numbersSpeed,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(child: FlashTimingNumbersWidget()),
      ),
    );
  }
}
