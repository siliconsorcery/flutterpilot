import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: DrawerExample()));

class DrawerExample extends StatelessWidget {
  DrawerExample({
    Key key,
    this.title = "Figen Gungor Playground"
  }): super(key: key);
  final String title;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                  child: Icon(
                Icons.account_circle,
                size: 90.0,
                color: Colors.white,
              )),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Favorites'),
              leading: Icon(Icons.star),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            AboutListTile(
              child: Text('About App'),
              icon: Icon(Icons.info),
              applicationName: 'Drawer Playground',
              applicationVersion: 'Version 0.0.1',
              applicationIcon: Icon(Icons.star),
              applicationLegalese: 'Made with Flutter',
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              child: Text('Open Drawer'),
            ),
          ],
        ),
      ),
    );
  }
}