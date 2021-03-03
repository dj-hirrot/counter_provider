import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_interface.dart';

class CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterInterface>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(counter.runtimeType.toString()),
          Text(counter.numberString),
        ],
      ),
    );
  }
}
