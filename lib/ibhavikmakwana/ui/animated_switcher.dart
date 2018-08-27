import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: AnimatedSwitcherExample()));
class AnimatedSwitcherExample extends StatefulWidget {
  AnimatedSwitcherExample({
    Key key, 
    this.title = "Animated Switcher Playground"
  }) : super(key: key);

  final String title;

  @override
  _AnimatedSwitcherExampleState createState() =>
      _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(child: child, scale: animation);
                  },
                  child: Text(
                    '$_counter',
                    // This key causes the AnimatedSwitcher to interpret this as a "new"
                    // child each time the count changes, so that it will begin its animation
                    // when the count changes.
                    key: ValueKey<int>(_counter),
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}