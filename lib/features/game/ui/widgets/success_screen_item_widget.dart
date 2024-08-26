import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/helpers/extensions.dart';
import 'package:provider/provider.dart';

import '../../../../core/routing/routers.dart';
import '../../../../core/widgets/app_text_button.dart';
import 'package:math_app/features/game/logic/providers/game_provider.dart';

class SuccessScreenItemWidget extends StatefulWidget {
  const SuccessScreenItemWidget({super.key});

  @override
  State<SuccessScreenItemWidget> createState() =>
      _SuccessScreenItemWidgetState();
}

class _SuccessScreenItemWidgetState extends State<SuccessScreenItemWidget> {
  @override
  Widget build(BuildContext context) {
    // احصل على GameProvider من السياق
    final gameProvider = Provider.of<GameProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AppTextButton(
          size: Size(20.w, 30),
          text: 'Home',
          onPressed: () {
            context.pushNamedAndRemoveUntil(
              Routes.homeScreen,
              predicate: (route) => false,
            );
          },
        ),
        AppTextButton(
          size: Size(20.w, 30),
          text: 'Play Again',
          onPressed: () {
            // الوصول إلى القيم من gameProvider
            final operationsCount = gameProvider.operationsCount;
            final numbersSpeed = gameProvider.numbersSpeed;

            context.pushReplacementToGameScreen(operationsCount, numbersSpeed);
          },
        ),
      ],
    );
  }
}
