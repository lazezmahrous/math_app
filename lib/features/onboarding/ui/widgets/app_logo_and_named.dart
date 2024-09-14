import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class AppLogoAndNamed extends StatelessWidget {
  const AppLogoAndNamed({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/svgs/app_logo.svg',
          width: 40.w,
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          S.of(context).onboard_title,
          style: TextStyles.font24BlackBold,
        ),
      ],
    );
  }
}
