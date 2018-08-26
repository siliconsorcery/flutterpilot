import 'package:flutter/material.dart';

class AppBarExample extends StatelessWidget {
  AppBarExample({Key key, this.title}): super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ///App bar with background color
          Container(
            child: new AppBar(
              title: new Text("Title"),
              backgroundColor: Colors.orange,
              elevation: 4.0,
            ),
            margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
          ),

          ///App bar with Action items
          Container(
            margin: EdgeInsets.only(bottom: 16.0),
            child: new AppBar(
              title: new Text("Appbar actions"),
              actions: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.search),
                  onPressed: () {},
                ),
                new IconButton(
                  icon: new Icon(Icons.settings),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          ///Center text
          Container(
            margin: EdgeInsets.only(bottom: 16.0),
            child: new AppBar(
              title: new Text("Center"),
              centerTitle: true,
            ),
          ),

          ///IconTheme for the app bar
          Container(
            margin: EdgeInsets.only(bottom: 16.0),
            child: new AppBar(
              title: new Text("Appbar Icon and Text Theme"),
              actions: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.search),
                  onPressed: () {},
                ),
                new IconButton(
                  icon: new Icon(Icons.settings),
                  onPressed: () {},
                ),
              ],
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              textTheme: TextTheme(
                title: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),

          ///App bar with the title and subtitle
          Container(
            margin: EdgeInsets.only(bottom: 16.0),
            child: new AppBar(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Text(
                    "Title",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  new Text(
                    "subtitle",
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ),

          ///App bar with the title and and icon/image at start
          Container(
            margin: EdgeInsets.only(bottom: 16.0),
            child: new AppBar(
              backgroundColor: Colors.orangeAccent,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new FlutterLogo(),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: new Text(
                      "Title with image",
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///App Bar with transparent background
          Container(
            margin: EdgeInsets.only(bottom: 16.0),
            child: AppBar(
              backgroundColor: Colors.transparent,
              title: Text("Transparent AppBar"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}