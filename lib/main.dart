import 'package:flutter/material.dart';
import 'package:pilot/draggable_list.dart';
import 'package:pilot/signature.dart';
import 'package:pilot/strings.dart';
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
import 'package:pilot/saturation.dart';

void main() => runApp(MyApp());

class Example {
  Example({this.title, this.child});
  final String title;
  Widget child;
}

final List<Example> examples = [
  Example(
    title: Strings.draggableListTitle,
    child: DraggableListExample(title: Strings.draggableListTitle),
  ),
  Example(
    title: Strings.signatureExampleTitle,
    child: SignatureExample(title: Strings.signatureExampleTitle),
  ),
  Example(
    title: Strings.saturationTitle,
    child: SaturationExample(title: Strings.saturationTitle),
  ),
  Example(
    title: Strings.appBarTitle, 
    child: AppBarExample(title: Strings.appBarTitle),
  ),
  Example(
    title: Strings.tabBarTitle,
    child: TabBarExample(title: Strings.tabBarTitle),
  ),
  Example(
    title: Strings.navigationDrawerTitle,
    child: NavigationDrawer(title: Strings.navigationDrawerTitle),
  ),
  Example(
    title: Strings.collapsibleToolbarTitle,
    child: CollapsibleToolbar(title: Strings.collapsibleToolbarTitle)
  ),
  Example(
    title: Strings.bottomNavigationTitle,
    child: BottomNavigationzz(title: Strings.bottomNavigationTitle)
  ),
  Example(
    title: Strings.animatedIconsTitle,
    child: AnimatedIconsDemo(title: Strings.animatedIconsTitle),
  ),
  Example(
    title: Strings.animatedSizeTitle,
    child: AnimatedSizeDemo(title: Strings.animatedSizeTitle)
  ),
  Example(
    title: Strings.progressButtonTitle,
    child: ProgressButton(title: Strings.progressButtonTitle),
  ),
  Example(
    title: Strings.staggerDemoTitle,
    child: StaggerDemo(title: Strings.staggerDemoTitle),
  ),
  Example(
    title: Strings.stepperExampleTitle,
    child: StepperExample(title: Strings.stepperExampleTitle),
  ),
  Example(
    title: Strings.hardwareKeyExampleTitle,
    child: RawKeyboardDemo(title: Strings.hardwareKeyExampleTitle),
  ),
  Example(
    title: Strings.dragDropExampleTitle,
    child: DragAndDropExample(title: Strings.dragDropExampleTitle),
  ),
  Example(
    title: Strings.textExampleExampleTitle,
    child: TextExamples(title: Strings.textExampleExampleTitle)
  ),
  Example(
    title: Strings.animatedSwitcherExampleTitle,
    child: AnimatedSwitcherExample(title: Strings.animatedSwitcherExampleTitle),
  ),
  Example(
    title: Strings.aboutListTileExampleTitle,
    child: AboutListTileExample(title: Strings.aboutListTileExampleTitle),
  ),
  Example(
    title: Strings.lifeCycleStateExampleTitle,
    child: Lifecycle(title: Strings.lifeCycleStateExampleTitle),
  ),
];

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: Strings.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: Strings.fontRobotoRegular,
        ),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(title: Strings.appName),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      value: 1.0,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool status = false;

  bool get _status {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _controller.fling(velocity: _status ? -2.0 : 2.0);
              setState(() {
                status = _status;
              });
            },
            icon: AnimatedIcon(
              icon: AnimatedIcons.view_list,
              progress: _controller.view,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.red,
        child: _buildExampleItemsWidget(_status),
      ),
    );
  }

  _buildExampleItemsWidget(bool status) {
    var columns = 2;
    var ratio = 3.0;
    if (status) {
      columns = 1;
      ratio = 6.0;
    }
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        childAspectRatio: ratio,
      ),
      itemBuilder: (BuildContext context, int index) =>
      ExampleItem(
        example: examples[index],
      ),
      itemCount: examples.length,
    );
  }
}

class ExampleItem extends StatelessWidget {
  final Example example;
  final ValueChanged<Example> onTap;

  const ExampleItem({
    Key key,
    @required this.example,
    this.onTap,
  }) : assert(example != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(3.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      elevation: 1.0,
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.yellow, 
          // gradient: LinearGradient(colors: [Colors.yellow, Colors.red]),
          // image: DecorationImage(
          //   colorFilter: ColorFilter.mode(Colors.white.withAlpha(200), BlendMode.lighten),
          //   fit: BoxFit.cover,
          //   image: Image.asset('assets/avengers.jpg').image,
          // ),
          border: Border(
            left: BorderSide(
              width: 8.0,
              color: Colors.lightGreen,
            ),
            right: BorderSide(
              width: 8.0,
              color: Colors.lightBlue,
            )
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => example.child,
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    example.title,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
              ),
            ],
          ),
        ),
      ),
    );
  }
}