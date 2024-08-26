import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/helpers/extensions.dart';
import 'package:provider/provider.dart';

import '../../../game/logic/providers/game_provider.dart';

class StartPlayIconButton extends StatelessWidget {
  const StartPlayIconButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);

    return IconButton(
      style: ButtonStyle(
        backgroundColor:
            const WidgetStatePropertyAll(Color.fromRGBO(36, 124, 255, 1)),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
        fixedSize: WidgetStatePropertyAll(
          Size(60.w, 60.h),
        ),
      ),
      onPressed: () {
        context.pushReplacementToGameScreen(
            gameProvider.operationsCount, gameProvider.numbersSpeed);
      },
      icon: const Icon(Icons.play_arrow),
    );
  }
}
