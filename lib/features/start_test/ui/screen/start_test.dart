import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_divider.dart';
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
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: [
                const SettingsOfGameWidget(
                  sectionName: 'Operation Count',
                ),
                verticalSpace(20),
                const SettingsOfGameWidget(
                  sectionName: 'Numbers Speed',
                ),
                verticalSpace(20),
                const SelectOperation(),
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
