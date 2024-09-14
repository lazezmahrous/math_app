import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/widgets/app_appbar.dart';
import 'package:math_app/features/learn_counter/data/models/counter_model.dart';
import 'package:math_app/features/learn_counter/logic/provider/counter_provider.dart';
import 'package:provider/provider.dart';

import '../../../../generated/l10n.dart';
import '../widgets/count_down.dart';
import '../widgets/counter_widget.dart';

class LearnCounter extends StatefulWidget {
  const LearnCounter({super.key});

  @override
  State<LearnCounter> createState() => _LearnCounterState();
}

class _LearnCounterState extends State<LearnCounter> {
  List<CounterModel> countersLevelOne = [
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
  ];

  List<CounterModel> countersLevelTow = [
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

  late CounterProvider _counterProvider;

  @override
  void initState() {
    super.initState();
    _counterProvider = Provider.of<CounterProvider>(context, listen: false);
  }

  @override
  void dispose() {
    _counterProvider.removeLevel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    countersLevelOne.shuffle();
    countersLevelTow.shuffle();
    return Scaffold(
      appBar: const AppAppbar(),
      body: Consumer<CounterProvider>(
        builder: (context, value, child) {
          return value.level.isEmpty
              ? Center(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              _counterProvider.setLevel('levelOne');
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(S
                                        .of(context)
                                        .feature_start_test_select_level_one)),
                              ),
                            ),
                          ),
                        ),
                        // verticalSpace(10),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              _counterProvider.setLevel('levelTow');
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(S
                                        .of(context)
                                        .feature_start_test_select_level_tow)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : value.score_levelOne == 5 && value.level == 'levelOne'
                  ? const Center(
                      child: CountDown(),
                    )
                  : value.score_levelTow == 9 && value.level == 'levelTow'
                      ? const Center(
                          child: CountDown(),
                        )
                      : Center(
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 10.h),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Center(
                                child: CounterWidget(
                                  counter: value.counters[index],
                                ),
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
