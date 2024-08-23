import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/helpers/extensions.dart';
import 'package:math_app/features/onboarding/ui/widgets/get_started_button.dart';

import '../../../../core/routing/routers.dart';
import '../../../game/data/models/game_numbers_model.dart';
import '../../../game/logic/cubits/game_cubit/game_cubit.dart';

class StartPlayIconButton extends StatelessWidget {
  const StartPlayIconButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    int operationsCount = 0;
    int numbersSpeed = 0;
    return BlocListener<GameCubit, GameCubitState>(
      listener: (context, state) {
        if (state is GameCubitSetOperationsCount) {
          operationsCount = state.operationsCount;
        } else if (state is GameCubitSetNumbersSpeed) {
          numbersSpeed = state.numbersSpeed;
        }
      },
      child: IconButton(
        style: ButtonStyle(
          backgroundColor:
              const WidgetStatePropertyAll(Color.fromRGBO(36, 124, 255, 1)),
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
          fixedSize: WidgetStatePropertyAll(
            Size(60.w, 60.h),
          ),
        ),
        onPressed: () {
          // GameNumbersModel(rundomNumber: 1, operationsCount: 2).makeGameNumbers();
          context.pushToGameScreen(operationsCount, numbersSpeed);
        },
        icon: const Icon(Icons.play_arrow),
      ),
    );
  }
}
