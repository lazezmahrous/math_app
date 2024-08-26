import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDivder extends StatelessWidget {
  const AppDivder({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60.w),
      child: const Divider(
        color: Colors.black,
      ),
    );
  }
}
