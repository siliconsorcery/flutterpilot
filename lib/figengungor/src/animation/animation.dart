import 'package:flutter/material.dart';
import 'package:pilot/utils/mockups.dart';

import 'animation_state_demo.dart';
import 'animation_widget_examples.dart';
import 'basic_animation_demo.dart';
import 'custom_animated_widget_demo.dart';
import 'route_animation_demo.dart';

void main() => runApp(MaterialApp(home: AnimationExample()));

class AnimationExample extends StatelessWidget {

  final List<Example> _exampleList = [
    Example(
      title: 'Basic Animation Demo',
      child: BasicAnimationDemo(),
    ),
    Example(
      title: 'Custom AnimatedWidget',
      child: CustomAnimatedWidgetDemo(),
    ),
    Example(
      title: 'AnimatedWidget Examples',
      child: AnimatedWidgetExamples(),
    ),
    Example(
      title: 'Animation State Demo',
      child: AnimationStateDemo(),
    ),
    Example(
      title: 'Route Animation Demo',
      child: RouteAnimationDemo(),
    ),
  ];
  
  AnimationExample({
      Key key,
    this.title = "Animation Examples",
  }): super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        color: Colors.grey[300],
        child: Examples(list: _exampleList),
      ),
    );
  }
}