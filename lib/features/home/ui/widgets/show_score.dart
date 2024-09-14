import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:math_app/core/helpers/spacing.dart';
import 'package:math_app/core/theming/colors.dart';
import 'package:math_app/features/game/logic/providers/game_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class ShowScore extends StatefulWidget {
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
  State<ShowScore> createState() => _ShowScoreState();
}

class _ShowScoreState extends State<ShowScore> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> levels = [
      {
        'level_image': 'assets/images/score_widget_level_one.png',
        'level_name': S.of(context).level_one,
        'level_description': S.of(context).level_one_description,
      },
      {
        'level_image': 'assets/images/score_widget_level_tow.png',
        'level_name': S.of(context).level_tow,
        'level_description': S.of(context).level_tow_description,
      },
      {
        'level_image': 'assets/images/score_widget_level_three.png',
        'level_name': S.of(context).level_three,
        'level_description': S.of(context).level_three_description,
      },
      {
        'level_image': 'assets/images/score_widget_level_four.png',
        'level_name': S.of(context).level_four,
        'level_description': S.of(context).level_four_description,
      },
      {
        'level_image': 'assets/images/score_widget_level_five.png',
        'level_name': S.of(context).level_five,
        'level_description': S.of(context).level_five_description,
      },
    ];

    return Consumer<GameProvider>(
      builder: (context, value, child) {
        int res = value.score + value.counterScore;
        double progressValue = res >= 100 ? (res % 100) / 100 : res / 100;

        return Container(
          width: widget.width ?? 330.w,
          height: widget.height ?? 180.h,
          constraints: BoxConstraints(
            maxHeight: 200.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(39.r),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: widget.colors!,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${S.of(context).home_score_board_numbers} ${value.score}',
                          style: TextStyles.font15WhiteExtraBold,
                        ),
                      ],
                    ),
                    verticalSpace(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: 140.w,
                          ),
                          child: Text(
                            '${S.of(context).home_score_board_counter_score}: ${value.counterScore}',
                            style: TextStyles.font15WhiteExtraBold,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${S.of(context).feature_start_test_select_level}: ${res <= 100 ? S.of(context).level_one : res >= 100 ? S.of(context).level_tow : res >= 200 ? S.of(context).level_three : res >= 500 ? S.of(context).level_four : S.of(context).level_five}',
                          style: TextStyles.font12WhiteRegular,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 90.w,
                  height: 90.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      LiquidCircularProgressIndicator(
                        value: progressValue,
                        valueColor:
                            AlwaysStoppedAnimation(ColorsManager.darkGreen),
                        borderColor: Colors.white,
                        borderWidth: 3.0,
                        direction: Axis.vertical,
                      ),
                      Image.asset(value.levelImage),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  padding: const EdgeInsets.all(16.0),
                                  height: 300
                                      .h, // Adjust the height according to your needs
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: [
                                      Text(
                                        S.of(context).level_title,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      ListView.builder(
                                        itemCount: levels.length,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return Card(
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    levels[index]
                                                        ['level_image']!,
                                                    width: 50.w,
                                                  ),
                                                  horizontalSpace(10),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(levels[index]
                                                          ['level_name']!),
                                                      Text(levels[index][
                                                          'level_description']!),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            width: 24, // تحديد عرض الخلفية
                            height: 24, // تحديد ارتفاع الخلفية
                            decoration: BoxDecoration(
                              color: Colors.black
                                  .withOpacity(0.7), // لون الخلفية مع الشفافية
                              shape: BoxShape.circle, // جعل الخلفية دائرية
                            ),
                            child: const Icon(
                              Icons.info,
                              color: Colors.white,
                              size: 16, // حجم الأيقونة
                            ),
                          ),
                        ),
                      ),
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
