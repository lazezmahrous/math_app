import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/services/play_sound.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../generated/l10n.dart';
import '../widgets/success_screen_item_widget.dart';

class FailureScreen extends StatefulWidget {
  const FailureScreen({super.key});

  @override
  State<FailureScreen> createState() => _FailureScreenState();
}

class _FailureScreenState extends State<FailureScreen> {
  @override
  void initState() {
    PlaySound.play_sound(soundSource: 'sounds/loser.mp3');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorsManager.pink, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/gifs/failure.gif'),
                verticalSpace(50),
                Text(
                  S.of(context).feature_failure_screen,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                verticalSpace(50),
                const SuccessScreenItemWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
