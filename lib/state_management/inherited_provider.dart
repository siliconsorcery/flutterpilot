import 'package:flutter/widgets.dart';
import 'dart:async';
import 'database.dart';

class InheritedProvider extends InheritedWidget {

  InheritedProvider({
    Key key,
    InheritedBloc inheritedBloc,
    @required this.database,
    @required this.stream,
    Widget child
  }) : this.data = inheritedBloc ?? InheritedBloc(),
       super(key: key, child: child);

  final InheritedBloc data;
  final CounterDatabase database;
  final Stream<List<Counter>> stream;

  void createCounter() async {
    await database.createCounter();
  }

  void increment(Counter counter) async {
    counter.value++;
    await database.setCounter(counter);
  }

  void decrement(Counter counter) async {
    counter.value--;
    await database.setCounter(counter);
  }

  void delete(Counter counter) async {
    await database.deleteCounter(counter);
  }

  @override
    bool updateShouldNotify(InheritedWidget oldWidget) => true;

    static InheritedProvider of(BuildContext context) => (context.inheritFromWidgetOfExactType(InheritedProvider) as InheritedProvider);

}

class InheritedBloc {
  InheritedBloc({
    this.isAlive = false,
  });
  bool isAlive;
}