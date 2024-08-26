import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/core/helpers/extensions.dart';
import 'package:math_app/features/game/data/models/game_numbers_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/play_sound.dart';
import '../../logic/providers/game_provider.dart';

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
  List<int> num = [0, 1, 2, 3, 4, 5];
  int lastNumber = 0;
  int? firstNumber;
  int? secondNumber;
  int? result;
  int count = 0;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<GameProvider>(context, listen: false);
    startGame(widget.operationCount, widget.numbersSpeed, provider.operation);
  }

  int plusOperations(int randomNumber) {
    List<int> operations =
        GameNumbersModel().zeroToFiveAdditionOperations[randomNumber]!;
    operations.shuffle();
    firstNumber = randomNumber;
    secondNumber = operations.first;
    result = randomNumber + operations.first;
    print(
        'First number: $firstNumber , Second number: $secondNumber, Result: $result');
    return lastNumber = result!;
  }

  int negitiveOperations(int randomNumber) {
    List<int> operations =
        GameNumbersModel().zeroToFiveSubtractionOperations[randomNumber]!;
    operations.shuffle();
    firstNumber = randomNumber;
    secondNumber = operations.first;
    result = randomNumber - operations.first;
    print(
        'First number: $firstNumber , Second number: $secondNumber, Result: $result');
    return lastNumber = result!;
  }

  Future<void> generateNumbersGame(
      int operationCount, int Function(int) operation, int numbersSpeed) async {
    for (int i = 0; i < operationCount; i++) {
      count++;
      if (i >= 1) {
        lastNumber = operation(lastNumber);
      } else {
        num.shuffle();
        int randomNumber = num.first;
        lastNumber = operation(randomNumber);
      }
      setState(() {
        firstNumber = lastNumber - secondNumber!;
        secondNumber = null;
        result = null;
      });

      if (count < 1) {
      } else {
        await Future.delayed(const Duration(seconds: 1));
        setState(() {
          secondNumber = lastNumber - firstNumber!;
          result = lastNumber;
        });
      }
      PlaySound.play_sound(soundSource: 'sounds/tap.mp3');
      await Future.delayed(Duration(seconds: numbersSpeed));
    }
  }

  startGame(int operationCount, int numbersSpeed, String operation) async {
    PlaySound.play_sound(soundSource: 'sounds/start_game.mp3');
    if (operation == 'Add') {
      await generateNumbersGame(operationCount, plusOperations, numbersSpeed);
    } else {
      await generateNumbersGame(
          operationCount, negitiveOperations, numbersSpeed);
    }
    print('result = $result');
    context.pushReplacementToEnterResult(result!);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (firstNumber != null && count == 1)
                Text(
                  '$firstNumber', 
                  style: const TextStyle(fontSize: 120),
                ),
              if (secondNumber != null)
                Text(
                  '${Provider.of<GameProvider>(context, listen: false).operation == 'Add' ? "+" : "-"} $secondNumber', // عرض الرقم الثاني مع علامة الجمع
                  style: const TextStyle(fontSize: 120, color: Colors.blue),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
