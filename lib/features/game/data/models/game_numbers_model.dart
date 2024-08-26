// ignore_for_file: public_member_api_docs, sort_constructors_first
class GameNumbersModel {
  // int rundomNumber = 0;
  // int operationsCount = 0;
  // GameNumbersModel({
  //   required this.rundomNumber,
  //   required this.operationsCount,
  // });

  Map<int, List<int>> zeroToFiveAdditionOperations = {
    0: [0, 1, 2, 3, 4, 5],
    1: [0, 1, 2, 3, 4],
    2: [0, 1, 2, 3],
    3: [0, 1, 2],
    4: [0, 1],
    5: [0],
  };
  Map<int, List<int>> zeroToFiveSubtractionOperations = {
    5: [0, 1, 2, 3, 4, 5],
    4: [0, 1, 2, 3, 4],
    3: [0, 1, 2, 3],
    2: [0, 1, 2],
    1: [0, 1],
    0: [0],
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
