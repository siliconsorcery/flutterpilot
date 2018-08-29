import 'package:flutter/material.dart';
import 'package:pilot/examples/draggable_list.dart';
import 'package:pilot/examples/signature.dart';
import 'package:pilot/examples/spin_tween.dart';
import 'package:pilot/figengungor/main.dart';
import 'package:pilot/ibhavikmakwana/main.dart';
import 'package:pilot/mockups.dart';
import 'package:pilot/state_management/main.dart';
import 'package:pilot/strings.dart';
import 'package:pilot/examples/saturation.dart';

void main() => runApp(MyApp());

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

class _MyHomePageState extends State<MyHomePage> {

  final List<Example> _exampleList = [
    Example(
      title: "State Management Playground",
      subtitle: "",
      child: StateManagementPage(),
    ),
    Example(
      title: "Figen Güngör Playground",
      color: Colors.yellow[200],
      child: FigenGungor(),
    ),
    Example(
      title: "Bhavik Makwana Playground",
      color: Colors.yellow[200],
      child: IBhavikMakwana(),
    ),
    Example(
      title: "Spin Tween",
      subtitle: "Raouf Rahiche",
      child: SpinTween(),
    ),
    Example(
      title: "Draggable List",
      child: DraggableListExample(),
    ),
    Example(
      title: "Signature",
      child: SignatureExample(),
    ),
    Example(
      title: "Saturation",
      child: SaturationExample(),
    ),

  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              print("TASK: Change list.");
            },
            icon: Icon(Icons.view_list),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[300],
        child: Examples(list: _exampleList),
      ),
    );
  }
}
