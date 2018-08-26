import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Checkbox Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/checkbox_simple': (context) => CheckboxSimple(),
        '/checkbox_list_tile_demo': (context) => CheckboxListTileDemo(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem('Checkbox Simple', '/checkbox_simple'),
    NavItem('CheckboxListTile Demo', '/checkbox_list_tile_demo'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox Playground'),
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

class CheckboxListTileDemo extends StatefulWidget {
  @override
  _CheckboxListTileDemoState createState() => _CheckboxListTileDemoState();
}

class _CheckboxListTileDemoState extends State<CheckboxListTileDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _topics = [
    _Topic('Programming', false),
    _Topic('Music', false),
    _Topic('Cinema', false),
    _Topic('Book', false),
    _Topic('Dance', false),
    _Topic('Food', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('CheckboxListTile'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    var list = List<Widget>();
    //Add section title
    list.add(Text(
      'Check topics you\'re interested',
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    ));

    //Add checkboxes
    list.addAll(_topics.map((topic) => CheckboxListTile(
          title: Text('${topic.title}'),
          value: topic.isChecked,
          onChanged: (bool value) {
            setState(() {
              topic.isChecked = value;
            });
          },
        )));

    //Add Next button
    list.add(RaisedButton(
      child: Text('Next'),
      color: Colors.pink,
      textColor: Colors.white,
      onPressed: _showSnackBar,
    ));

    return ListView(
      padding: EdgeInsets.all(8.0),
      children: list,
    );
  }

  _showSnackBar() {
    final snackBar = SnackBar(
      content: Text(_topics
          .where((topic) => topic.isChecked)
          .map((topic) => topic.title)
          .toString()),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}

class _Topic {
  _Topic(this.title, this.isChecked);

  final String title;
  bool isChecked;
}

class CheckboxSimple extends StatefulWidget {
  @override
  _CheckboxSimpleState createState() => _CheckboxSimpleState();
}

class _CheckboxSimpleState extends State<CheckboxSimple> {
  var _termsAndConditionsIsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBox Simple'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              activeColor: Colors.green,
              value: _termsAndConditionsIsChecked,
              onChanged: (bool value) {
                setState(() {
                  _termsAndConditionsIsChecked = value;
                });
              },
            ),
            Text('I have read Terms and Conditions.')
          ],
        ),
        SizedBox(
          height: 16.0,
        ),
        RaisedButton(
          onPressed: _termsAndConditionsIsChecked ? () {} : null,
          textColor: Colors.white,
          color: Colors.pink,
          child: Text('Register'),
        )
      ],
    );
  }
}