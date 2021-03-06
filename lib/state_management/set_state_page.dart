import 'dart:async';
import 'package:pilot/state_management/counter_list_tile.dart';
import 'package:pilot/state_management/database.dart';
import 'package:flutter/material.dart';
import 'package:pilot/state_management/list_items_builder.dart';

class SetStatePage extends StatefulWidget {
  SetStatePage({
    @required this.database,
    @required this.stream,
  });
  final CounterDatabase database;
  final Stream<List<Counter>> stream;

  @override
  _SetStatePageState createState() => _SetStatePageState();
}

class _SetStatePageState extends State<SetStatePage> {
  List<Counter> _counters;

  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = widget.stream.listen((counters) {
      setState(() {
        _counters = counters;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }

  void _createCounter() async {
    await widget.database.createCounter();
  }

  void _increment(Counter counter) async {
    counter.value++;
    await widget.database.setCounter(counter);
  }

  void _decrement(Counter counter) async {
    counter.value--;
    await widget.database.setCounter(counter);
  }

  void _delete(Counter counter) async {
    await widget.database.deleteCounter(counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set State'),
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
    return ListItemsBuilder<Counter>(
      items: _counters,
      itemBuilder: (context, counter) {
        return CounterListTile(
          key: Key('counter-${counter.id}'),
          counter: counter,
          onDecrement: _decrement,
          onIncrement: _increment,
          onDismissed: _delete,
        );
      }
    );
  }
}