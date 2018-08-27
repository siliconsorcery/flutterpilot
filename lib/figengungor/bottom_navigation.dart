import 'package:flutter/material.dart';
import 'package:pilot/mockups.dart';

void main() => runApp(MaterialApp(home: BottomNavigationExample()));

class BottomNavigationExample extends StatelessWidget {
  BottomNavigationExample({
    Key key,
    this.title = "Bottom Navigation",
  }): super(key: key);
  final String title;

 final List<Example> _exampleList = [
    Example(
      title: "Fixed",
      child: Demo1(),
    ),
    Example(
      title: "Active-Inactive Colors",
      child: Demo2(),
    ),
    Example(
      title: "Shifting with Background Color",
      child: Demo3(),
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

// class HomePage extends StatelessWidget {
//   static const _navItems = [
//     const NavItem('Demo 1: Fixed', '/demo1'),
//     const NavItem('Demo 2: Active-Inactive Colors', '/demo2'),
//     const NavItem('Demo 3: Shifting', '/demo3'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('BottomNavigationBar Playground'),
//       ),
//       body: _getDemoList(context),
//     );
//   }

//   _getDemoList(BuildContext context) {
//     return ListView(children: _getNavButtons(context));
//   }

//   _getNavButtons(BuildContext context) {
//     return _navItems.map((item) {
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: RaisedButton(
//           child: Text(item.title),
//           onPressed: () {
//             Navigator.pushNamed(context, item.routeName);
//           },
//         ),
//       );
//     }).toList();
//   }
// }

// class NavItem {
//   final title;
//   final routeName;

//   const NavItem(this.title, this.routeName);
// }

class Demo1 extends StatefulWidget {
  @override
  Demo1State createState() {
    return new Demo1State();
  }
}

class Demo1State extends State<Demo1> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo 1'),
      ),
      body: _getBody(_currentIndex),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  _getBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int i) => _updateCurrentIndex(i),
      items: [
        BottomNavigationBarItem(
          title: Text('Home'),
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          title: Text('Search'),
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          title: Text('Profile'),
          icon: Icon(Icons.person),
        ),
      ],
    );
  }

  _updateCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  _getBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return Center(
            child: Icon(
          Icons.home,
          size: 100.0,
        ));
      case 1:
        return Center(
          child: Icon(
            Icons.search,
            size: 100.0,
          ),
        );
      case 2:
        return Center(
          child: Icon(
            Icons.person,
            size: 100.0,
          ),
        );
    }
  }
}

class Demo2 extends StatefulWidget {
  @override
  Demo2State createState() {
    return new Demo2State();
  }
}

class Demo2State extends State<Demo2> {
  int _currentIndex = 0;
  double _iconSize = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo 2'),
      ),
      body: _getBody(_currentIndex),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  _getBottomNavigationBar() {
    return Theme(
      data: ThemeData(
          //active colors
          primaryColor: Colors.pinkAccent,
          //inactive colors
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(caption: TextStyle(color: Colors.blue))),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int i) => _updateCurrentIndex(i),
        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Search'),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text('Profile'),
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }

  _updateCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  _getBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return Center(
          child: Icon(
            Icons.home,
            size: _iconSize,
          ),
        );
      case 1:
        return Center(
          child: Icon(
            Icons.search,
            size: _iconSize,
          ),
        );
      case 2:
        return Center(
          child: Icon(
            Icons.person,
            size: _iconSize,
          ),
        );
    }
  }
}

class Demo3 extends StatefulWidget {
  @override
  Demo3State createState() {
    return new Demo3State();
  }
}

class Demo3State extends State<Demo3> {
  int _currentIndex = 0;
  double _iconSize = 100.0;

  static const _barItemColors = [
    Colors.pink,
    Colors.green,
    Colors.orange,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo 3'),
      ),
      body: _getBody(_currentIndex),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  _getBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      currentIndex: _currentIndex,
      onTap: (int i) => _updateCurrentIndex(i),
      items: [
        BottomNavigationBarItem(
          title: Text('Home'),
          icon: Icon(Icons.home),
          backgroundColor: _barItemColors[0],
        ),
        BottomNavigationBarItem(
          title: Text('Search'),
          icon: Icon(Icons.search),
          backgroundColor: _barItemColors[1],
        ),
        BottomNavigationBarItem(
          title: Text('Profile'),
          icon: Icon(Icons.person),
          backgroundColor: _barItemColors[2],
        ),
      ],
    );
  }

  _updateCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  _getBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return Center(
          child: Icon(
            Icons.home,
            size: _iconSize,
            color: _barItemColors[0],
          ),
        );
      case 1:
        return Center(
          child: Icon(
            Icons.search,
            size: _iconSize,
            color: _barItemColors[1],
          ),
        );
      case 2:
        return Center(
          child: Icon(
            Icons.person,
            size: _iconSize,
            color: _barItemColors[2],
          ),
        );
    }
  }
}