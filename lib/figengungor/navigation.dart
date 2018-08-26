import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        PageGoBack.routeName: (BuildContext context) => PageGoBack(),
        Page1.routeName: (BuildContext context) => Page1(),
        Page2.routeName: (BuildContext context) => Page2(),
        Page3.routeName: (BuildContext context) => Page3(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  Color _buttonColor;

  @override
  void initState() {
    super.initState();
    _buttonColor = Colors.pink;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Playground'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          _getSimplePushButton(context),
          _getSimplePushNamedButton(context),
          _getPushPassingDataButton(context),
          _getPushForResultDataButton(context),
          _getPushReplacementAndPopAndPushButton(context),
          _getPopUntilAndPushAndRemoveUntilButton(context),
        ]
            .map((item) => Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: item,
                ))
            .toList(),
      ),
    );
  }

  _getSimplePushButton(BuildContext context) {
    //Let's go to page 1 with pushNamed and come back with pop
    return _getRaisedButton(
      title: 'Simple push',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageGoBack(),
          ),
        );
      },
    );
  }

  _getSimplePushNamedButton(BuildContext context) {
    //Let's go to page 1 with pushNamed and come back with pop
    return _getRaisedButton(
      title: 'Simple pushNamed',
      onPressed: () {
        Navigator.pushNamed(context, PageGoBack.routeName);
      },
    );
  }

  _getPushPassingDataButton(BuildContext context) {
    //Let's go to page 1 with pushNamed and come back with pop
    return _getRaisedButton(
      title: 'push Passing Data',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageReceivesData('Greetings from Homepage'),
          ),
        );
      },
    );
  }

  _getPushForResultDataButton(BuildContext context) {
    //Let's go to page 1 with pushNamed and come back with pop
    return _getRaisedButton(
      title: 'push For Result',
      onPressed: () async {
        Color buttonColor = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageSendsDataBack(),
          ),
        );
        if (buttonColor != null) {
          setState(() {
            _buttonColor = buttonColor;
          });
        }
      },
    );
  }

  _getPushReplacementAndPopAndPushButton(BuildContext context) {
    //Go to Page 1.
    //From Page 1 go to Page 2 with pushReplacement.
    //So Page 1 will be removed from stack and Page 2 will be opened.
    //When returning from Page 2, you will return to HomePage

    return _getRaisedButton(
      title: 'pushReplacement & popAndPush Demo',
      onPressed: () {
        Navigator.pushNamed(context, Page1.routeName);
      },
    );
  }

  _getPopUntilAndPushAndRemoveUntilButton(BuildContext context) {
    //Go to Page 1.
    //From Page 1 go to Page 2 with pushReplacement.
    //So Page 1 will be removed from stack and Page 2 will be opened.
    //When returning from Page 2, you will return to HomePage

    return _getRaisedButton(
      title: 'popUntil & pushAndRemoveUntil\nPage1 > Page2 > Page3',
      onPressed: () {
        Navigator.pushNamed(context, Page1.routeName);
      },
    );
  }

  _getRaisedButton({String title, VoidCallback onPressed}) {
    return RaisedButton(
      child: Text(title, textAlign: TextAlign.center,),
      onPressed: onPressed,
      textColor: Colors.white,
      color: _buttonColor,
    );
  }
}

class LoginPage extends StatelessWidget {

  final _title = 'Login Page';
  static const routeName = '/login_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _title,
              style: TextStyle(fontSize: 40.0),
            ),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  final _title = 'Page 1';
  static const routeName = '/page1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Text(
              _title,
              style: TextStyle(fontSize: 60.0),
            ),
            Text('Navigator.pushReplacementNamed(context, Page2.routeName)'
                '\n\nWith pushReplacement method, '
                'Page 2 will be added with enter animation and '
                'Page 1 will be removed from stack. '
                '\nUsecase: Navigating from Login to Home'),
            RaisedButton(
              child: Text('Go Page 2 with pushReplacement'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, Page2.routeName);
              },
            ),
            Text('Navigator.popAndPushNamed(context, Page2.routeName)'
                '\n\nWith popAndPush method, '
                'Page 1 will be removed from stack with an exit animation and '
                'Page 2 will be displayed'),
            RaisedButton(
              child: Text('Go Page 2 with popAndPush'),
              onPressed: () {
                Navigator.popAndPushNamed(context, Page2.routeName);
              },
            ),
            RaisedButton(
              child: Text('Go Page 2'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Page2(isPage3Enabled: true)));
              },
            ),
          ]
              .map((item) => Padding(
                    padding: EdgeInsets.all(8.0),
                    child: item,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  Page2({this.isPage3Enabled});

  final bool isPage3Enabled;

  final _title = 'Page 2';
  static const routeName = '/page2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _title,
              style: TextStyle(fontSize: 40.0),
            ),
            SizedBox(
              height: 16.0,
            ),
            _getPage3NavigationButtonIfEnabled(context),
          ],
        ),
      ),
    );
  }

  _getPage3NavigationButtonIfEnabled(BuildContext context) {
    if (isPage3Enabled != null) {
      return RaisedButton(
        child: Text('Go Page 3'),
        onPressed: () {
          Navigator.pushNamed(context, Page3.routeName);
        },
      );
    } else {
      return Container();
    }
  }
}

class Page3 extends StatelessWidget {
  final _title = 'Page 3';
  static const routeName = '/page3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            Text(
              _title,
              style: TextStyle(fontSize: 40.0),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text('Remove every page from stack up to Page 1'),
            RaisedButton(
              child: Text('popUntil Page 1'),
              onPressed: () {
                Navigator.popUntil(
                    context, ModalRoute.withName(Page1.routeName));
              },
            ),
            Text('Remove every page from stack up to HomePage'),
            RaisedButton(
              child: Text('popUntil HomePage'),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
            Text('Remove every page from stack and push LoginPage'),
            RaisedButton(
              child: Text('pushAndRemoveUntil LoginPage'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()),
                  (Route<dynamic> route) => false, //remove every page
                );
              },
            ),
          ]
              .map((item) => Padding(
                    child: item,
                    padding: EdgeInsets.only(bottom: 8.0),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class PageGoBack extends StatelessWidget {
  final _title = 'PageGoBack';
  static const routeName = '/pageGoBack';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _title,
              style: TextStyle(fontSize: 40.0),
            ),
            Text('Navigator.pop(context)'),
            RaisedButton(
              child: Text('Go back'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ]
              .map((item) => Padding(
                    padding: EdgeInsets.all(8.0),
                    child: item,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class PageReceivesData extends StatelessWidget {
  PageReceivesData(this._data);

  final _title = 'Page Receives Data';
  final String _data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _title,
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              'Received data: $_data',
              style: TextStyle(color: Colors.red),
            ),
            Text('Navigator.pop(context)'),
            RaisedButton(
              child: Text('Go back'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ]
              .map((item) => Padding(
                    padding: EdgeInsets.all(8.0),
                    child: item,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class PageSendsDataBack extends StatefulWidget {
  @override
  PageSendsDataBackState createState() {
    return new PageSendsDataBackState();
  }
}

class PageSendsDataBackState extends State<PageSendsDataBack> {
  final _title = 'Page Sends Data Back';

  var _selectedColor;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _title,
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              'Choose Color to send back to previous page',
              style: TextStyle(color: Colors.red),
            ),
            _getColorRadios(),
            Text('Navigator.pop(context, _selectedColor)'),
            RaisedButton(
              child: Text('Change home button color'),
              onPressed: () {
                Navigator.pop(context, _selectedColor);
              },
            )
          ]
              .map((item) => Padding(
                    padding: EdgeInsets.all(8.0),
                    child: item,
                  ))
              .toList(),
        ),
      ),
    );
  }

  _getColorRadios() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Green'),
        Radio(
          onChanged: (value) {
            setState(() {
              _selectedColor = value;
            });
          },
          groupValue: _selectedColor,
          value: Colors.green,
        ),
        Text('Pink'),
        Radio(
          onChanged: (value) {
            setState(() {
              _selectedColor = value;
            });
          },
          groupValue: _selectedColor,
          value: Colors.pink,
        ),
      ],
    );
  }
}