import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/helpers/extensions.dart';
import 'package:math_app/core/helpers/spacing.dart';
import 'package:math_app/core/theming/styles.dart';
import 'package:math_app/features/onboarding/ui/widgets/app_logo_and_named.dart';

import '../../../../core/routing/routers.dart';
import '../../../../core/widgets/app_gradient_button.dart';
import '../widgets/student_image_and_text.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(25.h),
            child: Column(
              children: [
                const AppLogoAndNamed(),
                verticalSpace(80),
                const StudentImageAndText(),
                verticalSpace(15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      Text(
                        'أتقن أساسيات الرياضيات دون عناء مع MathMaster، التطبيق المفضل لديك للحصول على تجربة تعليمية سلسة..',
                        style: TextStyles.font13GrayRegular,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                verticalSpace(30),
                AppGradientButton(
                    size: const Size(double.infinity, 50),
                    text: 'لنبدأ',
                    onPressed: () {
                      context.pushNamed(Routes.homeScreen);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
