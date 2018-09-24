import 'package:flutter/material.dart';
import 'package:pilot/utils/mockups.dart';

import 'src/animation/animation.dart';
import 'src/app_bar.dart';
import 'src/bottom_navigation.dart';
import 'src/button.dart';
import 'src/card.dart';
import 'src/checkbox.dart';
import 'src/clip_path.dart';
import 'src/column_row.dart';
import 'src/diagonal.dart';
import 'src/dialog.dart';
import 'src/dismissible.dart';
import 'src/drawer.dart';
import 'src/dropdown_button.dart';
import 'src/form.dart';
import 'src/gesture_detector.dart';
import 'src/gridview.dart';
import 'src/handling_keyboard.dart';
import 'src/http_requests/http_requests.dart';
import 'src/image.dart';
import 'src/launching_url.dart';
import 'src/listview.dart';
import 'src/localization.dart';
import 'src/navigation.dart';
import 'src/radio.dart';
import 'src/read_more.dart';
import 'src/shared_prefs.dart';
import 'src/single_child_scroll_view.dart';
import 'src/snackbar.dart';
import 'src/stack.dart';
import 'src/tab_bar.dart';
import 'src/textfield.dart';

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