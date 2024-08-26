import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/helpers/extensions.dart';
import 'package:math_app/core/helpers/spacing.dart';

import '../../../../core/routing/routers.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class EnterResultScreen extends StatefulWidget {
  const EnterResultScreen({super.key, required this.result});
  final int result;
  @override
  State<EnterResultScreen> createState() => _EnterResultScreenState();
}

class _EnterResultScreenState extends State<EnterResultScreen> {

  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(ColorsManager.mainBlue),
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
          fixedSize: WidgetStatePropertyAll(
            Size(50.w, 50.h),
          ),
        ),
        onPressed: () {
          print('rrrrrrqqqqqqqqqqqqqq ${widget.result}');
          if (_counter == widget.result) {
            context.pushReplacementNamed(Routes.successScreen);
          } else {
            context.pushReplacementNamed(Routes.failureScreen);
          }
        },
        icon: const Icon(Icons.near_me),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/cartoon-student-math-class.png',
                    width: 300.w,
                  ),
                  verticalSpace(40),
                  Text(
                    'Enter the Result :',
                    style: TextStyles.font25BlueBold,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: CartStepper(
                        alwaysExpanded: true,
                        numberSize: 10.w,
                        style: const CartStepperStyle(
                          backgroundColor: ColorsManager.mainBlue,
                        ),
                        value: _counter,
                        stepper: 1,
                        size: 40,
                        didChangeCount: (count) {
                          if (count <= 5) {
                            setState(() {
                              _counter = count;
                              print(_counter);
                              print(count);
                            });
                          } else {}
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
