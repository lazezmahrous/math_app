import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/helpers/extensions.dart';
import 'package:math_app/core/theming/styles.dart';


class AppCardSection extends StatelessWidget {
  AppCardSection({
    super.key,
    this.width,
    this.height,
    this.raduis,
    required this.colors,
    required this.imageName,
    required this.sectionName,
    required this.routeName,
  });

  double? width;
  final double? height;
  List<Color>? colors;
  String? imageName;
  String? sectionName;
  String? routeName;
  BorderRadiusGeometry? raduis;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(routeName!);
      },
      child: Container(
        width: width ?? 320.w,
        height: height ?? 180.h,
        decoration: BoxDecoration(
          borderRadius: raduis ?? BorderRadius.circular(39.r),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
            colors: colors!,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                right: -20.w,
                child: SizedBox(
                  height: height ?? 200.h,
                  width: 200.w,
                  child: Image.asset(
                    'assets/images/$imageName',
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 25,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 100.w,
                      ),
                      child: Text(
                        sectionName ?? 'eeeeeeee',
                        style: TextStyles.font22WhiteExtraBold,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
