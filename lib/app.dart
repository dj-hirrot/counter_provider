import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/counter/bin_counter.dart';
import 'ui/counter/counter_container.dart';
import 'ui/counter/counter_interface.dart';
import 'ui/counter/counter_page.dart';
import 'ui/counter/dec_counter.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterContainer>(
          create: (_) => CounterContainer()..newCounter = DecCounter(),
        ),
        Consumer<CounterContainer>(
          builder: (_, container, __) {
            return ChangeNotifierProvider<CounterInterface>.value(
              value: container.counter,
              child: Scaffold(
                appBar: AppBar(actions: <Widget>[_Switch()]),
                body: CounterText(),
                floatingActionButton: _FloatingButton(),
              ),
            );
          },
        ),
      ],
    ),
    );
  }
}

class _Switch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final container = Provider.of<CounterContainer>(context, listen: false);
    final counter = container.counter;

    return Switch(
      value: counter.runtimeType == BinCounter,
      onChanged: (value) {
        // スイッチを切り替えたときにカウンターを差し替える
        container.newCounter = value ? BinCounter() : DecCounter();

        // 新しいカウンターは値を持たないので、元の値をセットする
        container.counter.setNumber(counter.number);
      },
    );
  }
}

class _FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterInterface>(context, listen: false);

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: counter.increment,
    );
  }
}
