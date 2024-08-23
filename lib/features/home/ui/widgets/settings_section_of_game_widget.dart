import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/features/game/logic/cubits/game_cubit/game_cubit.dart';

import '../../../../core/theming/colors.dart';

class SettingsOfGameWidget extends StatefulWidget {
  const SettingsOfGameWidget({super.key, required this.sectionName});
  final String? sectionName;

  @override
  State<SettingsOfGameWidget> createState() => _SettingsOfGameWidgetState();
}

class _SettingsOfGameWidgetState extends State<SettingsOfGameWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<GameCubit>(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorsManager.morelightGray,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.sectionName!),
          BlocListener<GameCubit, GameCubitState>(
            listener: (context, state) {
              if (state is GameCubitSetOperationsCount &&
                  widget.sectionName == 'Operation Count') {
                _counter = state.operationsCount;
              } else if (state is GameCubitSetNumbersSpeed &&
                  widget.sectionName == 'Numbers Speed') {
                _counter = state.numbersSpeed;
              }
              setState(() {});
            },
            child: BlocBuilder<GameCubit, GameCubitState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: CartStepper(
                      alwaysExpanded: true,
                      style: const CartStepperStyle(
                        backgroundColor: Colors.red,
                      ),
                      value: _counter,
                      stepper: 1,
                      size: 40,
                      didChangeCount: (count) {
                        if (count <= 5) {
                          if (widget.sectionName == 'Operation Count') {
                            cubit.setOperationsCount(count);
                          } else if (widget.sectionName == 'Numbers Speed') {
                            cubit.setNumbersSpeed(count);
                          }
                          setState(() {
                            _counter = count;
                          });
                        } else {
                          print('Count exceeds 10');
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
