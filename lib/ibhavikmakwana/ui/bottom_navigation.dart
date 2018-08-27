import 'package:flutter/material.dart';
import 'package:pilot/mockups.dart';

void main() => runApp(MaterialApp(home: BottomNavigationzz()));

class BottomNavigationzz extends StatefulWidget {
  BottomNavigationzz({
    Key key,
    this.title ="Bottom Navigation Playground",
  }) : super(key: key);
  final String title;

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigationzz> {
  PageController _pageController;
  var _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        children: <Widget>[
          MockupScreen(
            title: 'Photo',
            color: Colors.orangeAccent,
          ),
          MockupScreen(
            title: 'Map',
            color: Colors.redAccent,
          ),
          MockupScreen(
            title: 'Favorite',
            color: Colors.blueAccent,
          ),
        ],
        controller: _pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            title: Text("Photo"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text("Map"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favorite"),
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }

  ///
  /// Bottom Navigation tap listener
  ///
  void navigationTapped(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}