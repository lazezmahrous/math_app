import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _index = 0;
  int get index => _index;

  void success() {
      _index++;
      notifyListeners();
   
  }
}
