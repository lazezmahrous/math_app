part of 'game_cubit.dart';

@immutable
sealed class GameCubitState {}

final class GameCubitInitial extends GameCubitState {}

final class GameCubitSetOperationsCount extends GameCubitState {
  final int operationsCount;
  GameCubitSetOperationsCount({required this.operationsCount});
}

final class GameCubitSetNumbersSpeed extends GameCubitState {
  final int numbersSpeed;
  GameCubitSetNumbersSpeed({required this.numbersSpeed});
}
