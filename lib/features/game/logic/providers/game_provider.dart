import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameProvider with ChangeNotifier {
  int _operationsCount = 0;
  int _numbersSpeed = 0;
  int _additionScore = 0;
  int _subtractionScore = 0;
  int _counterScore = 0;
  String _operation = '';
  String _level = 'one';

  int get operationsCount => _operationsCount;
  int get numbersSpeed => _numbersSpeed;
  int get additionScore => _additionScore;
  int get subtractionScore => _subtractionScore;
  int get counterScore => _counterScore;
  String get operation => _operation;
  String get level => _level;

  GameProvider() {
    _loadScores(); // Load scores when provider is initialized
  }

  void setOperationsCount(int number) {
    _operationsCount = number;
    notifyListeners();
  }

  void setNumbersSpeed(int number) {
    _numbersSpeed = number;
    notifyListeners();
  }

  void setOperation(String operation) {
    _operation = operation;
    notifyListeners();
  }

  Future<void> increaseScore() async {
    if (_operation == 'Add') {
      _additionScore++;
    } else if (_operation == 'Subtract') {
      _subtractionScore++;
    } else {
      _counterScore++;
    }
    await _saveScores();
    notifyListeners();
  }

  // Save scores to SharedPreferences
  Future<void> _saveScores() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('additionScore', _additionScore);
    prefs.setInt('subtractionScore', _subtractionScore);
  }

  // Load scores from SharedPreferences
  Future<void> _loadScores() async {
    final prefs = await SharedPreferences.getInstance();
    _additionScore = prefs.getInt('additionScore') ?? 0;
    _subtractionScore = prefs.getInt('subtractionScore') ?? 0;
    notifyListeners();
  }

  void changeLevel(String level) {
    _level = level;
    notifyListeners();
  }
}
