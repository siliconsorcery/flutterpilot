import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(home: RawKeyboardDemo()));

class RawKeyboardDemo extends StatefulWidget {
  RawKeyboardDemo({
    Key key,
    this.title = "Raw Keyboard Playground",
  }) : super(key: key);
  final String title;

  @override
  _HardwareKeyDemoState createState() => _HardwareKeyDemoState();
}

class _HardwareKeyDemoState extends State<RawKeyboardDemo> {
  final FocusNode _focusNode = FocusNode();
  RawKeyEvent _event;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleKeyEvent(RawKeyEvent event) {
    setState(() {
      _event = event;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RawKeyboardListener(
          focusNode: _focusNode,
          onKey: _handleKeyEvent,
          child: AnimatedBuilder(
            animation: _focusNode,
            builder: (BuildContext context, Widget child) {
              if (!_focusNode.hasFocus) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(_focusNode);
                  },
                  child: Text('Tap to focus', style: textTheme.display1),
                );
              }

              if (_event == null)
                return Text('Press Volume key', style: textTheme.display1);

              int flags;
              int codePoint;
              int keyCode;
              int scanCode;
              int metaState;
              final RawKeyEventData data = _event.data;

              if (data is RawKeyEventDataAndroid) {
                flags = data.flags;
                codePoint = data.codePoint;
                keyCode = data.keyCode;
                scanCode = data.scanCode;
                metaState = data.metaState;
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('${_event.runtimeType}', style: textTheme.subhead),
                  Text('flags: $flags', style: textTheme.subhead),
                  Text('codePoint: $codePoint', style: textTheme.subhead),
                  Text('keyCode: $keyCode', style: textTheme.subhead),
                  Text('scanCode: $scanCode', style: textTheme.subhead),
                  Text('metaState: $metaState', style: textTheme.subhead),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}