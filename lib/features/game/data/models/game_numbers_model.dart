// ignore_for_file: public_member_api_docs, sort_constructors_first
class GameNumbersModel {
  // int rundomNumber = 0;
  // int operationsCount = 0;
  // GameNumbersModel({
  //   required this.rundomNumber,
  //   required this.operationsCount,
  // });

  Map<int, List<int>> zeroToFiveOperations = {
    0: [0, 1, 2, 3, 4, 5],
    // 3
    1: [0, 1, 2, 3, 4],
    // 5
    2: [0, 1, 2, 3],
    3: [0, 1, 2],
    4: [0, 1],
    5: [0],
  };

  int makeGameNumbers(int rundomNumber , ) {
    int? result;
    print('reee operationsCount  eeeees ');
    print('reeee rundomNumber eeeeeeeeeees $rundomNumber');
      zeroToFiveOperations[rundomNumber]!.shuffle();
      print(zeroToFiveOperations[rundomNumber]!.first);
      result = rundomNumber + zeroToFiveOperations[rundomNumber]!.first;
    
    print('reeeeeeeeeeeeeeeeeeeeeeeeeeeeeees $result');
    return result;
  }
}
