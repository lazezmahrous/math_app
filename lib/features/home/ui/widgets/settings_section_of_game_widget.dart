import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/helpers/spacing.dart';
import 'package:provider/provider.dart';
import 'package:math_app/features/game/logic/providers/game_provider.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class SettingsOfGameWidget extends StatelessWidget {
  const SettingsOfGameWidget({super.key, required this.sectionName});
  final String? sectionName;

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, provider, child) {
        int counter = 0;
        if (sectionName == 'Operations Count' ||
            sectionName == 'عدد العمليات') {
          counter = provider.operationsCount;
        } else if (sectionName == 'Numbers Speed' ||
            sectionName == 'سرعة عرض الأرقام') {
          counter = provider.numbersSpeed;
        }
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorsManager.morelightGray,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(sectionName!, style: TextStyles.font20BlackExtraBold),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: CartStepper(
                    alwaysExpanded: true,
                    style: const CartStepperStyle(),
                    value: counter,
                    stepper: 1,
                    size: 35.w,
                    didChangeCount: (count) {
                      if (count <= 10) {
                        if (sectionName == 'Operations Count' ||
                            sectionName == 'عدد العمليات') {
                          provider.setOperationsCount(count);
                        } else if (sectionName == 'Numbers Speed' ||
                            sectionName == 'سرعة عرض الأرقام') {
                          provider.setNumbersSpeed(count);
                        }
                      } else {
                        print('Count exceeds 10');
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
