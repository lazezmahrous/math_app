import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/helpers/extensions.dart';
import 'package:math_app/core/theming/colors.dart';

import '../../../../core/routing/routers.dart';

class StartPlayIconButton extends StatelessWidget {
  const StartPlayIconButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(ColorsManager.mainBlue),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
        fixedSize: WidgetStatePropertyAll(
          Size(55.w, 55.h),
        ),
      ),
      onPressed: () {
        context.pushReplacementNamed(Routes.gameScreen);
      },
      icon: const Icon(Icons.play_arrow),
    );
  }
}
