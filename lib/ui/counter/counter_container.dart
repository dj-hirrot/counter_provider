import 'package:flutter/material.dart';

import 'counter_interface.dart';

class CounterContainer with ChangeNotifier {
  CounterInterface _counter;

  CounterInterface get counter => _counter;

  set newCounter(CounterInterface counter) {
    _counter = counter;
    notifyListeners();
  }
}