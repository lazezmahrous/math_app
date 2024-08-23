import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/theming/colors.dart';

import '../../../../core/theming/styles.dart';

class ShowScore extends StatelessWidget {
  const ShowScore({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200.h,
          decoration: BoxDecoration(
            color: ColorsManager.mainBlue,
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              opacity: 0.5,
              image: AssetImage(
                'assets/images/maths_board_background.png',
              ),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                  bottom: 10,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 5.h,
                    ),
                    child: Text(
                      'keep going ✅',
                      style: TextStyles.font16WhiteSemiBold,
                    ),
                  )),
              Positioned(
                right: 5, // مسافة من اليمين
                top: 10, // مسافة من الأعلى
                child: Container(
                  width: 150.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 5.h,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Score 0',
                          style: TextStyles.font13GrayRegular,
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/images/score_widget_level_one.png',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
