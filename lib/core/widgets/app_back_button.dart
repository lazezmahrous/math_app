import 'package:flutter/material.dart';
import 'package:math_app/core/helpers/extensions.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(Icons.arrow_back_ios_new_sharp));
  }
}