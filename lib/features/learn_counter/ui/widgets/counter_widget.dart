import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:math_app/core/helpers/show_snack_bar.dart';
import 'package:math_app/core/helpers/spacing.dart';
import 'package:math_app/core/theming/colors.dart';
import 'package:math_app/core/widgets/app_text_form_field.dart';
import 'package:math_app/features/game/logic/providers/game_provider.dart';
import 'package:math_app/features/learn_counter/data/models/counter_model.dart';
import 'package:math_app/features/learn_counter/logic/provider/counter_provider.dart';
import 'package:provider/provider.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

import '../../../../core/widgets/app_gradient_button.dart';
import '../../../../generated/l10n.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key, required this.counter});

  final CounterModel counter;

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  final int _number = 0;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Consumer<CounterProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              Text(S.of(context).feature_learn_on_counter_header),
              verticalSpace(10),
              ZoomOverlay(
                modalBarrierColor: Colors.black12, // Optional
                minScale: 0.5, // Optional
                maxScale: 3.0, // Optional
                animationCurve: Curves
                    .fastOutSlowIn, // Defaults to fastOutSlowIn which mimics IOS instagram behavior
                animationDuration: const Duration(
                    milliseconds:
                        300), // Defaults to 100 Milliseconds. Recommended duration is 300 milliseconds for Curves.fastOutSlowIn
                twoTouchOnly: true, // Defaults to false
                onScaleStart: () {}, // optional VoidCallback
                onScaleStop: () {}, // optional VoidCallback
                child: Align(
                  alignment: Alignment.topCenter, // تثبيت الصورة في المنتصف
                  child: Image.asset(
                    widget.counter.counterImagePath,
                    width: 180.w,
                  ),
                ),
              ),
              verticalSpace(10),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 130.w,
                    child: AppTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S
                              .of(context)
                              .home_feature_learn_on_counter_field_empty;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _controller.text = value;
                      },
                      hintText: S
                          .of(context)
                          .feature_learn_on_counter_text_field_hint_text,
                      controller: _controller,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ),
              verticalSpace(30),
              AppGradientButton(
                size: Size(150.w, 45.h),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (int.parse(_controller.value.text.trim()) ==
                        widget.counter.counterNumber) {
                      Provider.of<CounterProvider>(context, listen: false)
                          .success();
                      Provider.of<GameProvider>(context, listen: false)
                          .increaseCounterScore();
                      _controller.clear();
                      showToast(
                          message: S.of(context).feature_success_screen,
                          isError: false);
                    } else {
                      showToast(
                          message: S.of(context).feature_failure_screen,
                          isError: true);
                    }
                  }
                },
                text: S.of(context).feature_learn_on_counter_next_button,
              ),
            ],
          );
        },
      ),
    );
  }
}
