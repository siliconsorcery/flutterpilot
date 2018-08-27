import 'package:flutter/material.dart';
import 'package:pilot/mockups.dart';

//Credits:
//https://material.io/design/components/app-bars-top.html#anatomy
//https://material.io/design/platform-guidance/cross-platform-adaptation.html#cross-platform-guidelines

void main() => runApp(MaterialApp(home: AppBarExample()));

class AppBarExample extends StatelessWidget {
  AppBarExample({
    Key key,
    this.title = "App Bar",
  }): super(key: key);
  final String title;

final List<Example> _exampleList = [
    Example(
      title: 'Simple',
      child: AppBar1Screen(),
    ),
    Example(
      title: 'Centered Title',
      child: AppBar2Screen(),
    ),
    Example(
      title: 'Leading Icon',
      child: AppBar3Screen(),
    ),
    Example(
      title: 'Actions',
      child: AppBar4Screen(),
    ),
    Example(
      title: 'Overflow Menu',
      child: AppBar5Screen(),
    ),
    Example(
      title: 'Overflow Menu Stateful',
      child: AppBar6Screen(),
    ),
    Example(
      title: 'Gradient Custom App Bar',
      child: AppBar7Screen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Colors.grey[300],
        child: Examples(list: _exampleList,)
      ),
    );
  }
}

// class NavItem {
//   NavItem({@required this.title, @required this.routeName});
//   final title;
//   final routeName;
// }

// class NavButton extends StatelessWidget {
//   NavButton({@required this.title, @required this.routeName});

//   final title;
//   final routeName;

//   @override
//   Widget build(BuildContext context) => Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: MaterialButton(
//           child: Text(
//             title,
//             style: TextStyle(fontSize: 16.0),
//           ),
//           onPressed: () {
//             Navigator.pushNamed(context, routeName);
//           },
//           color: Colors.blue,
//           textColor: Colors.white,
//         ),
//       );
// }

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