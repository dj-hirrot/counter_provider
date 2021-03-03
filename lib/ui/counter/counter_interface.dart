import 'package:flutter/material.dart';

abstract class CounterInterface with ChangeNotifier {
  int _number = 0;

  int get number => _number;
  String get numberString;

  void setNumber(int number) => _number = number;

  void increment() {
    _number++;
    notifyListeners();
  }
}