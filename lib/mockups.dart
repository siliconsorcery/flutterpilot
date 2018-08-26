import 'package:flutter/material.dart';

class MockupScreen extends StatelessWidget {
  MockupScreen({
    Key key,
    this.title = "Screen Mockup",
    this.color = Colors.orangeAccent,
  }) : super(key: key);
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: color,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 56.0,
              color: Colors.white, // Colors.grey[700],
            ),
          ),
        ));
  }
}

// class MockupTile extends StatelessWidget {
//   MockupTile({Key key, this.title}): super(key: key);
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class MockupSliverFixedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      itemExtent: 42.0,
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return MockupTile(
            title: Text("$index : Item"),
          );
        }
      ),
    );
  }
}

class MockupTile extends StatelessWidget {
  MockupTile({
    Key key,
    this.title,
  }): super(key: key);
  Widget title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
    );
  }
}
