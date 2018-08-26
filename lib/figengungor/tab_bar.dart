import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Tabs Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/tab_bar_text': (context) => TabBarText(),
        '/tab_bar_icon': (context) => TabBarIcon(),
        '/tab_bar_text_icon': (context) => TabBarTextIcon(),
        '/tab_bar_scrollable': (context) => TabBarScrollable(),
        '/tab_bar_indicator': (context) => TabBarIndicator(),
        '/tab_bar_style': (context) => TabBarStyle(),
        '/tab_bar_controller': (context) => TabBarController(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem('TabBar Text', '/tab_bar_text'),
    NavItem('TabBar Icon', '/tab_bar_icon'),
    NavItem('TabBar Text & Icon', '/tab_bar_text_icon'),
    NavItem('TabBar Scrollable', '/tab_bar_scrollable'),
    NavItem('TabBar IndicatorSize', '/tab_bar_indicator'),
    NavItem('TabBar Style', '/tab_bar_style'),
    NavItem('TabController', '/tab_bar_controller'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabs Playground'),
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

//Credits

/*https://github.com/flutter/flutter/blob/master/examples/flutter_gallery/lib
 /demo/material/tabs_fab_demo.dart*/

class TabBarController extends StatefulWidget {
  @override
  _TabBarControllerState createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  _Page _selectedPage;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _allPages.length, vsync: this);
    _controller.addListener(_handleTabSelection);
    _selectedPage = _allPages[0];
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTabSelection);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabController'),
        bottom: TabBar(
          controller: _controller,
          tabs: _allPages
              .map((page) => Tab(
                    text: page.label,
                    icon: Icon(page.icon),
                  ))
              .toList(),
        ),
        actions: _selectedPage.actions,
      ),
      body: TabBarView(
        controller: _controller,
        children: _allPages
            .map((page) => Container(
                color: page.colors.shade300,
                child: Icon(
                  page.icon,
                  size: 100.0,
                )))
            .toList(),
      ),
    );
  }

  void _handleTabSelection() {
    print('Tab ${_controller.index} is selected');
    setState(() {
      _selectedPage = _allPages[_controller.index];
    });
  }
}

//TabBarView model
class _Page {
  _Page({this.label, this.colors, this.icon, this.actions});

  final String label;
  final MaterialColor colors;
  final IconData icon;
  final List<Widget> actions;
}

final List<_Page> _allPages = [
  _Page(
    label: 'Popular',
    colors: Colors.pink,
    icon: Icons.favorite,
    actions: [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      ),
    ],
  ),
  _Page(
    label: 'Top rated',
    colors: Colors.yellow,
    icon: Icons.star,
    actions: [
      IconButton(
        icon: Icon(Icons.sort),
        onPressed: () {},
      ),
    ],
  ),
  _Page(
    label: 'Upcoming',
    colors: Colors.green,
    icon: Icons.access_time,
    actions: [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.sort),
        onPressed: () {},
      ),
    ],
  ),
];

class TabBarIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Icon'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.favorite)),
              Tab(icon: Icon(Icons.star)),
              Tab(icon: Icon(Icons.access_time)),
            ],
          ),
        ),
        body: _getBody(),
      ),
    );
  }

  _getBody() {
    final iconSize = 200.0;
    return TabBarView(children: <Widget>[
      Icon(
        Icons.favorite,
        size: iconSize,
        color: Colors.red,
      ),
      Icon(
        Icons.star,
        size: iconSize,
        color: Colors.yellow,
      ),
      Icon(
        Icons.access_time,
        size: iconSize,
        color: Colors.green,
      ),
    ]);
  }
}

class TabBarIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBarIndicator'),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(text: 'Popular'),
              Tab(text: 'Top rated'),
              Tab(text: 'Upcoming'),
            ],
          ),
        ),
        body: _getBody(),
      ),
    );
  }

  _getBody() {
    final iconSize = 200.0;
    return TabBarView(children: <Widget>[
      Icon(
        Icons.favorite,
        size: iconSize,
        color: Colors.red,
      ),
      Icon(
        Icons.star,
        size: iconSize,
        color: Colors.yellow,
      ),
      Icon(
        Icons.access_time,
        size: iconSize,
        color: Colors.green,
      ),
    ]);
  }
}

class TabBarScrollable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Scrollable'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Popular'),
              Tab(text: 'Top rated'),
              Tab(text: 'Upcoming'),
              Tab(text: 'Now Playing'),
              Tab(text: 'Favorites'),
            ],
          ),
        ),
        body: _getBody(),
      ),
    );
  }

  _getBody() {
    final iconSize = 200.0;
    return TabBarView(children: <Widget>[
      Icon(
        Icons.favorite,
        size: iconSize,
        color: Colors.red,
      ),
      Icon(
        Icons.star,
        size: iconSize,
        color: Colors.yellow,
      ),
      Icon(
        Icons.access_time,
        size: iconSize,
        color: Colors.green,
      ),
      Icon(
        Icons.play_arrow,
        size: iconSize,
        color: Colors.purple,
      ),
      Icon(
        Icons.favorite,
        size: iconSize,
        color: Colors.pink,
      ),
    ]);
  }
}

class TabBarStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Style'),
          bottom: TabBar(
            indicatorColor: Colors.pink,
            //indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 5.0,
            labelColor: Colors.pink,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.favorite)),
              Tab(icon: Icon(Icons.star)),
              Tab(icon: Icon(Icons.access_time)),
            ],
          ),
        ),
        body: _getBody(),
      ),
    );
  }

  _getBody() {
    final iconSize = 200.0;
    return TabBarView(children: <Widget>[
      Icon(
        Icons.favorite,
        size: iconSize,
        color: Colors.red,
      ),
      Icon(
        Icons.star,
        size: iconSize,
        color: Colors.yellow,
      ),
      Icon(
        Icons.access_time,
        size: iconSize,
        color: Colors.green,
      ),
    ]);
  }
}

class TabBarText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Text'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Popular'),
              Tab(text: 'Top rated'),
              Tab(text: 'Upcoming'),
            ],
          ),
        ),
        body: _getBody(),
      ),
    );
  }

  _getBody() {
    final iconSize = 200.0;
    return TabBarView(children: <Widget>[
      Icon(
        Icons.favorite,
        size: iconSize,
        color: Colors.red,
      ),
      Icon(
        Icons.star,
        size: iconSize,
        color: Colors.yellow,
      ),
      Icon(
        Icons.access_time,
        size: iconSize,
        color: Colors.green,
      ),
    ]);
  }
}

class TabBarTextIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Text & Icon'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Popular',
                icon: Icon(Icons.favorite),
              ),
              Tab(
                text: 'Top rated',
                icon: Icon(Icons.star),
              ),
              Tab(
                text: 'Upcoming',
                icon: Icon(Icons.access_time),
              ),
            ],
          ),
        ),
        body: _getBody(),
      ),
    );
  }

  _getBody() {
    final iconSize = 200.0;
    return TabBarView(children: <Widget>[
      Icon(
        Icons.favorite,
        size: iconSize,
        color: Colors.red,
      ),
      Icon(
        Icons.star,
        size: iconSize,
        color: Colors.yellow,
      ),
      Icon(
        Icons.access_time,
        size: iconSize,
        color: Colors.green,
      ),
    ]);
  }
}
