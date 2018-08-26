import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

// https://stackoverflow.com/questions/46241071/create-signature-area-for-mobile-app-in-dart-flutter 
void main() => runApp(MaterialApp(home: SignatureExample(title: "Signature Example")));

class SignatureExample extends StatelessWidget {
  SignatureExample({
    Key key,
    this.title = "",
  }): super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Signature(),
    );
  }
}

class Signature extends StatefulWidget {
  SignatureState createState() => SignatureState();
}

class SignatureState extends State<Signature> {
  List<Offset> _points = <Offset>[];

  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          RenderBox referenceBox = context.findRenderObject();
          Offset localPosition = referenceBox.globalToLocal(details.globalPosition);
          _points = List.from(_points)
            ..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) => _points.add(null),
      child: SizedBox.expand(
        child: CustomPaint(
          painter: SignaturePainter(_points)
        ),
      ),
    );
  }
}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);
  final List<Offset> points;
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1], paint);
    }
  }
  bool shouldRepaint(SignaturePainter other) => other.points != points;
}

class Comp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var transform = Matrix4.identity()
      ..translate(0.0, 100.0, 0.0)
      ..rotateZ(vector.radians(45.0));
    return Transform(
      alignment: FractionalOffset.center,
      transform: transform,
      child: Container(
        constraints: BoxConstraints.expand(
          height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
        ),
        padding: const EdgeInsets.all(8.0),
        color: Colors.red,
        child: Text('Hello World', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white)),
        foregroundDecoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/avengers.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

