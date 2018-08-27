import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() => runApp(MaterialApp(home: TextExamples()));

class TextExamples extends StatefulWidget {
  TextExamples({
    Key key, 
    this.title = "Text Playground",
  }) : super(key: key);
  final String title;

  @override
  _TextExamplesState createState() => _TextExamplesState();
}

class _TextExamplesState extends State<TextExamples> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: textSpanPage());
  }

  Widget textSpanPage() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          textButtons(
            "Text Span",
            "Text Span",
          ),
          textButtons(
            "Text Underline",
            "Text Underline",
          ),
        ],
      ),
    );
  }

  textButtons(String text, String route) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        child: Text(text),
        shape: RoundedRectangleBorder(),
        color: Colors.red,
        textColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}

class TextSpanExample extends StatefulWidget {
  final String title;

  TextSpanExample({Key key, this.title}) : super(key: key);

  @override
  _TextSpanState createState() => _TextSpanState();
}

class _TextSpanState extends State<TextSpanExample> {
  final recognizer = TapGestureRecognizer()
    ..onTap = () {
      print("You have tapped Bhavik");
    };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: textSpanPage());
  }

  Widget textSpanPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        textSpan(),
      ],
    );
  }

  textSpan() {
    return Row(
      children: <Widget>[
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'Hello, ',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24.0,
                  color: Colors.blue.shade500,
                ),
              ),
              TextSpan(
                recognizer: recognizer,
                text: 'Flutter',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 24.0,
                  color: Colors.blue.shade900,
                ),
              ),
              TextSpan(
                text: 'Playground',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24.0,
                  color: Colors.blue.shade700,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        ),
      ],
    );
  }
}

class TextUnderline extends StatefulWidget {
  final String title;

  TextUnderline({Key key, this.title}) : super(key: key);

  @override
  _TextUnderlineState createState() => _TextUnderlineState();
}

class _TextUnderlineState extends State<TextUnderline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: textSpanPage());
  }

  Widget textSpanPage() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          textUnderLine("Flutter", TextDecorationStyle.solid, Colors.green),
          textUnderLine("Flutter", TextDecorationStyle.dashed, Colors.blue),
          textUnderLine("Flutter", TextDecorationStyle.dotted, Colors.red),
          textUnderLine("Flutter", TextDecorationStyle.wavy, Colors.amber),
        ],
      ),
    );
  }

  textUnderLine(String text, TextDecorationStyle decorationStyle, Color color) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 48.0,
          color: color,
          decoration: TextDecoration.underline,
          decorationStyle: decorationStyle),
    );
  }
}