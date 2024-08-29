import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:math_app/core/helpers/spacing.dart';
import 'package:math_app/core/theming/colors.dart';
import 'package:math_app/features/game/logic/providers/game_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/theming/styles.dart';

class ShowScore extends StatelessWidget {
  ShowScore({
    super.key,
    this.width,
    this.height,
    this.colors,
  });
  double? width;
  double? height;
  List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, value, child) {
        int res = value.additionScore + value.subtractionScore;
        return Container(
          width: width ?? 320.w,
          height: height ?? 180.h,
          constraints: BoxConstraints(
            maxHeight: 200.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(39.r),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: colors!,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 200.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtraction Score: ${value.subtractionScore}',
                            style: TextStyles.font15WhiteExtraBold,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Addition Score: ${value.additionScore}',
                            style: TextStyles.font15WhiteExtraBold.copyWith(
                              letterSpacing: 2.h,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Counter Score: ${value.counterScore}',
                            style: TextStyles.font15WhiteExtraBold.copyWith(
                              letterSpacing: 2.h,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Keep goaing 💪🔥',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 80.w,
                  height: 80.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      LiquidCircularProgressIndicator(
                        value: res / 100,
                        valueColor:
                            AlwaysStoppedAnimation(ColorsManager.darkGreen),
                        borderColor: Colors.white,
                        borderWidth: 3.0,
                        direction: Axis.vertical,
                      ),
                      Image.asset('assets/images/score_widget_level_one.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
