import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/helpers/extensions.dart';
import 'package:math_app/core/helpers/spacing.dart';
import 'package:math_app/core/theming/styles.dart';
import 'package:math_app/features/onboarding/ui/widgets/app_logo_and_named.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/routing/routers.dart';
import '../../../../core/widgets/app_gradient_button.dart';
import '../../../../generated/l10n.dart';
import '../widgets/student_image_and_text.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  void exitApp() {
    SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        exitApp();
        return Future.value(false);
      },
      child: Scaffold(
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
                          S.of(context).onboard_description,
                          style: TextStyles.font13GrayRegular,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  verticalSpace(30),
                  AppGradientButton(
                      size: const Size(double.infinity, 50),
                      text: S.of(context).onboard_button,
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool('openApp', true);
                        print(prefs.getBool('openApp'));
                        context.pushNamed(Routes.homeScreen);
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
