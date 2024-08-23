import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartPlayIconButton extends StatelessWidget {
  const StartPlayIconButton({super.key});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor:
            const WidgetStatePropertyAll(Color.fromRGBO(36, 124, 255, 1)),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
        fixedSize: WidgetStatePropertyAll(
          Size(60.w, 60.h),
        ),
      ),
      onPressed: () {},
      icon: const Icon(Icons.play_arrow),
    );
  }
}
