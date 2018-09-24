import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: AnimatedIconsDemo()));

class AnimatedIconsDemo extends StatefulWidget {
  AnimatedIconsDemo({
    Key key, 
    this.title = "Animated Icons Playground",
  }) : super(key: key);
  final String title;

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  _AnimatedIconsState createState() => new _AnimatedIconsState();
}

class _AnimatedIconsState extends State<AnimatedIconsDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 600),
      value: 1.0,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _status {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          getAnimatedIcon(AnimatedIcons.add_event, "Event to Add"),
          getAnimatedIcon(AnimatedIcons.arrow_menu, "Menu to Arrow"),
          getAnimatedIcon(AnimatedIcons.close_menu, "Menu to Close "),
          getAnimatedIcon(AnimatedIcons.ellipsis_search, "Search to Ellipsis"),
          getAnimatedIcon(AnimatedIcons.event_add, "Add to Event"),
          getAnimatedIcon(AnimatedIcons.home_menu, "Menu to Home"),
          getAnimatedIcon(AnimatedIcons.list_view, "View to List"),
          getAnimatedIcon(AnimatedIcons.menu_arrow, "Arrow to Menu"),
          getAnimatedIcon(AnimatedIcons.menu_close, "Close to Menu"),
          getAnimatedIcon(AnimatedIcons.menu_home, "Home to Menu"),
          getAnimatedIcon(AnimatedIcons.pause_play, "Play to Pause"),
          getAnimatedIcon(AnimatedIcons.play_pause, "Pause to Play"),
          getAnimatedIcon(AnimatedIcons.search_ellipsis, "Ellipsis to Search"),
          getAnimatedIcon(AnimatedIcons.view_list, "List to View"),
        ],
      ),
    );
  }

  getAnimatedIcon(AnimatedIconData iconData, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: GestureDetector(
          onTap: () {
            _controller.fling(velocity: _status ? -1.0 : 1.0);
          },
          child: ListTile(
            leading: AnimatedIcon(
              icon: iconData,
              progress: _controller.view,
            ),
            title: Text(title),
          )
        )
      ),
    );
  }

}