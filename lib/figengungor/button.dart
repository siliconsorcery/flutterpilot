import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: ButtonExample()));

class ButtonExample extends StatelessWidget {
  ButtonExample({
    Key key,
    this.title = "Button Playground",
  }): super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return ButtonExampleDemo(title: title);
  }
}

class ButtonExampleDemo extends StatelessWidget {
  ButtonExampleDemo({
    Key key,
    this.title,
  }): super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'RaisedButton'),
              Tab(text: 'FlatButton'),
              Tab(text: 'GhostButton'),
              Tab(text: 'IconButton'),
              Tab(text: 'InkWellCustomButton'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBarView(
            children: [
              RaisedButtonTabView(),
              FlatButtonTabView(),
              GhostButtonTabView(),
              IconButtonTabView(),
              InkWellCustomButton(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.mic),
        ),
      ),
    );
  }
}

const kBrandBlue50 = const Color(0xFFE3F2FD);
const kBrandBlue100 = const Color(0xFFBBDEFB);
const kBrandBlue300 = const Color(0xFF64B5F6);
const kBrandBlue400 = const Color(0xFF42A5F5);
const kBrandBlue500 = const Color(0xFF2196F3);

const kBrandOrange900 = const Color(0xFFE65100);

const kBrandErrorRed = const Color(0xFFC5032B);

const kBrandSurfaceWhite = const Color(0xFFFFFBFA);
const kBrandBackgroundWhite = Colors.white;

class FlatButtonTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              child: Text("Ok".toUpperCase()),
              onPressed: () {},
            ),
            FlatButton(
              child: Text("Cancel".toUpperCase()),
              textColor: kBrandOrange900,
              onPressed: () {},
            ),
          ],
        ),
        FlatButton(
          child: Text("Retry".toUpperCase()),
          textColor: kBrandOrange900,
          onPressed: () {},
        ),
        FlatButton(
          child: Text("Try Again".toUpperCase()),
          textColor: Colors.red,
          onPressed: () {},
        ),
      ],
    );
  }
}

class GhostButtonTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blue.shade500, Colors.blue.shade100],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0]),
      ),
      child: _getGhostButton(),
    );
  }

  _getGhostButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: FlatButton(
            color: Colors.transparent,
            textColor: Colors.white,
            child: Text('Login'),
            onPressed: () {},
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2.0),
          ),
        ),
      ],
    );
  }
}

class IconButtonTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.star_border),
            tooltip: 'Add to favorite',
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.star),
            tooltip: 'Remove from favorites',
            color: Colors.yellow,
            splashColor: Colors.lightBlue,
            highlightColor: Colors.lightBlue,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            tooltip: 'Like',
            color: Colors.red,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class InkWellCustomButton extends StatelessWidget {
  final _borderRadius = BorderRadius.circular(25.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: _borderRadius,
          ),
          child: InkWell(
            borderRadius: _borderRadius,
            onTap: () {},
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Cancel'.toUpperCase(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RaisedButtonTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: _getRaisedButtons(context)
            .map((Widget widget) => Padding(
                  padding: EdgeInsets.all(8.0),
                  //wrap button with Column to make it wrap_content
                  //otherwise button fills entire width as list
                  child: Column(
                    children: <Widget>[
                      widget,
                    ],
                  ),
                ))
            .toList());
  }
}

List<Widget> _getRaisedButtons(BuildContext context) {
  return <Widget>[
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        RaisedButton(
          onPressed: () {},
          child: Text('Simple'),
        ),
        RaisedButton(
          onPressed: null,
          child: Text('Disabled'),
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
        ),
      ],
    ),
    RaisedButton(
      onPressed: () {},
      child: Text('Colored'),
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
    ),
    RaisedButton(
      onPressed: () {},
      child: Text('Orange Splash Color'),
      color: kBrandBlue500,
      textColor: Colors.white,
      splashColor: kBrandOrange900,
    ),
    RaisedButton(
      onPressed: () {},
      child: Text('Orange Highlight Color'),
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      highlightColor: kBrandOrange900,
    ),
    RaisedButton(
      onPressed: () {},
      child: Text('Blue Splash & Highlight'),
      color: kBrandBlue500,
      textColor: Colors.white,
      highlightColor: kBrandBlue400,
      splashColor: kBrandBlue300,
    ),
    RaisedButton(
      onPressed: () {},
      child: Text('Border'),
      color: Colors.white,
      textColor: Colors.black,
      shape: Border.all(width: 3.0, color: Colors.black),
    ),
    RaisedButton(
      onPressed: () {},
      child: Icon(Icons.plus_one),
      color: Colors.pink,
      textColor: Colors.white,
      shape: CircleBorder(),
      padding: EdgeInsets.all(16.0),
    ),
    RaisedButton(
      onPressed: () {},
      child: Text('Beveled Rectangle Border'),
      color: Colors.pink,
      textColor: Colors.white,
      shape: BeveledRectangleBorder(),
    ),
    RaisedButton(
      onPressed: () {},
      child: Text('Stadium Border'),
      color: Colors.green,
      textColor: Colors.white,
      shape: StadiumBorder(),
    ),
    RaisedButton(
      onPressed: () {},
      child: Text('Rounded Rectangle Border'),
      color: Colors.pink,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(60.0))),
    ),
    RaisedButton(
      onPressed: () {},
      child: Text('Left Rounded Rectangle Border'),
      color: Colors.pink,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(60.0))),
    ),
  ];
}