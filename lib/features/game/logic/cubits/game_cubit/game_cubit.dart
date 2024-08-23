import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'game_cubit_state.dart';

class GameCubit extends Cubit<GameCubitState> {
  GameCubit() : super(GameCubitInitial());
  int operationsCount = 0;
  int numbersSpeed = 0;
  void setOperationsCount(number) {
    operationsCount = number;
    emit(
      GameCubitSetOperationsCount(
        operationsCount: number,
      ),
    );
  }

  void setNumbersSpeed(number) {
    numbersSpeed = number;
    emit(
      GameCubitSetNumbersSpeed(
        numbersSpeed: number,
      ),
    );
  }
}
