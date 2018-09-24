import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: AboutListTileExample()));

class AboutListTileExample extends StatefulWidget {
  AboutListTileExample({
    Key key, 
    this.title = "About List Tile Playground",
  }) : super(key: key);
  final String title;

  @override
  _AboutListTileState createState() => new _AboutListTileState();
}

class _AboutListTileState extends State<AboutListTileExample> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            AboutListTile(
              icon: FlutterLogo(),
              child: Text("About"),
              aboutBoxChildren: <Widget>[
                Text("Playground app for Flutter. Contains list of examples."),
              ],
              applicationIcon: FlutterLogo(),
              applicationName: "Flutter Playground",
              applicationVersion: "1.0.0",
            ),
          ],
        ),
      ),
    );
  }
}