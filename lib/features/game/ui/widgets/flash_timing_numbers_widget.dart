import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/helpers/extensions.dart';
import 'package:math_app/core/theming/colors.dart';
import 'package:provider/provider.dart';
import '../../../../core/services/play_sound.dart';
import '../../data/models/game_numbers_model.dart';
import '../../logic/providers/game_provider.dart';

class FlashTimingNumbersWidget extends StatefulWidget {
  const FlashTimingNumbersWidget({super.key});
  @override
  State<FlashTimingNumbersWidget> createState() =>
      _FlashTimingNumbersWidgetState();
}

class _FlashTimingNumbersWidgetState extends State<FlashTimingNumbersWidget> {
  List<int> num = [1, 2, 3, 4, 5]; // تصفية الصفر من القائمة
  int lastNumber = 0;
  int? firstNumber;
  int? secondNumber;
  int? result;
  int count = 0;
  late String _operation;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<GameProvider>(context, listen: false);
    _operation = provider.operation;
    startGame(provider.operationsCount, provider.numbersSpeed);
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

  Future<void> generateNumbersGame(int operationCount, int numbersSpeed) async {
    final random = Random(); // إنشاء كائن للحصول على أرقام عشوائية

    for (int i = 0; i < operationCount; i++) {
      count++;

      int randomNumber;
      // اختيار رقم عشوائي غير صفر
      if (num.length > 1) {
        randomNumber = num[random.nextInt(num.length)];
      } else {
        randomNumber =
            num.first; // التعامل مع حالة وجود رقم واحد فقط في القائمة
      }

      // تحديد العملية بناءً على عدد مرات التكرار
      if (i % 2 == 0) {
        Provider.of<GameProvider>(context, listen: false).setOperation('Add');
        num.shuffle();
        lastNumber = plusOperations(randomNumber);
      } else {
        Provider.of<GameProvider>(context, listen: false)
            .setOperation('Subtract');
        num.shuffle();
        lastNumber = negitiveOperations(randomNumber);
      }

      setState(() {
        firstNumber = lastNumber - secondNumber!;
        secondNumber = null;
        result = null;
      });
      await Future.delayed(Duration(seconds: numbersSpeed));
      setState(() {
        secondNumber = lastNumber - firstNumber!;
        result = lastNumber;
      });
      PlaySound.play_sound(soundSource: 'sounds/tap.mp3');
      await Future.delayed(Duration(seconds: numbersSpeed));
    }
  }

  startGame(int operationCount, int numbersSpeed) async {
    if (count == 0) {
      PlaySound.play_sound(soundSource: 'sounds/start_game.mp3');
      await Future.delayed(const Duration(seconds: 1));
    }
    await generateNumbersGame(operationCount, numbersSpeed);
    print('result = $result');
    context.pushReplacementToEnterResult(result!);
  }

  @override
  void dispose() {
    count = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (firstNumber != null && count == 1)
            Text(
              '$firstNumber', // عرض الرقم الأول
              style: TextStyle(fontSize: 170.sp, color: ColorsManager.mainBlue),
            ),
          if (secondNumber != null)
            Text(
              '${Provider.of<GameProvider>(context, listen: false).operation == 'Add' ? '+' : '-'} $secondNumber', // عرض الرقم الثاني مع علامة الجمع أو الطرح
              style: TextStyle(fontSize: 170.sp, color: ColorsManager.mainBlue),
            ),
        ],
      ),
    );
  }
}
