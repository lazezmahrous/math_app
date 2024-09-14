import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/helpers/spacing.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/play_sound.dart';
import '../../../../core/theming/colors.dart';
import '../../../../generated/l10n.dart';
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorsManager.green, ColorsManager.darkGreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
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
                    Text(
                      S.of(context).feature_success_screen,
                      style: TextStyle(
                        color: Colors.white,
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
      ),
    );
  }
}
