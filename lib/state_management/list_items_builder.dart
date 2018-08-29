import 'package:flutter/material.dart';
import 'placeholder_content.dart';

typedef Widget ItemWidgetBuilder<T>(BuildContext context, T item);

class ListItemsBuilder<T> extends StatelessWidget {
  ListItemsBuilder({
    this.items,
    this.itemBuilder,
  });
  final List<T> items;
  final ItemWidgetBuilder<T> itemBuilder;

  @override
  Widget build(BuildContext context) {
    if (items == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      if (items.length == 0) {
        return PlaceholderContent();
      } else {
        return _buildContent();
      }
    }
  }

  Widget _buildContent() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return itemBuilder(context, items[index]);
      },
    );
  }

}