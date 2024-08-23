import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/theming/styles.dart';
import 'package:math_app/features/onboarding/ui/widgets/doc_logo_and_named.dart';

import '../widgets/doctor_image_and_text.dart';
import '../widgets/get_started_button.dart';

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
                //   const DocLogoAndNamed(),
                //   SizedBox(
                //     height: 50.h,
                //   ),
                //   const DoctorImageAndText(),
                //   Padding(
                //     padding: EdgeInsets.symmetric(horizontal: 30.w),
                //     child: Column(
                //       children: [
                //         Text(
                //           'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                //           style: TextStyles.font13GrayRegular,
                //           textAlign: TextAlign.center,
                //         )
                //       ],
                //     ),
                //   ),
                //   SizedBox(
                //     height: 30.h,
                //   ),
                //   const GetStartedButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
