import 'package:flutter/material.dart';
import 'package:diagonal/diagonal.dart';

void main() => runApp(MaterialApp(home: DiagonalExample()));

class DiagonalExample extends StatelessWidget {
  DiagonalExample({
    Key key,
    this.title = "Diagonal Example"
  }): super(key: key);
  final String title;

 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Colors.grey[300],
        child: _getBody(),
      )
    );
  }

  _getBody() => ListView(
    children: <Widget>[
      Diagonal(
        child: Image.asset('assets/avengers.jpg'),
        clipHeight: 90.0,
      ),
      Diagonal(
        child: Image.asset('assets/avengers.jpg'),
        position: Position.BOTTOM_RIGHT,
        clipHeight: 90.0,
      ),
      Diagonal(
        child: Image.asset('assets/avengers.jpg'),
        position: Position.TOP_LEFT,
        clipHeight: 90.0,
      ),
      Diagonal(
        child: Image.asset('assets/avengers.jpg'),
        position: Position.TOP_RIGHT,
        clipHeight: 90.0,
      ),
    ]
        .map((item) => Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: item,
            ))
        .toList(),
  );
}