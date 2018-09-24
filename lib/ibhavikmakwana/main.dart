import 'package:flutter/material.dart';
import 'package:pilot/utils/mockups.dart';

import 'src/about_list_title.dart';
import 'src/animated_icons.dart';
import 'src/animated_size.dart';
import 'src/animated_switcher.dart';
import 'src/app_bar.dart';
import 'src/bottom_navigation.dart';
import 'src/collapsible_toolbar.dart';
import 'src/drag_drop.dart';
import 'src/keyboard.dart';
import 'src/life_cycle.dart';
import 'src/navigation_drawer.dart';
import 'src/progress_button.dart';
import 'src/staggered.dart';
import 'src/stepper.dart';
import 'src/tab_bar.dart';
import 'src/text.dart';

void main() => runApp(MaterialApp(home: IBhavikMakwana()));

class IBhavikMakwana extends StatelessWidget {
  IBhavikMakwana({
    Key key,
    this.title = "Bhavik Makwana Playground"
  }): super(key: key);
  final String title;

  final List<Example> _exampleList = [
    Example(
      title: "App Bar", 
      child: AppBarExample(),
    ),
    Example(
      title: "Tab Bar",
      child: TabBarExample(),
    ),
    Example(
      title: "Navigation Drawer",
      child: NavigationDrawer(),
    ),
    Example(
      title: "Collapsible Toolbar",
      child: CollapsibleToolbar()
    ),
    Example(
      title: "Bottom Navigation",
      child: BottomNavigationzz()
    ),
    Example(
      title: "Animated Icons",
      child: AnimatedIconsDemo(),
    ),
    Example(
      title: "Animated Size",
      child: AnimatedSizeDemo()
    ),
    Example(
      title: "Progress Button",
      child: ProgressButton(),
    ),
    Example(
      title: "Stagger Animation",
      child: StaggerDemo(),
    ),
    Example(
      title: "Stepper",
      child: StepperExample(),
    ),
    Example(
      title: "Hardware Keys",
      child: RawKeyboardDemo(),
    ),
    Example(
      title: "Drag and Drop",
      child: DragAndDropExample(),
    ),
    Example(
      title: "Text",
      child: TextExamples(),
    ),
    Example(
      title: "Animated Switcher",
      child: AnimatedSwitcherExample(),
    ),
    Example(
      title: "About List Tile",
      child: AboutListTileExample(),
    ),
    Example(
      title: "Lifecycle State",
      child: Lifecycle(),
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