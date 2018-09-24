import 'package:flutter/material.dart';

//https://stackoverflow.com/questions/51304568/scaffold-of-called-with-a-context-that-does-not-contain-a-scaffold
void main() => runApp(MaterialApp(home: SnackbarExample()));

class SnackbarExample extends StatelessWidget {
  SnackbarExample({
    Key key,
    this.title = "Snackbar Playground"
  }): super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Colors.grey[300],
        child: SnackbarDemo(),
      )
    );
  }
}

class SnackbarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.pink,
              textColor: Colors.white,
              onPressed: () {
                _displaySnackBar(context);
              },
              child: Text('Simple'),
            ),
            RaisedButton(
              color: Colors.pink,
              textColor: Colors.white,
              onPressed: () {
                _displaySnackBarWithBackgroundColor(context);
              },
              child: Text('Background Color'),
            ),
            RaisedButton(
              color: Colors.pink,
              textColor: Colors.white,
              onPressed: () {
                _displaySnackBarWithAction(context);
              },
              child: Text('With Action'),
            ),
            RaisedButton(
              color: Colors.pink,
              textColor: Colors.white,
              onPressed: () {
                _displaySnackBarCustom(context);
              },
              child: Text('Custom'),
            ),
            RaisedButton(
              color: Colors.pink,
              textColor: Colors.white,
              onPressed: () {
                _displaySnackBar5Seconds(context);
              },
              child: Text('5 Seconds Duration'),
            ),
          ]
              .map((i) => Padding(
                    padding: EdgeInsets.all(8.0),
                    child: i,
                  ))
              .toList(),
        ),
      ),
    );
  }

  _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('Are you talkin\' to me?'));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  _displaySnackBarWithBackgroundColor(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('How you like me now?'),
      backgroundColor: Colors.orange,
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  _displaySnackBarWithAction(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Connection Error.'),
      action: SnackBarAction(label: 'RETRY', onPressed: () {}),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  _displaySnackBarCustom(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('SUCCESS 🎉'),
          Text('Well done!'),
        ],
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  _displaySnackBar5Seconds(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('You got 5 seconds. Then I\'m gone.'),
      duration: Duration(seconds: 5),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}