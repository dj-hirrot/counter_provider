import 'counter_interface.dart';

class DecCounter extends CounterInterface {
  @override
  String get numberString => number.toString();
}