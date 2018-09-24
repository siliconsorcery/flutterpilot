import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'counter_list_tile.dart';
import 'database.dart';
import 'list_items_builder.dart';

class CountersModel extends Model {
  CountersModel({
    Stream<List<Counter>> stream,
  }) {
    stream.listen((counters) {
      this.counters = counters;
      notifyListeners();
    });
  }

  List<Counter> counters;
}

class ScopedModelPage extends StatelessWidget {
  ScopedModelPage({
    @required this.database,
  });
  final CounterDatabase database;

  void _createCounter() async {
    await database.createCounter();
  }

  void _increment(Counter counter) async {
    counter.value++;
    await database.setCounter(counter);
  }

  void _decrement(Counter counter) async {
    counter.value--;
    await database.setCounter(counter);
  }

  void _delete(Counter counter) async {
    await database.deleteCounter(counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scoped Model"),
        centerTitle: false,
      ),
      body: _buildContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _createCounter,
      ),
    );
  }

  Widget _buildContent() {
    return ScopedModelDescendant<CountersModel>(
        builder: (context, child, model) {
      if (model == null) {
        return CircularProgressIndicator();
      } else {
        return ListItemsBuilder<Counter>(
          items: model.counters,
          itemBuilder: (context, counter) {
            return CounterListTile(
              key: Key('counter-${counter.id}'),
              counter: counter,
              onDecrement: _decrement,
              onDismissed: _delete,
              onIncrement: _increment,
            );
          },
        );
      }
    });
  }
}
