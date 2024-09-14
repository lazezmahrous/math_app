import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/counter_model.dart';

class CounterProvider with ChangeNotifier {
  int _index = 0;
  int get index => _index;
  CounterProvider() {
    _loadScores();
    checkAndResetScoresIfNeeded();
  }

  int _score_levelOne = 0;
  int _score_levelTow = 0;
  int get score_levelOne => _score_levelOne;
  int get score_levelTow => _score_levelTow;
  DateTime? _targetTime;

  DateTime? get targetTime => _targetTime;

  String _level = '';
  final String _counter = '';
  String get counter => _counter;
  String get level => _level;
  List<CounterModel> _counters = [];
  List<CounterModel> get counters => _counters;

  final List<CounterModel> _countersLevelOne = [
    CounterModel(
      counterNumber: 0,
      counterImagePath: 'assets/images/0.png',
    ),
    CounterModel(
      counterNumber: 1,
      counterImagePath: 'assets/images/1.png',
    ),
    CounterModel(
      counterNumber: 2,
      counterImagePath: 'assets/images/2.png',
    ),
    CounterModel(
      counterNumber: 3,
      counterImagePath: 'assets/images/3.png',
    ),
    CounterModel(
      counterNumber: 4,
      counterImagePath: 'assets/images/4.png',
    ),
    CounterModel(
      counterNumber: 5,
      counterImagePath: 'assets/images/5.png',
    ),
  ];

  final List<CounterModel> _countersLevelTow = [
    CounterModel(
      counterNumber: 6,
      counterImagePath: 'assets/images/6.png',
    ),
    CounterModel(
      counterNumber: 7,
      counterImagePath: 'assets/images/7.png',
    ),
    CounterModel(
      counterNumber: 8,
      counterImagePath: 'assets/images/8.png',
    ),
    CounterModel(
      counterNumber: 9,
      counterImagePath: 'assets/images/9.png',
    ),
  ];

  Future<void> _loadScores() async {
    final prefs = await SharedPreferences.getInstance();
    _score_levelOne = prefs.getInt('score_levelOne') ?? 0;
    _score_levelTow = prefs.getInt('score_levelTow') ?? 0;
    String? targetTimeStr = prefs.getString('targetTime');
    if (targetTimeStr != null) {
      _targetTime = DateTime.parse(targetTimeStr);
    }
    notifyListeners();
  }

  Future<void> _saveScores() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('score_levelOne', _score_levelOne);
    await prefs.setInt('score_levelTow', _score_levelTow);
    if (_targetTime != null) {
      await prefs.setString('targetTime', _targetTime!.toIso8601String());
    }
    await prefs.setString('lastUpdate', DateTime.now().toIso8601String());
    notifyListeners();
  }

  void checkAndResetScoresIfNeeded() async {
    final prefs = await SharedPreferences.getInstance();
    String? lastUpdateStr = prefs.getString('lastUpdate');
    if (lastUpdateStr != null) {
      DateTime lastUpdate = DateTime.parse(lastUpdateStr);
      if (DateTime.now().difference(lastUpdate).inMinutes >= 30) {
        _score_levelOne = 0;
        _score_levelTow = 0;
        _targetTime = DateTime.now().add(const Duration(minutes: 30));
        await _saveScores();
      }
    } else {
      _targetTime = DateTime.now().add(const Duration(minutes: 30));
      await _saveScores();
    }
  }

  void setLevel(String level) {
    _level = level;
    if (_level == 'levelOne') {
      _counters = _countersLevelOne;
    } else {
      _counters = _countersLevelTow;
    }

    notifyListeners();
  }

  void removeLevel() {
    _level = '';
  }

  void success() {
    _counters.shuffle();
    if (_level == 'levelOne') {
      _index = _countersLevelOne.length;
      _countersLevelOne.shuffle();
      _index--;
      _score_levelOne++;
    } else {
      _index = _countersLevelTow.length;
      _countersLevelOne.shuffle();
      _index--;
      _score_levelTow++;
    }
    _saveScores();
    notifyListeners();
  }
}
