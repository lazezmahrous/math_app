import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/helpers/extensions.dart';
import 'package:math_app/core/theming/colors.dart';
import 'package:provider/provider.dart';
import '../../../../core/services/convert_to_arabic_numbers.dart';
import '../../../../core/services/play_sound.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/game_numbers_model.dart';
import '../../logic/providers/game_provider.dart';

class FlashTimingNumbersWidget extends StatefulWidget {
  const FlashTimingNumbersWidget({super.key});
  @override
  State<FlashTimingNumbersWidget> createState() =>
      _FlashTimingNumbersWidgetState();
}

class _FlashTimingNumbersWidgetState extends State<FlashTimingNumbersWidget> {
  List<int> numForLevelOne = [0, 1, 2, 3, 4, 5];
  List<int> numForLevelTow = [6, 7, 8, 9];

  int lastNumber = 0;
  int? firstNumber;
  int? secondNumber;
  int? result;
  int count = 0;

  @override
  void initState() {
    super.initState();
    numForLevelOne.shuffle();
    numForLevelTow.shuffle();
    final provider = Provider.of<GameProvider>(context, listen: false);
    lastNumber = provider.level == 'levelOne'
        ? numForLevelOne.first
        : numForLevelTow.first;

    startGame(provider.operationsCount, provider.numbersSpeed);
  }

  int plusOperations(int randomNumber) {
    List<int> operations = [];
    if (Provider.of<GameProvider>(context, listen: false).level == 'levelOne') {
      operations =
          GameNumbersModel().zeroToFiveAdditionOperations[randomNumber]!;
    } else {
      operations =
          GameNumbersModel().sixToNineAdditionOperations[randomNumber]!;
    }
    operations.shuffle();
    firstNumber = randomNumber;
    secondNumber = operations.first;
    result = randomNumber + operations.first;
    print(
        'First number: $firstNumber , Second number: $secondNumber, Result: $result');
    return lastNumber = result!;
  }

  int negitiveOperations(int randomNumber) {
    print('random number of negitive + $randomNumber');
    List<int> operations = [];
    if (Provider.of<GameProvider>(context, listen: false).level == 'levelOne') {
      operations =
          GameNumbersModel().zeroToFiveSubtractionOperations[randomNumber]!;
    } else {
      operations =
          GameNumbersModel().sixToNineSubtractionOperations[randomNumber]!;
    }
    operations.shuffle();

    firstNumber = randomNumber;
    secondNumber = operations.first;
    if (firstNumber! < secondNumber!) {
      result = secondNumber! - firstNumber!;
    } else {
      result = firstNumber! - secondNumber!;
    }

    print(
        'First number: $firstNumber , Second number: $secondNumber, Result: $result');
    return lastNumber = result!;
  }

  Future<void> generateNumbersGame(int operationCount, int numbersSpeed) async {
    final provider = Provider.of<GameProvider>(context, listen: false);
    for (int i = 0; i < operationCount; i++) {
      numForLevelOne.shuffle();
      numForLevelTow.shuffle();
      count++;
      if (i % 2 == 0) {
        provider.setOperation('Add');
        lastNumber = plusOperations(
          lastNumber,
        );
      } else {
        provider.setOperation('Subtract');
        lastNumber = negitiveOperations(
          lastNumber,
        );
      }
      setState(() {
        print('$lastNumber$firstNumber');

        firstNumber = lastNumber - secondNumber!;
        secondNumber = null;
        result = null;
      });
      if (count <= 1) {
        await Future.delayed(Duration(seconds: numbersSpeed));
      }

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
    context.pushReplacementToEnterResult(result!);
  }

  @override
  void dispose() {
    count = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (firstNumber != null && count == 1)
          Text(
            isArabic
                ? ConvertToArabicNumbers.convertToArabicNumbers(
                    firstNumber.toString())
                : ' $firstNumber',
            style: TextStyle(fontSize: 250.sp, color: ColorsManager.mainBlue),
          ),
        if (secondNumber != null)
          Text(
            '${Provider.of<GameProvider>(context, listen: false).operation == 'Add' ? '+' : '-'} ${isArabic ? ConvertToArabicNumbers.convertToArabicNumbers(secondNumber.toString()) : secondNumber}', // عرض الرقم الثاني مع علامة الجمع أو الطرح
            style: TextStyle(fontSize: 250.sp, color: ColorsManager.mainBlue),
          ),
      ],
    );
  }
}
