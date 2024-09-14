import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/widgets/app_divider.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_appbar.dart';
import '../../../../generated/l10n.dart';
import '../../../home/ui/widgets/select_level.dart';
import '../../../home/ui/widgets/select_operation.dart';
import '../../../home/ui/widgets/settings_section_of_game_widget.dart';
import '../../../home/ui/widgets/start_play_icon_button.dart';

class StartTest extends StatelessWidget {
  const StartTest({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const StartPlayIconButton(),
      appBar: const AppAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/animal_characters.png',
                  width: 300.w,
                ),
                const AppDivder(),
                SettingsOfGameWidget(
                  sectionName: S.of(context).feature_start_test_operation_count,
                ),
                verticalSpace(20),
                SettingsOfGameWidget(
                  sectionName: S.of(context).feature_start_test_numbers_speed,
                ),
                // verticalSpace(20),
                // const SelectOperation(),
                verticalSpace(20),
                const SelectLevel(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
