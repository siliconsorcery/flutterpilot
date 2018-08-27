import 'package:flutter/material.dart';
import 'package:pilot/mockups.dart';

void main() => runApp(MaterialApp(home: ClipPathExample()));

class ClipPathExample extends StatelessWidget {
  ClipPathExample({
    Key key,
    this.title = "Clip Path"
  }): super(key: key);
  final String title;

  final List<Example> _exampleList = [
    Example(
      title: "Simple",
      child: DiagonalImageSimple(),
    ),
    Example(
      title: "Examples",
      child: DiagonalImageExamples(),
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
        child: Examples(list: _exampleList),
      )
    );
  }
}

class DiagonalClipperSimple extends CustomClipper<Path> {
  final double clipHeight;

  DiagonalClipperSimple(this.clipHeight);

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height - clipHeight);
    path.lineTo(size.width, 0.0);
    //close the path, it will connect start and end points with line
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

enum Position { TOP_LEFT, TOP_RIGHT, BOTTOM_LEFT, BOTTOM_RIGHT }

class DiagonalImage extends StatelessWidget {
  final Widget image;
  final double clipHeight;
  final Position position;

  const DiagonalImage(
      {Key key,
      @required this.image,
      @required this.clipHeight,
      this.position = Position.BOTTOM_LEFT})
      : assert(image != null),
        assert(clipHeight != null),
        assert(clipHeight > 0.0, 'clipHeight cannot be <= 0.0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DiagonalClipper(clipHeight, position),
      child: image,
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  final double clipHeight;
  final Position position;

  DiagonalClipper(this.clipHeight, this.position);

  @override
  Path getClip(Size size) {
    switch (position) {
      case Position.TOP_LEFT:
        return _getTopLeftPath(size);
      case Position.TOP_RIGHT:
        return _getTopRightPath(size);
      case Position.BOTTOM_LEFT:
        return _getBottomLeftPath(size);
      case Position.BOTTOM_RIGHT:
        return _getBottomRightPath(size);
      default:
        return _getBottomLeftPath(size);
    }
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

  _getTopLeftPath(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, clipHeight);
    path.close();
    return path;
  }

  _getTopRightPath(Size size) {
    var path = Path();
    path.moveTo(0.0, clipHeight);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  _getBottomLeftPath(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height - clipHeight);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  _getBottomRightPath(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - clipHeight);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }
}

class DiagonalImageExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diagonal Image Examples'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return ListView(
      children: <Widget>[
        DiagonalImage(
          image: Image.asset('assets/avengers.jpg'),
          clipHeight: 90.0,
        ),
        DiagonalImage(
          image: Image.asset('assets/avengers.jpg'),
          position: Position.BOTTOM_RIGHT,
          clipHeight: 90.0,
        ),
        DiagonalImage(
          image: Image.asset('assets/avengers.jpg'),
          position: Position.TOP_LEFT,
          clipHeight: 90.0,
        ),
        DiagonalImage(
          image: Image.asset('assets/avengers.jpg'),
          position: Position.TOP_RIGHT,
          clipHeight: 90.0,
        ),
      ]
          .map((item) => Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: item,
              ))
          .toList(),
    );
  }
}

class DiagonalImageSimple extends StatelessWidget {
  final double _clipHeight = 90.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diagonal Image Simple'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return Column(
      children: <Widget>[
        _getClipPath(),
      ],
    );
  }

  _getClipPath() {
    return ClipPath(
      clipper: DiagonalClipperSimple(_clipHeight),
      child: Image.asset('assets/avengers.jpg'),
    );
  }
}