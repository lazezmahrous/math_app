import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/helpers/extensions.dart';
import 'package:math_app/core/helpers/spacing.dart';

import '../../../../core/routing/routers.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class EnterResultScreen extends StatefulWidget {
  const EnterResultScreen({super.key, required this.result});
  final int result;

  @override
  State<EnterResultScreen> createState() => _EnterResultScreenState();
}

class _EnterResultScreenState extends State<EnterResultScreen> {
  List<int> levelOnerandomNumbers = [0, 1, 2, 3, 4, 5];
  List<int> levelTowrandomNumbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  void initState() {
    super.initState();
    levelOnerandomNumbers.shuffle();
    levelTowrandomNumbers.shuffle();

    levelOnerandomNumbers = levelOnerandomNumbers.take(3).toList();
    levelTowrandomNumbers = levelTowrandomNumbers.take(3).toList();

    levelOnerandomNumbers.addAll([widget.result]);
    levelOnerandomNumbers.shuffle();

    levelTowrandomNumbers.addAll([widget.result]);
    levelTowrandomNumbers.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Choose the Result :',
                    style: TextStyles.font25BlueBold,
                  ),
                  verticalSpace(40),
                  SizedBox(
                    height: 500.h,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 4, // عرض 4 خيارات فقط
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          if (levelOnerandomNumbers[index] == widget.result) {
                            context.pushReplacementNamed(Routes.successScreen);
                          } else {
                            context.pushReplacementNamed(Routes.failureScreen);
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  ColorsManager.secondBlueColor,
                                  ColorsManager.mainBlue,
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '${levelOnerandomNumbers[index]}',
                                style: TextStyles.font22WhiteExtraBold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
