import 'package:flutter/material.dart';
import 'package:math_app/core/helpers/extensions.dart';
import 'package:math_app/core/theming/colors.dart';
import 'package:math_app/core/theming/styles.dart';

import '../../../../core/routing/routers.dart';


class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.homeScreen);
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(ColorsManager.mainBlue),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: WidgetStateProperty.all(const Size(double.infinity, 50)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      child: Text(
        'Get Started',
        style: TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
