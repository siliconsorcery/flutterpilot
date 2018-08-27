

import 'package:flutter/material.dart';
import 'package:pilot/figengungor/animation/animation.dart';
import 'package:pilot/figengungor/app_bar.dart';
import 'package:pilot/figengungor/bottom_navigation.dart';
import 'package:pilot/figengungor/button.dart';
import 'package:pilot/figengungor/card.dart';
import 'package:pilot/figengungor/checkbox.dart';
import 'package:pilot/figengungor/clip_path.dart';
import 'package:pilot/figengungor/column_row.dart';
import 'package:pilot/figengungor/diagonal.dart';
import 'package:pilot/figengungor/dialog.dart';
import 'package:pilot/figengungor/dismissible.dart';
import 'package:pilot/figengungor/drawer.dart';
import 'package:pilot/figengungor/dropdown_button.dart';
import 'package:pilot/figengungor/form.dart';
import 'package:pilot/figengungor/gesture_detector.dart';
import 'package:pilot/figengungor/gridview.dart';
import 'package:pilot/figengungor/handling_keyboard.dart';
import 'package:pilot/figengungor/http_requests/http_requests.dart';
import 'package:pilot/figengungor/image.dart';
import 'package:pilot/figengungor/launching_url.dart';
import 'package:pilot/figengungor/listview.dart';
import 'package:pilot/figengungor/localization.dart';
import 'package:pilot/figengungor/navigation.dart';
import 'package:pilot/figengungor/radio.dart';
import 'package:pilot/figengungor/read_more.dart';
import 'package:pilot/figengungor/shared_prefs.dart';
import 'package:pilot/figengungor/single_child_scroll_view.dart';
import 'package:pilot/figengungor/snackbar.dart';
import 'package:pilot/figengungor/stack.dart';
import 'package:pilot/figengungor/tab_bar.dart';
import 'package:pilot/figengungor/textfield.dart';
import 'package:pilot/mockups.dart';

void main() => runApp(MaterialApp(home: FigenGungor()));

class FigenGungor extends StatelessWidget {
  FigenGungor({
    Key key,
    this.title = "Figen Güngör Playground"
  }): super(key: key);
  final String title;

  final List<Example> _exampleList = [
    Example(
      title: "Animations",
      child: AnimationExample(),
    ),
    Example(
      title: "HTTP Requests",
      child: HttpRequestsExample(),
    ),
    Example(
      title: "App Bar",
      child: AppBarExample(),
    ),
    Example(
      title: "Bottom Navigation",
      child: BottomNavigationExample(),
    ),
    Example(
      title: "Buttons",
      child: ButtonExample(),
    ),
    Example(
      title: "Cards",
      child: CardExample(),
    ),
    Example(
      title: "Checkbox",
      child: CheckboxExample(),
    ),
    Example(
      title: "Clip Path",
      child: ClipPathExample(),
    ),
    Example(
      title: "Column & Row",
      child: ColumnRowExample(),
    ),
    Example(
      title: "Diagonal Example",
      child: DiagonalExample(),
    ),
    Example(
      title: "Dialog Example",
      child: DialogExample(),
    ),
    Example(
      title: "Dismissible Example",
      child: DismissibleExample(),
    ),
    Example(
      title: "Drawer Example",
      child: DrawerExample(),
    ),
    Example(
      title: "Dropdown Button",
      child: DropDownButtonExample(),
    ),
    Example(
      title: "Form",
      child: FormExample(),
    ),
    Example(
      title: "Gesture Detector",
      child: GestureDetectorExample(),
    ),
    Example(
      title: "Grid View",
      child: GridViewExample(),
    ),
    Example(
      title: "Keyboard",
      child: KeyboardExample(),
    ),
    Example(
      title: "Image",
      child: ImageExample(),
    ),
    Example(
      title: "Launching Url",
      child: LaunchingUrlExample(),
    ),
    Example(
      title: "List View",
      child: ListViewExample(),
    ),
    Example(
      title: "Localization",
      child: LocalizationExample(),
    ),
    Example(
      title: "Navigation",
      child: NavigationExample(),
    ),
    Example(
      title: "Radio",
      child: RadioExample(),
    ),
    Example(
      title: "Read More",
      child: ReadMoreExample(),
    ),
    Example(
      title: "Shared Prefs",
      child: SharedPrefsExample(),
    ),
    Example(
      title: "Single Child Scroll View",
      child: SingleChildScrollViewExample(),
    ),
    Example(
      title: "Snackbar",
      child: SnackbarExample(),
    ),
    Example(
      title: "Stack",
      child: StackExample(),
    ),
    Example(
      title: "Tabbar",
      child: TabBarExample(),
    ),
    Example(
      title: "Text Field",
      child: TextFieldExample(),
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