
import 'package:flutter/material.dart';
import 'package:pilot/state_management/database.dart';
import 'package:pilot/state_management/inherited_page.dart';
import 'package:pilot/state_management/inherited_provider.dart';
import 'package:pilot/state_management/redux_page.dart';
import 'package:pilot/state_management/scoped_model_page.dart';
import 'package:pilot/state_management/set_state_page.dart';
import 'package:pilot/state_management/streams_page.dart';
import 'package:redux/redux.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() => runApp(MaterialApp(home: StateManagementPage()));

class StateManagementPage extends StatefulWidget {
  StateManagementPage({
    Key key,
    this.title = "State Playground",
  }): super(key: key);
  final String title;
  
  @override
  _StateManagementPageState createState() => _StateManagementPageState();
}

class _StateManagementPageState extends State<StateManagementPage> {
  int _currentIndex = 0;
  TabType _currentTab = TabType.setState;

  void _onSelection(int index) {
    TabType newTab = TabType.setState;
    switch (index) {
      case 0:
        newTab = TabType.setState;
        break;
      case 1:
        newTab = TabType.streams;
        break;
      case 2:
        newTab = TabType.scoped;
        break;
      case 3:
        newTab = TabType.redux;
        break;
      case 4:
        newTab = TabType.inherited;
        break;
    }
    setState(() {
      _currentIndex = index;
      _currentTab = newTab;
    });
  }

  Widget _buildContent() {
    var database = AppFirestore();
    var stream = database.countersStream();
    switch (_currentTab) {
      case TabType.setState:
        return SetStatePage(database: database, stream: stream,);
      case TabType.streams:
        return StreamsPage(database: database, stream: stream,);
      case TabType.scoped:
      return ScopedModel<CountersModel>(
        model: CountersModel(stream: stream),
        child: ScopedModelPage(database: database,),
      );
      case TabType.redux:
        var middleware = CountersMiddleware(
          database: database, 
          stream: stream
        );
        var store = Store<Counters>(
          reducer,
          initialState: Counters(),
          middleware: [middleware],
        );
        middleware.listen(store);
        return StoreProvider(
          store: store,
          child: ReduxPage(),
        );
      case TabType.inherited:
        return InheritedProvider(
          database: database,
          stream: stream,
          child: InheritedPage(),
        );
      default:
        return Text("TASK: WTF!");
    }
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    IconData icon,
    TabType tabType,
  }) {
    String text = tabItemName(tabType);
    return BottomNavigationBarItem(
      icon: Icon(icon,),
      title: Text(text,),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: _onSelection,
      // onTap: (index) => _onSelection(index),
      currentIndex: _currentIndex,
      fixedColor: Colors.red,
      items: [
        _buildBottomNavigationBarItem(
          icon: Icons.adjust,
          tabType: TabType.setState,
        ),
        _buildBottomNavigationBarItem(
          icon: Icons.clear_all,
          tabType: TabType.streams,
        ),
        _buildBottomNavigationBarItem(
          icon: Icons.arrow_downward,
          tabType: TabType.scoped,
        ),
        _buildBottomNavigationBarItem(
          icon: Icons.settings_input_component,
          tabType: TabType.redux,
        ),
        _buildBottomNavigationBarItem(
          icon: Icons.child_friendly,
          tabType: TabType.inherited,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}

enum TabType {
  setState,
  streams,
  scoped,
  redux,
  inherited,
}

String tabItemName(TabType type) {
  switch (type) {
    case TabType.setState:
      return "setState";
    case TabType.streams:
      return "Streams";
    case TabType.scoped:
      return "Scoped";
    case TabType.redux:
      return "Redux";
    case TabType.inherited:
      return "Inherited";
  }
  return null;
}