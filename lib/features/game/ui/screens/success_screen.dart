import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/helpers/extensions.dart';
import 'package:math_app/core/helpers/spacing.dart';
import 'package:math_app/core/routing/routers.dart';
import 'package:math_app/core/widgets/app_text_button.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/play_sound.dart';
import '../../../../core/theming/colors.dart';
import '../../logic/providers/game_provider.dart';
import '../widgets/success_screen_item_widget.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});
  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    PlaySound.play_sound(soundSource: 'sounds/win.mp3');
    Provider.of<GameProvider>(context, listen: false).increaseScore();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/gifs/success.gif'),
                  verticalSpace(50),
                  const Text(
                    'Success!',
                    style: TextStyle(
                      color: ColorsManager.mainBlue,
                      fontSize: 40,
                    ),
                  ),
                  verticalSpace(50),
                  const SuccessScreenItemWidget()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
