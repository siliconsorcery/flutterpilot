import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MaterialApp(home: SharedPrefsExample()));

class SharedPrefsExample extends StatelessWidget {
  SharedPrefsExample({
    Key key,
    this.title = "Shared Prefs Example"
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
        child: SharedPrefsDemo(),
      )
    );
  }
}

class SharedPrefsDemo extends StatefulWidget {
  @override
  _SharedPrefsDemoState createState() => _SharedPrefsDemoState();
}

class _SharedPrefsDemoState extends State<SharedPrefsDemo> {
  int _counter;
  static const KEY_COUNTER = 'counter';

  @override
  void initState() {
    _loadCounter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          onPressed: () {
            _incrementCounter();
          },
          child: Text('Counter: $_counter'),
        ),
      ),
    );
  }

  _loadCounter() async{

    var preferences = await SharedPreferences.getInstance();

    setState(() {
      _counter = preferences.getInt(KEY_COUNTER) ?? 0;
    });

  }

  _incrementCounter() async{

    var preferences = await SharedPreferences.getInstance();

    setState(() {
      _counter++;
    });

    preferences.setInt(KEY_COUNTER, _counter);

  }
}