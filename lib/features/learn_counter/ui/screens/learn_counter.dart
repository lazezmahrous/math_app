import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/helpers/spacing.dart';
import 'package:math_app/core/widgets/app_appbar.dart';
import 'package:math_app/features/learn_counter/data/models/counter_model.dart';
import 'package:math_app/features/learn_counter/logic/provider/counter_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/counter_widget.dart';

class LearnCounter extends StatelessWidget {
  LearnCounter({super.key});

  List<CounterModel> counters = [
    CounterModel(
      counterNumber: 0,
      counterImagePath: 'assets/images/0-removebg-preview.png',
    ),
    CounterModel(
      counterNumber: 1,
      counterImagePath: 'assets/images/1-removebg-preview.png',
    ),
    CounterModel(
      counterNumber: 2,
      counterImagePath: 'assets/images/2-removebg-preview.png',
    ),
    CounterModel(
      counterNumber: 3,
      counterImagePath: 'assets/images/3-removebg-preview.png',
    ),
    CounterModel(
      counterNumber: 4,
      counterImagePath: 'assets/images/4-removebg-preview.png',
    ),
    CounterModel(
      counterNumber: 5,
      counterImagePath: 'assets/images/5-removebg-preview.png',
    ),
    CounterModel(
      counterNumber: 6,
      counterImagePath: 'assets/images/6-removebg-preview.png',
    ),
    CounterModel(
      counterNumber: 7,
      counterImagePath: 'assets/images/7-removebg-preview.png',
    ),
    CounterModel(
      counterNumber: 8,
      counterImagePath: 'assets/images/8-removebg-preview.png',
    ),
    CounterModel(
      counterNumber: 9,
      counterImagePath: 'assets/images/9-removebg-preview.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    counters.shuffle();
    return Scaffold(
      appBar: const AppAppbar(),
      body: Consumer<CounterProvider>(
        builder: (context, value, child) {
          return Center(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CounterWidget(
                  counter: counters[value.index],
                );
              },
              itemCount: 1,
            ),
          );
        },
      ),
    );
  }
}
