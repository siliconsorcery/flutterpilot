import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SingleChildScrollView Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/not_big_enough_child_to_scroll': (context) =>
            NotBigEnoughChildToScroll(),
        '/stack_vertically_and_scroll_when_no_room': (context) =>
            StackVerticallyAndScrollWhenNoRoom(),
        '/fill_viewport_scroll_view': (context) => FillViewPortScrollView(),
        '/fill_viewport_column_expand_scroll_view': (context) =>
            FillViewPortColumnExpandScrollView(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem(
        'Not Big Enough Child to Scroll', '/not_big_enough_child_to_scroll'), 
    NavItem('Stack Vertically And Scroll When No Room',
        '/stack_vertically_and_scroll_when_no_room'),
    NavItem('Fill ViewPort Scroll View', '/fill_viewport_scroll_view'),
    NavItem('Fill ViewPort Column Expand Scroll View',
        '/fill_viewport_column_expand_scroll_view'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollView Playground'),
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

class FillViewPortColumnExpandScrollView extends StatefulWidget {
  @override
  FillViewPortColumnExpandScrollViewState createState() {
    return FillViewPortColumnExpandScrollViewState();
  }
}

class FillViewPortColumnExpandScrollViewState
    extends State<FillViewPortColumnExpandScrollView> {
  double _containerHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          _containerHeight = _containerHeight == 100.0 ? 300.0 : 100.0;
        });
      }),
      appBar: AppBar(title: Text('Fill ViewPort Colum Expand Scroll View')),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return Container(
            color: Colors.pink,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        // A fixed-height child.
                        color: Colors.yellow,
                        height: _containerHeight,
                      ),
                      Container(
                        // Another fixed-height child.
                        color: Colors.green,
                        height: _containerHeight,
                      ),
                      Expanded(
                        child: Container(
                          // Another fixed-height child.
                          color: Colors.purple,
                          height: _containerHeight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FillViewPortScrollView extends StatefulWidget {
  @override
  FillViewPortScrollViewState createState() {
    return FillViewPortScrollViewState();
  }
}

class FillViewPortScrollViewState extends State<FillViewPortScrollView> {
  double _containerHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          _containerHeight = _containerHeight == 100.0 ? 300.0 : 100.0;
        });
      }),
      appBar: AppBar(title: Text('Fill ViewPort Scroll View')),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return Container(
            color: Colors.pink,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      // A fixed-height child.
                      color: Colors.yellow,
                      height: _containerHeight,
                      child: Text('In this example, the children are spaced '
                          'out equally, unless there\'s no more room, in which '
                          'case they stack vertically and scroll.'
                          'Pink color is the color of container that wraps '
                          'SingleChildScrollView so you can see it takes '
                          'full height when it\'s not scrollable'),
                    ),
                    Container(
                      // Another fixed-height child.
                      color: Colors.green,
                      height: _containerHeight,
                      child: Text('Tap on Iconless Fabutton to increase '
                          'the box size and let it scrollllll'),
                    ),
                    Container(
                      // Another fixed-height child.
                      color: Colors.purple,
                      height: _containerHeight,
                      child: Text(
                          'LayoutBuilder provides BoxConstraints of viewport '
                          'Then we use this to make the SingleChildScrollView '
                          'to take full viewport height we gave it '
                          'a ConstrainedBox child which has BoxConstraints '
                          'with a minHeight of viewportConstraints.maxHeight '
                          'from LayoutBuilder. WOOO! '),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class NotBigEnoughChildToScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Not Big Enough Child to Scroll')),
      body: Container(
        color: Colors.pink,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(16.0),
                height: 250.0,
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Pink color is the color of Container that wraps '
                        'SingleChildScrollView.'
                        'As you can see SingleChildScrollView only gets size of its '
                        'child. See the example \'Fill Viewport ScrollView\' '
                        'to learn how to make it '
                        'take full height of viewport to align the child inside '
                        'SingleChildScrollView when it\'s not scrollable',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StackVerticallyAndScrollWhenNoRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stack Vertically And Scroll When No Room')),
      body: Container(
        color: Colors.pink,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(16.0),
                height: 250.0,
                color: Colors.green,
              ),
              Container(
                margin: EdgeInsets.all(16.0),
                height: 250.0,
                color: Colors.orange,
              ),
              Container(
                margin: EdgeInsets.all(16.0),
                height: 150.0,
                color: Colors.lightBlue,
              ),
              Container(
                margin: EdgeInsets.all(16.0),
                height: 150.0,
                color: Colors.redAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}