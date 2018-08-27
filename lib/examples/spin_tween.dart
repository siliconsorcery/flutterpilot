import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// by: Raouf_Rachiche
void main() => runApp(MaterialApp(home: SpinTween()));

const Color bkColor = Color(0xFF3A425F);
const Color btnColor = Color(0xFFFF4C5B);

class DelayTween extends Tween<double> {
  final double delay;

  DelayTween({
    double begin,
    double end,
    this.delay,
  }) : super(begin: begin, end: end);

  @override
  double lerp(double t) {
    return super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);
  }

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}

class AngleDelayTween extends Tween<double> {
  final double delay;

  AngleDelayTween({
    double begin,
    double end,
    this.delay,
  }) : super(begin: begin, end: end);

  @override
  double lerp(double t) => super.lerp(math.sin((t - delay) * math.pi * 0.5));

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}

class SpinTween extends StatefulWidget {
  @override
  _SpinTweenState createState() => _SpinTweenState();
}

class _SpinTweenState extends State<SpinTween> {
  Offset cardOffset = const Offset(0.0, 0.0);
  Offset dragStart;
  Offset dragPosition;

  void _onPanStart(DragStartDetails details) {
    dragStart = details.globalPosition;
    setState(() {});
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      dragPosition = details.globalPosition;
      cardOffset = dragPosition - dragStart;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {
      dragStart = null;
      dragPosition = null;
      cardOffset = const Offset(0.0, 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bkColor,
      appBar: AppBar(
        title: Text("Spin Tween"),
      ),
      body: GestureDetector(
        onPanStart: _onPanStart,
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
        child: Transform(
          transform:
              new Matrix4.translationValues(cardOffset.dx, cardOffset.dy, 0.0),
          child: SpinKitCircle(
            size: 400.0,
            color: btnColor,
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: new FAB(sended: sended),
    );
  }
}

class FAB extends StatelessWidget {
  const FAB({
    Key key,
    @required this.sended,
  }) : super(key: key);

  final bool sended;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: btnColor,
      child: sended
          ? Icon(FontAwesomeIcons.paperPlane)
          : SpinKitCircle(
              color: bkColor,
            ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          Center(
              child: Text(
            "Got feedback!",
            style: TextStyle(fontSize: 50.0, color: Colors.white),
          )),
          Center(
            child: Text(
              "We want to hear you out",
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
          Container(
            height: 200.0,
            child: Card(
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: TextField(
                      maxLines: 5,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.camera),
                      label: Text("Add a picture"),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SpinKitCircle extends StatefulWidget {
  final Color color;
  final double size;

  const SpinKitCircle({
    Key key,
    @required this.color,
    this.size = 50.0,
  }) : super(key: key);

  @override
  _SpinKitCircleState createState() => new _SpinKitCircleState();
}

class _SpinKitCircleState extends State<SpinKitCircle>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Stack(
          children: [
            _circle(1, .0),
            _circle(2, -1.1),
            _circle(3, -1.0),
            _circle(4, -0.9),
            _circle(5, -0.8),
            _circle(6, -0.7),
            _circle(7, -0.6),
            _circle(8, -0.5),
            _circle(9, -0.4),
            _circle(10, -0.3),
            _circle(11, -0.2),
            _circle(12, -0.1),
          ],
        ),
      ),
    );
  }

  Widget _circle(int i, [double delay]) {
    final _size = widget.size * 0.12, _position = widget.size * .5;

    return Positioned.fill(
      left: _position,
      top: _position,
      child: Transform(
        transform: Matrix4.rotationZ(30.0 * (i - 1) * 0.0174533),
        child: Align(
          alignment: Alignment.center,
          child: SizeTransition(
            sizeFactor: DelayTween(begin: 0.5, end: 1.0, delay: delay)
                .animate(_controller),
            child: Container(
              width: _size,
              height: _size,
              decoration: BoxDecoration(
                color: widget.color,
                shape: BoxShape.rectangle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
