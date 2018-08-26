import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'GridView Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/gridview_count': (context) => GridViewCount(),
        '/gridview_child_aspect_ratio': (context) => GridViewChildAspectRatio(),
        '/gridview_spacing': (context) => GridViewSpacing(),
        '/gridview_builder': (context) => GridViewBuilder(),
        '/gridview_gridtile': (context) => GridViewGridTile(),
        '/gridview_horizontal': (context) => GridViewHorizontal(),
        '/gridview_divider': (context) => GridViewDivider(),
      },

    );
  }
}

class HomePage extends StatelessWidget {

  final _navItems = [
    NavItem('GridView.count()', '/gridview_count'),
    NavItem('GridView ChildAspectRatio', '/gridview_child_aspect_ratio'),
    NavItem('GridView Spacing', '/gridview_spacing'),
    NavItem('GridView.builder()', '/gridview_builder'),
    NavItem('GridView GridTile', '/gridview_gridtile'),
    NavItem('GridView Horizontal', '/gridview_horizontal'),
    NavItem('GridView Divider', '/gridview_divider'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Playground'),
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

class GridViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView.builder()'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return GridView.builder(
      padding: EdgeInsets.all(4.0),
      itemCount: 50,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return _getGridItem(index);
      },
    );
  }

  _getGridItem(int index) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Icon(Icons.person), Text('Item $index')],
      ),
    );
  }
}

class GridViewChildAspectRatio extends StatelessWidget {

  final _itemHeight = 100.0;
  final _crossAxisCount = 2;

  @override
  Widget build(BuildContext context) {

    final itemWidth = MediaQuery.of(context).size.width / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text('GridView ChildAspectRatio'),
      ),
      body: _getBody(itemWidth),
    );
  }

  _getBody(double itemWidth) {
    return GridView.count(
      crossAxisCount: _crossAxisCount,
      childAspectRatio: itemWidth/_itemHeight,
      children: _getGridItems(),
    );
  }

  _getGridItems() {
    List<Widget> gridItems = List.generate(50, (index) => _getGridItem(index));
    return gridItems;
  }

  _getGridItem(int index) {
    return Container(
      height: _itemHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Icon(Icons.person), Text('Item $index')],
      ),
    );
  }
}

class GridViewCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView.count()'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return GridView.count(
      crossAxisCount: 2,
      children: _getGridItems(),
    );
  }

  _getGridItems() {
    List<Widget> gridItems = List.generate(50, (index) => _getGridItem(index));
    return gridItems;
  }

  _getGridItem(int index) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.person),
          Text('Item $index')
        ],
      ),
    );
  }
}

class GridViewDivider extends StatelessWidget {

  final _itemCount = 50;
  final _crossAxisCount = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Divider'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return GridView.count(
      padding: EdgeInsets.all(10.0),
      scrollDirection: Axis.vertical,
      crossAxisCount: _crossAxisCount,
      children: _getGridItems(),
    );
  }

  _getGridItems() {
    List<Widget> gridItems = List.generate(_itemCount, (index) => _getGridItem(index));
    return gridItems;
  }

  _getGridItem(int index) {
    return Container(
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(border: Border.all()),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.person,
                          ),
                          Text('Item $index'),
                        ],
                      ),
                    ),
                  ),
                  ((index + 1) % _crossAxisCount) == 0
                      ? Container()
                      : _getVerticalDivider(),
                ],
              ),
            ),
            _getHorizontalDivider(),
          ],
        ),
      ),
    );
  }


  _getHorizontalDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Divider(
        height: 0.0,
        color: Colors.black,
      ),
    );
  }

  _getVerticalDivider() {
    return RotatedBox(
      child: _getHorizontalDivider(),
      quarterTurns: 1,
    );
  }

}

class GridViewGridTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView GridTile'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return GridView.builder(
      padding: EdgeInsets.all(4.0),
      itemCount: 50,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return _getGridTileItem(index);
      },
    );
  }

  _getGridTileItem(int index) {
    return GridTile(
      child: Container(
        color: Colors.green,
        child: Center(child: Text('Child Text')),
      ),
      header: Container(
        color: Colors.yellow,
        child: Text('Header $index'),
      ),
      footer: Container(
        color: Colors.pink,
        child: Text('Footer $index'),
      ),
    );
  }
}

class GridViewHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Horizontal'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return GridView.count(
      padding: EdgeInsets.all(10.0),
      scrollDirection: Axis.horizontal,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      crossAxisCount: 3,
      children: _getGridItems(),
    );
  }

  _getGridItems() {
    List<Widget> gridItems = List.generate(20, (index) => _getGridItem(index));
    return gridItems;
  }

  _getGridItem(int index) {
    return Container(
      //color: Colors.green,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.person,
            ),
            Text('Item $index'),
          ],
        ),
      ),
    );
  }
}

class GridViewSpacing extends StatelessWidget {
  final _crossAxisCount = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Spacing'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return GridView.count(
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      crossAxisCount: _crossAxisCount,
      padding: EdgeInsets.all(4.0),
      children: _getGridItems(),
    );
  }

  _getGridItems() {
    List<Widget> gridItems = List.generate(50, (index) => _getGridItem(index));
    return gridItems;
  }

  _getGridItem(int index) {
    return Container(
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Icon(Icons.person), Text('Item $index')],
      ),
    );
  }
}