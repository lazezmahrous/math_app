import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/features/game/data/models/game_numbers_model.dart';
import 'package:math_app/features/game/logic/cubits/game_cubit/game_cubit.dart';

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
    startGame();
  }

  int plusOperations(int randomNumber) {
    List<int> operations =
        GameNumbersModel().zeroToFiveOperations[randomNumber]!;
    operations.shuffle();
    firstNumber = randomNumber;
    secondNumber = operations.first;
    result = randomNumber + operations.first;
    print(
        'First number: $firstNumber , Second number: $secondNumber, Result: $result');
    return lastNumber = result!;
  }

  startGame() async {
    for (int i = 0; i < widget.operationCount; i++) {
      count++;
      if (i >= 1) {
        lastNumber = plusOperations(lastNumber);
      } else {
        num.shuffle();
        int randomNumber = num.first;
        lastNumber = plusOperations(randomNumber);
      }
      setState(() {
        firstNumber = lastNumber - secondNumber!;
        secondNumber = null;
        result = null;
      });

      if (count < 1) {
      } else {
        await Future.delayed(Duration(seconds: widget.numbersSpeed));
        setState(() {
          secondNumber = lastNumber - firstNumber!;
          result = lastNumber;
        });
      }

      await Future.delayed(Duration(seconds: widget.numbersSpeed));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GameScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (firstNumber != null && count == 1)
              Text(
                '$firstNumber', // عرض الرقم الأول
                style: const TextStyle(fontSize: 48),
              ),
            if (secondNumber != null)
              Text(
                '+ $secondNumber', // عرض الرقم الثاني مع علامة الجمع
                style: const TextStyle(fontSize: 48),
              ),
          ],
        ),
      ),
    );
  }
}
