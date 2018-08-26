import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ListView Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/basic_listview': (context) => BasicList(),
        '/listtile_demo': (context) => ListTileDemo(),
        '/listview_builder_demo': (context) => ListViewBuilderDemo(),
        '/listview_divider_demo': (context) => ListViewDividerDemo(),
        '/listview_divider_indent_demo': (context) =>
            ListViewDividerIndentDemo(),
        '/listtile_divide_tiles_demo': (context) => ListTileDivideTilesDemo(),
        '/horizontal_listview': (context) => HorizontalListView(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem('Basic ListView', '/basic_listview'),
    NavItem('Using ListTile', '/listtile_demo'),
    NavItem('Using ListView.builder()', '/listview_builder_demo'),
    NavItem('ListView divider', '/listview_divider_demo'),
    NavItem('ListView divider indent', '/listview_divider_indent_demo'),
    NavItem('ListTile.divideTiles()', '/listtile_divide_tiles_demo'),
    NavItem('Horizontal ListView', '/horizontal_listview'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Playground'),
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

class BasicList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic ListView'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        Text('Simple List Item Text 1'),
        Text('Simple List Item Text 2'),
        Text('Simple List Item Text 3'),
        Text('Simple List Item Text 4'),
      ],
    );
  }
}

typedef GetListItem(int index);

class HorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Using ListTile'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return Column(
      children: <Widget>[
        _getHorizontalListView(_getListItem),
        _getHorizontalListView(_getListItemWithDivider),
        _getHorizontalListView(_getListItemWithCustomDivider),
      ]
          .map((item) => Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: item,
              ))
          .toList(),
    );
  }

  _getHorizontalListView(GetListItem getListItem) {
    List<Widget> list = List.generate(30, (index) => getListItem(index));
    return Container(
      height: 100.0,
      child: ListView(
        children: list,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  _getListItem(int index) {
    return Container(
      width: 100.0,
      child: Center(child: Text('Item $index')),
    );
  }

  _getListItemWithDivider(int index) {
    return Container(
      width: 100.0,
      child: Row(
        children: <Widget>[
          Expanded(child: Center(child: Text('Item $index'))),
          RotatedBox(
            quarterTurns: 1,
            child: Divider(
              height: 0.0,
            ),
          )
        ],
      ),
    );
  }

  _getListItemWithCustomDivider(int index) {
    return Container(
      width: 100.0,
      child: Row(
        children: <Widget>[
          Expanded(child: Center(child: Text('Item $index'))),
          SizedBox(
            height: 100.0,
            width: 5.0,
            child: Container(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class ListTileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Using ListTile'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('Simple ListTile Item Title 1'),
        ),
        ListTile(
          title: Text('Simple ListTile Item Title 2'),
          leading: Icon(Icons.map),
        ),
        ListTile(
          title: Text('Simple ListTile Item Title 3'),
          subtitle: Text('Subtitle 3'),
        ),
        ListTile(
          title: Text('Simple ListTile Item Title 4'),
          trailing: Icon(Icons.delete_forever),
        ),
      ],
    );
  }
}

class ListTileDivideTilesDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListTile.divideTiles'),
      ),
      body: _getBody(context),
    );
  }

  _getBody(BuildContext context) {
    return ListView(
      children: _getListTilesWithDivider(context),
    );
  }

  _getListTilesWithDivider(BuildContext context) {
    List<Widget> list = List.generate(
      10,
      (index) => ListTile(
            title: Text('Text $index'),
          ),
    );

    var dividedList = ListTile
        .divideTiles(
          context: context,
          color: Theme.of(context).dividerColor,
          tiles: list,
        )
        .toList();

    return dividedList;
  }
}

class ListViewBuilderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView.builder()'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }
}

class ListViewDividerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListViewDivider'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    var itemCount = 50;

    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            ListTile(
              title: Text('Item $index'),
            ),
            //Do not add divider to last item
            index == itemCount-1 ? Container() : Divider(height: 1.0,),
          ],
        );
      },
    );
  }
}

class ListViewDividerIndentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Divider Indent'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    var itemCount = 50;

    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Item $index'),
            ),
            //Do not add divider to last item
            index == itemCount - 1
                ? Container()
                : Divider(
                    color: Colors.pink,
                    indent: 72.0,
                  ),
          ],
        );
      },
    );
  }
}