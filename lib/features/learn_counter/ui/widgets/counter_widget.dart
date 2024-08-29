import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/helpers/show_snack_bar.dart';
import 'package:math_app/core/helpers/spacing.dart';
import 'package:math_app/core/widgets/app_text_form_field.dart';
import 'package:math_app/features/game/logic/providers/game_provider.dart';
import 'package:math_app/features/learn_counter/data/models/counter_model.dart';
import 'package:math_app/features/learn_counter/logic/provider/counter_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/app_gradient_button.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key, required this.counter});

  final CounterModel counter;

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  final int _number = 0;

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        decoration: const BoxDecoration(
            // color: Colors.amber,
            ),
        child: Consumer<CounterProvider>(
          builder: (context, value, child) {
            return Column(
              children: [
                const Text('Show The Counter And Guess The Number :'),
                verticalSpace(30),
                Image.asset(
                  widget.counter.counterImagePath,
                ),
                verticalSpace(30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 130.w,
                    child: AppTextFormField(
                      onChanged: (value) {
                        _controller.text = value;
                      },
                      hintText: 'number ??',
                      controller: _controller,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                verticalSpace(20),
                AppGradientButton(
                  size: Size(double.infinity, 45.h),
                  onPressed: () {
                    if (int.parse(_controller.value.text.trim()) ==
                        widget.counter.counterNumber) {
                      Provider.of<CounterProvider>(context, listen: false)
                          .success();
                      Provider.of<GameProvider>(context, listen: false)
                          .increaseCounterScore();
                      showSnackBarBlue(context, 'Success');
                    } else {
                      showSnackBarEror(context, 'Failure');
                    }
                  },
                  text: 'Next',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
