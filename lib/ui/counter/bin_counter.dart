import 'counter_interface.dart';

class BinCounter extends CounterInterface {
  @override
  String get numberString => number.toRadixString(2);
}