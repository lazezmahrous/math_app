import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';

class SettingsOfGameWidget extends StatefulWidget {
  const SettingsOfGameWidget({super.key, required this.SectionName});
  final String? SectionName;

  @override
  State<SettingsOfGameWidget> createState() => _SettingsOfGameWidgetState();
}

class _SettingsOfGameWidgetState extends State<SettingsOfGameWidget> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorsManager.morelightGray,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.SectionName!),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: CartStepper(
                alwaysExpanded: true,
                style: const CartStepperStyle(
                  backgroundColor: Colors.red,
                ),
                // stepper: 5,
                value: _counter,
                // count: 1,
                stepper: 1,
                size: 40,
                didChangeCount: (count) {
                  if (count > 10) {
                    print('object');
                  } else {
                    print(count);
                    setState(() {
                      _counter = count;
                    });
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
