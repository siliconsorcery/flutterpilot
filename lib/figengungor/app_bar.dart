import 'package:flutter/material.dart';

//Credits:
//https://material.io/design/components/app-bars-top.html#anatomy
//https://material.io/design/platform-guidance/cross-platform-adaptation.html#cross-platform-guidelines

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppBarPlaygroundScreen(),
      theme: ThemeData(primarySwatch: Colors.green),
      routes: <String, WidgetBuilder>{
        '/appBar1Screen': (BuildContext context) => AppBar1Screen(),
        '/appBar2Screen': (BuildContext context) => AppBar2Screen(),
        '/appBar3Screen': (BuildContext context) => AppBar3Screen(),
        '/appBar4Screen': (BuildContext context) => AppBar4Screen(),
        '/appBar5Screen': (BuildContext context) => AppBar5Screen(),
        '/appBar6Screen': (BuildContext context) => AppBar6Screen(),
        '/appBar7Screen': (BuildContext context) => AppBar7Screen(),
      },
    );
  }
}

class AppBarPlaygroundScreen extends StatelessWidget {
  final List<NavItem> _navItems = [
    NavItem(
      title: 'Simple',
      routeName: '/appBar1Screen',
    ),
    NavItem(
      title: 'Centered Title',
      routeName: '/appBar2Screen',
    ),
    NavItem(
      title: 'Leading Icon',
      routeName: '/appBar3Screen',
    ),
    NavItem(
      title: 'Actions',
      routeName: '/appBar4Screen',
    ),
    NavItem(
      title: 'Overflow Menu',
      routeName: '/appBar5Screen',
    ),
    NavItem(
      title: 'Overflow Menu Stateful',
      routeName: '/appBar6Screen',
    ),
    NavItem(
      title: 'Gradient Custom App Bar',
      routeName: '/appBar7Screen',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> navButtons = _navItems
        .map((model) => NavButton(
              title: model.title,
              routeName: model.routeName,
            ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar Playground'),
      ),
      body: Center(
        child: Column(children: navButtons),
      ),
    );
  }
}

class NavItem {
  NavItem({@required this.title, @required this.routeName});
  final title;
  final routeName;
}

class NavButton extends StatelessWidget {
  NavButton({@required this.title, @required this.routeName});

  final title;
  final routeName;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          child: Text(
            title,
            style: TextStyle(fontSize: 16.0),
          ),
          onPressed: () {
            Navigator.pushNamed(context, routeName);
          },
          color: Colors.blue,
          textColor: Colors.white,
        ),
      );
}

class GradientAppBar extends StatelessWidget {
  // Credit: https://sergiandreplace.com/planets-flutter-from-design-to-app/
  const GradientAppBar({Key key, this.title}) : super(key: key);
  final String title;
  final double barHeight = 66.0;

  @override
  Widget build(context) {
    //Screen begins behind the status bar,
    //Add statusBarHeight to our app bar height and add top padding
    //as statusBarHeight so we could center our title vertically in our app bar
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      height: barHeight + statusBarHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF3366FF),
            const Color(0xFF00CCFF),
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 36.0,
          ),
        ),
      ),
    );
  }
}

class AppBar1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Hello"),
        ),
      );
}

class AppBar2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Hello Centered"),
          centerTitle: true,
        ),
      );
}

class AppBar3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text("Leading Icon"),
        ),
      );
}

class AppBar4Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Menu Actions"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.map),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.directions),
              onPressed: () {},
            ),
          ],
        ),
      );
}

class AppBar5Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Overflow Menu"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.star_border),
              onPressed: () {},
            ),
            PopupMenuButton<String>(
              onSelected: (String s) {},
              itemBuilder: (BuildContext context) {
                return ['Item 1', 'Item 2', 'Item 3']
                    .map((String item) => PopupMenuItem<String>(
                          value: item,
                          child: Text(item),
                        ))
                    .toList();
              },
            ),
          ],
        ),
      );
}

class AppBar6Screen extends StatefulWidget {
  @override
  AppBar6ScreenState createState() {
    return new AppBar6ScreenState();
  }
}

class AppBar6ScreenState extends State<AppBar6Screen> {
  static const List<String> _menuItems = ['Item 1', 'Item 2', 'Item 3'];
  var _selectedMenuItem;

  @override
  void initState() {
    super.initState();
    _selectedMenuItem = _menuItems[0];
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Overflow Menu"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.star_border),
              onPressed: () {},
            ),
            PopupMenuButton<String>(
              initialValue: _selectedMenuItem,
              onSelected: (item) => _updateSelectedMenuItem(item),
              itemBuilder: (BuildContext context) => _menuItems
                  .map((String item) => PopupMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ))
                  .toList(),
            ),
          ],
        ),
        body: Center(
          child: Text(
            _selectedMenuItem,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      );

  void _updateSelectedMenuItem(String item) {
    setState(() {
      _selectedMenuItem = item;
    });
  }
}

class AppBar7Screen extends StatelessWidget {
  @override
  Widget build(context) => Scaffold(
        body: Column(
          children: <Widget>[
            GradientAppBar(
              title: 'Gradient',
            ),
            Expanded(
              child: Center(
                child: Text('Gradient App Bar!'),
              ),
            )
          ],
        ),
      );
}