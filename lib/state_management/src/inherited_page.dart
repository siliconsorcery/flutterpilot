import 'package:flutter/material.dart';

import 'counter_list_tile.dart';
import 'database.dart';
import 'inherited_provider.dart';
import 'list_items_builder.dart';

class InheritedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = InheritedProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Inherited Widget"),
        centerTitle: false,
      ),
      body: _buildContent(model),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => model.createCounter(),
      ),
    );
  }

  Widget _buildContent(InheritedProvider model) {
    return StreamBuilder<List<Counter>>(
      stream: model.stream,
      builder: (context, snapshot) {
        return ListItemsBuilder<Counter>(
          items: snapshot.hasData ? snapshot.data : null,
          itemBuilder: (context, counter) {
            return CounterListTile(
              key: Key('counter-${counter.id}'),
              counter: counter,
              onDecrement: model.decrement,
              onIncrement: model.increment,
              onDismissed: model.delete,
            );
          },
        );
      },
    );
  }
}