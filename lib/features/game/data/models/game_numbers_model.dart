// ignore_for_file: public_member_api_docs, sort_constructors_first
class GameNumbersModel {
  Map<int, List<int>> zeroToFiveAdditionOperations = {
    0: [1, 2, 3, 4, 5],
    1: [0, 1, 2, 3, 4],
    2: [1, 2, 3],
    3: [1, 2],
    4: [1],
    5: [0],
  };
  Map<int, List<int>> zeroToFiveSubtractionOperations = {
    5: [0, 2, 3, 4, 5],
    4: [1, 2, 3, 4],
    3: [1, 2, 3],
    2: [1, 2],
    1: [1],
    0: [0]
  };

  Map<int, List<int>> sixToNineAdditionOperations = {
    6: [1, 2, 3],
    7: [1, 2],
    8: [1],
    9: [0],
  };
  Map<int, List<int>> sixToNineSubtractionOperations = {
    6: [0],
    7: [1],
    8: [1, 2],
    9: [1, 2],
  };

  int makeSubtractionGameNumbers(
    int rundomNumber,
  ) {
    int? result;
    zeroToFiveAdditionOperations[rundomNumber]!.shuffle();
    result = rundomNumber + zeroToFiveAdditionOperations[rundomNumber]!.first;
    print('reeeeeeeeeeeeeeeeeeeeeeeeeeeeeees $result');
    return result;
  }

  int makeAdditionGameNumbers(
    int rundomNumber,
  ) {
    int? result;
    zeroToFiveSubtractionOperations[rundomNumber]!.shuffle();
    result =
        rundomNumber + zeroToFiveSubtractionOperations[rundomNumber]!.first;
    print('reeeeeeeeeeeeeeeeeeeeeeeeeeeeeees $result');
    return result;
  }
}
