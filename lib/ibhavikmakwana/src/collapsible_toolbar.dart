import 'package:flutter/material.dart';
import 'package:pilot/utils/mockups.dart';

void main() => runApp(MaterialApp(home: CollapsibleToolbar()));
class CollapsibleToolbar extends StatefulWidget {
  CollapsibleToolbar({
    Key key, 
    this.title = "Collapsible Playground",
  }) : super(key: key);
  final String title;

  @override
  _CollapsibleToolbarState createState() => _CollapsibleToolbarState();
}

class _CollapsibleToolbarState extends State<CollapsibleToolbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: false,
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.title),
            ),
          ),
          MockupSliverFixedList(),
        ],
      ),
    );
  }
}