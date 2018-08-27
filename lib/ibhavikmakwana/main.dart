import 'package:flutter/material.dart';
import 'package:pilot/mockups.dart';
import 'package:pilot/ibhavikmakwana/ui/about_list_title.dart';
import 'package:pilot/ibhavikmakwana/ui/animated_icons.dart';
import 'package:pilot/ibhavikmakwana/ui/animated_size.dart';
import 'package:pilot/ibhavikmakwana/ui/animated_switcher.dart';
import 'package:pilot/ibhavikmakwana/ui/app_bar.dart';
import 'package:pilot/ibhavikmakwana/ui/bottom_navigation.dart';
import 'package:pilot/ibhavikmakwana/ui/collapsible_toolbar.dart';
import 'package:pilot/ibhavikmakwana/ui/drag_drop.dart';
import 'package:pilot/ibhavikmakwana/ui/keyboard.dart';
import 'package:pilot/ibhavikmakwana/ui/life_cycle.dart';
import 'package:pilot/ibhavikmakwana/ui/navigation_drawer.dart';
import 'package:pilot/ibhavikmakwana/ui/progress_button.dart';
import 'package:pilot/ibhavikmakwana/ui/staggered.dart';
import 'package:pilot/ibhavikmakwana/ui/stepper.dart';
import 'package:pilot/ibhavikmakwana/ui/tab_bar.dart';
import 'package:pilot/ibhavikmakwana/ui/text.dart';

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