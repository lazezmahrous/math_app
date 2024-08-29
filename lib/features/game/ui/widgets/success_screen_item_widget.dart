import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/helpers/extensions.dart';
import 'package:math_app/core/helpers/spacing.dart';
import '../../../../core/routing/routers.dart';
import '../../../../core/widgets/app_gradient_button.dart';

class SuccessScreenItemWidget extends StatefulWidget {
  const SuccessScreenItemWidget({super.key});

  @override
  State<SuccessScreenItemWidget> createState() =>
      _SuccessScreenItemWidgetState();
}

class _SuccessScreenItemWidgetState extends State<SuccessScreenItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: AppGradientButton(
            size: Size(20.w, 40.h),
            text: 'Home',
            onPressed: () {
              context.pushNamedAndRemoveUntil(
                Routes.homeScreen,
                predicate: (route) => false,
              );
            },
          ),
        ),
        horizontalSpace(10.w),
        Expanded(
          child: AppGradientButton(
            size: Size(20.w, 40.h),
            text: 'Play Again',
            onPressed: () {
              context.pushReplacementNamed(Routes.gameScreen);
            },
          ),
        ),
      ],
    );
  }
}
