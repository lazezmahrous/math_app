import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameProvider with ChangeNotifier {
  int _operationsCount = 0;
  int _numbersSpeed = 0;
  int _score = 0;
  int _counterScore = 0;
  String _operation = '';
  String _levelImage = 'assets/images/score_widget_level_one.png';
  final String _levelName = 'هاو';
  String _level = 'levelOne';

  final List<String> _levelsImages = [
    'assets/images/score_widget_level_one.png',
    'assets/images/score_widget_level_tow.png',
    'assets/images/score_widget_level_three.png',
    'assets/images/score_widget_level_four.png',
    'assets/images/score_widget_level_five.png',
  ];

  int get operationsCount => _operationsCount;
  int get numbersSpeed => _numbersSpeed;
  int get counterScore => _counterScore;
  int get score => _score;
  String get operation => _operation;
  String get levelImage => _levelImage;
  String get levelName => _levelName;
  String get level => _level;

  GameProvider() {
    _initialize();
  }
  Future<void> _initialize() async {
    await _loadScores();
    changeLevelImage();
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
    _score++;
    await _saveScores();
    notifyListeners();
  }

  Future<void> increaseCounterScore() async {
    _counterScore++;
    await _saveScores();
    notifyListeners();
  }

  // Save scores to SharedPreferences
  Future<void> _saveScores() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('score', _score);
    prefs.setInt('counterScore', _counterScore);
  }

  // Load scores from SharedPreferences
  Future<void> _loadScores() async {
    final prefs = await SharedPreferences.getInstance();
    _score = prefs.getInt('score') ?? 0;
    _counterScore = prefs.getInt('counterScore') ?? 0;
    notifyListeners();
  }

  void changeLevel(String level) {
    _level = level;
    notifyListeners();
  }

  void changeLevelImage() {
    int allScore = _score + _counterScore;
    if (allScore <= 100) {
      _levelImage = _levelsImages[0];
    } else if (allScore >= 100) {
      // _levelName = 'مبتدأ';
      _levelImage = _levelsImages[1];
    } else if (allScore >= 200) {
      // _levelName = 'متوسط';
      _levelImage = _levelsImages[2];
    } else if (allScore >= 500) {
      // _levelName = 'محترف';
      _levelImage = _levelsImages[3];
    } else if (allScore >= 1000) {
      // _levelName = 'أُسطوره';
      _levelImage = _levelsImages[4];
    }
    notifyListeners();
  }
}
