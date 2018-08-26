import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/demo': (context) => DemoPage(),
        '/demo2': (context) => Demo2Page(),
        '/demo3': (context) => Demo3Page(),
        '/demo4': (context) => Demo4Page(),
        '/demo5': (context) => Demo5Page(),
        '/demo6': (context) => Demo6Page(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem('Stack alignment', '/demo'),
    NavItem('Stack with Positioned children', '/demo2'),
    NavItem('Centering a Positioned in Stack', '/demo3'),
    NavItem('Positioned and non-positioned mix', '/demo4'),
    NavItem('Bottom Header Text on Image', '/demo5'),
    NavItem('Bottom Header Text on Image with Positioned', '/demo6'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Playground'),
      ),
      body: _getNavButtons(context),
    );
  }

  _getNavButtons(BuildContext context) {
    return ListView(
      children: _navItems
          .map(
            (item) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.pushNamed(context, item.routeName);
                    },
                    child: Text(
                      item.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
          )
          .toList(),
    );
  }
}

class NavItem {
  final title;
  final routeName;

  NavItem(this.title, this.routeName);
}

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo')),
      body: _getBody(),
    );
  }

  Widget _getBody() => Stack(
        //alignment: Alignment(-1.0, -1.0), //TOP-LEFT
        //alignment: Alignment.topLeft, //TOP-LEFT
        //alignment: Alignment(1.0, -1.0), //TOP-RIGHT
        //alignment: Alignment.topRight, //TOP-RIGHT
        //alignment: Alignment(-1.0, 1.0), //BOTTOM_LEFT
        //alignment: Alignment.bottomLeft, //BOTTOM_LEFT
        //alignment: Alignment(1.0, 1.0), //BOTTOM-RIGHT
        //alignment: Alignment.bottomRight, //BOTTOM-RIGHT
        //alignment: Alignment(0.0, 0.0), //CENTER
        alignment: Alignment.center, //CENTER
        children: <Widget>[
          Container(
            color: Colors.pink,
          ),
          Container(
            width: 100.0,
            height: 100.0,
            color: Colors.white,
          ),
        ],
      );
}

class Demo2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo 2')),
      body: _getBody(),
    );
  }

  Widget _getBody() => Stack(
        children: <Widget>[
          Container(
            color: Colors.pink,
          ),
          Positioned(
            //how far top of the widget from the top of the stack
            top: 0.0,
            //how far left of the widget from the left of the stack
            left: 0.0,
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.white,
            ),
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.white,
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.white,
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.white,
            ),
          ),
        ],
      );
}

class Demo3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo 3')),
      body: _getBody(),
    );
  }

  //LayoutBuilder gives the BoxConstraints of the widget that is wrapped
  //So We'll get max width and height of stack and divide them by 2
  //Then extract half of width and half of height of container from these
  //values to center the positioned widgets in the stack.
  Widget _getBody() => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => Stack(
              children: <Widget>[
                Container(
                  color: Colors.pink,
                ),
                Positioned(
                  //how far top of the widget from the top of the stack
                  top: constraints.maxHeight / 2 - 50.0,
                  //how far left of the widget from the left of the stack
                  left: constraints.maxWidth / 2 - 50.0,
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
      );
}

class Demo4Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo 4')),
      body: _getBody(),
    );
  }

  Widget _getBody() => Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            color: Colors.pink,
          ),
          Container(
            width: 100.0,
            height: 100.0,
            color: Colors.white,
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.white,
            ),
          )
        ],
      );
}

class Demo5Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo 5')),
      body: _getBody(),
    );
  }

  Widget _getBody() => Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Placeholder(),
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.red.withOpacity(0.8),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Image Bottom Header Text jfsdjhhfkl fds fjgds fhjdsgfsdnfm ',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                )
              ],
            ),
          ),
        ],
      );
}

class Demo6Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo 6')),
      body: _getBody(),
    );
  }

  Widget _getBody() => SizedBox(
        height: 300.0,
        child: Stack(
          children: <Widget>[
            Positioned.fill(child: Placeholder()),
            //Positioned.fill is same as below with these
            //default values
            /*Positioned( bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    top: 0.0, child:Placeholder())*/
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.red.withOpacity(0.7),
                child: Text(
                  'Hello World Image Bottom Text With Stack',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}