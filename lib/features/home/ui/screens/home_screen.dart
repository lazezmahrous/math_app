import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/helpers/spacing.dart';
import 'package:math_app/core/theming/colors.dart';

import '../../../../core/theming/styles.dart';
import '../widgets/settings_section_of_game_widget.dart';
import '../widgets/show_score.dart';
import '../widgets/start_play_icon_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const StartPlayIconButton(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back 👋',
                  style: TextStyles.font25BlueBold,
                ),
                verticalSpace(20),
                const ShowScore(),
                verticalSpace(40),
                const SettingsOfGameWidget(
                  SectionName: 'Operation Count',
                ),
                verticalSpace(20),
                const SettingsOfGameWidget(
                  SectionName: 'Numbers Speed',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
