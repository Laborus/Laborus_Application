import 'package:flutter/material.dart';

class StepProvider with ChangeNotifier {
  int _stepData = 1;
  String _textData = '';

  int get stepData => _stepData;
  String get textData => _textData;

  void changeText(String textData) {
    _textData = textData;
    notifyListeners();
  }

  void addData() {
    if (_stepData < 4) {
      _stepData++;
      notifyListeners();
    }
  }

  void removeData() {
    if (_stepData != 1) {
      _stepData--;
      notifyListeners();
    }
  }
}
