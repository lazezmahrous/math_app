import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/helpers/extensions.dart';
import 'package:math_app/core/helpers/show_snack_bar.dart';
import 'package:math_app/core/theming/colors.dart';
import 'package:math_app/features/game/logic/providers/game_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/routing/routers.dart';
import '../../../../generated/l10n.dart';

class StartPlayIconButton extends StatelessWidget {
  const StartPlayIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameProvider>(context, listen: false);

    return IconButton(
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(ColorsManager.mainBlue),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
        fixedSize: WidgetStatePropertyAll(
          Size(55.w, 55.h),
        ),
      ),
      onPressed: () {
        if (provider.operationsCount <= 2) {
          showSnackBarEror(
              context, S.of(context).feature_start_test_operation_count_error);
        } else if (provider.numbersSpeed < 1) {
          showSnackBarEror(
              context, S.of(context).feature_start_test_numbers_speed_error);
        } else {
          context.pushReplacementNamed(Routes.gameScreen);
        }
      },
      icon: const Icon(Icons.play_arrow),
    );
  }
}
