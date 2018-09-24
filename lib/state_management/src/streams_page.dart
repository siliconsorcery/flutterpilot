import 'dart:async';

import 'package:flutter/material.dart';

import 'counter_list_tile.dart';
import 'database.dart';
import 'list_items_builder.dart';

class StreamsPage extends StatelessWidget {
  StreamsPage({
    @required this.database,
    @required this.stream,
  });
  final CounterDatabase database;
  final Stream<List<Counter>> stream;

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
        title: Text("Streams"),
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
    return StreamBuilder<List<Counter>>(
      stream: stream,
      builder: (context, snapshot) {
        return ListItemsBuilder<Counter>(
          items: snapshot.hasData ? snapshot.data : null,
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
      },
    );
  }
}