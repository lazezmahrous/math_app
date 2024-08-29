import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:math_app/core/services/play_sound.dart';
import 'package:math_app/core/theming/colors.dart';

void showSnackBarEror(context, String message) {
  PlaySound.play_sound(
    soundSource: 'sounds/loser.mp3',
  );
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.redAccent,
    content: Text(
      message,
      style: const TextStyle(
        fontFamily: 'GED',
      ),
    ),
  ));
}

void showSnackBarBlue(BuildContext context, String message) {
  PlaySound.play_sound(
    soundSource: 'sounds/win.mp3',
  );

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          fontFamily: 'GED',
        ),
      ),
      backgroundColor: ColorsManager.mainBlue,
    ),
  );
}
