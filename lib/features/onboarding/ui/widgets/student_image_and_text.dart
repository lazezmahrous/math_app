import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class StudentImageAndText extends StatelessWidget {
  const StudentImageAndText({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/maths_board_background.png',
          color: ColorsManager.mainBlue.withOpacity(0.2),
        ),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.14, 0.4],
            ),
          ),
          child: Image.asset(
            'assets/images/student_image.png',
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Text(
            'أفضل منهج لتأسيس الرياضيات',
            textAlign: TextAlign.center,
            style: TextStyles.font25BlueBold.copyWith(
              height: 1.2,
            ),
          ),
        ),
      ],
    );
  }
}
