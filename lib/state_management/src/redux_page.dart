import 'dart:async';
import 'dart:developer';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';

import 'counter_list_tile.dart';
import 'database.dart';
import 'list_items_builder.dart';

// Model
class Counters {
  Counters({
    this.counters,
  });
  List<Counter> counters;
}

// Actions
class CreateCounterAction {
}

class IncrementCounterAction {
  IncrementCounterAction({
    this.counter,
  });
  Counter counter;
}

class DecrementCounterAction {
  DecrementCounterAction({
    this.counter,
  });
  Counter counter;
}

class DeleteCounterAction {
  DeleteCounterAction({
    this.counter,
  });
  Counter counter;
}

class UpdateCounterAction {
  UpdateCounterAction({
    this.counters,
  });
  List<Counter> counters;
}

// Middleware
class CountersMiddleware extends MiddlewareClass<Counters> {
  CountersMiddleware({
    @required this.database,
    @required this.stream,
  });
  final CounterDatabase database;
  final Stream<List<Counter>> stream;

  void call(Store<Counters> store, dynamic action, NextDispatcher next) {
    if (action is CreateCounterAction) {
      database.createCounter();
    }
    if (action is IncrementCounterAction) {
      Counter counter = Counter(id: action.counter.id, value: action.counter.value + 1);
      database.setCounter(counter);
    }
    if (action is DecrementCounterAction) {
      Counter counter = Counter(id: action.counter.id, value: action.counter.value - 1);
      database.setCounter(counter);
    }
    if (action is DeleteCounterAction) {
      database.deleteCounter(action.counter);
    }
    next(action);
  }

  void listen(Store<Counters> store) {
    stream.listen((counters) {
      store.dispatch(UpdateCounterAction(counters: counters));
    });
  }
}

// Reducer
Counters reducer(Counters model, dynamic action) {
  if (action is UpdateCounterAction) {
    return Counters(counters: action.counters);
  }
  if (action is DeleteCounterAction) {
    List<Counter> counters = model.counters;
    counters.remove(action.counter);
    return Counters(counters: counters);
  }
  return model;
}

// Page
class ReduxPage extends StatelessWidget {

  void _createCounter(Store<Counters> store) async {
    store.dispatch(CreateCounterAction());
  }

  void _increment(Store<Counters> store, Counter counter) async {
    store.dispatch(IncrementCounterAction(counter: counter));
  }

  void _decrement(Store<Counters> store, Counter counter) async {
    store.dispatch(DecrementCounterAction(counter: counter));
  }

  void _delete(Store<Counters> store, Counter counter) async {
    store.dispatch(DeleteCounterAction(counter: counter));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Redux"),
        centerTitle: false,
      ),
      body: _buildContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _createCounter(StoreProvider.of(context)),
      ),
    );
  }

  Widget _buildContent() {
    return StoreBuilder<Counters>(
      builder: (context, Store<Counters> store) {
        Counters model = store.state;
        return ListItemsBuilder<Counter>(
          items: model.counters,
          itemBuilder: (context, counter) {
            return CounterListTile(
              key: Key('counter-${counter.id}'),
              counter: counter,
              onDecrement: (count) => _decrement(store, counter),
              onIncrement: (count) => _increment(store, counter),
              onDismissed: (count) => _delete(store, counter),
            );
          }
        );
      },
    );
  }
  
}