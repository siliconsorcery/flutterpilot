import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Handling Keyboard Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/closing_keyboard': (context) => ClosingKeyboardPage(),
        '/making_input_fields_visible_when_focused_issue': (context) =>
            MakingInputFieldsVisibleWhenFocusedIssuePage(),
        '/making_input_fields_visible_when_focused': (context) =>
            MakingInputFieldsVisibleWhenFocusedPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem('Closing Keyboard', '/closing_keyboard'),
    NavItem('Making Input Fields Visible When Focused Issue',
        '/making_input_fields_visible_when_focused_issue'),
    NavItem('Making Input Fields Visible When Focused Solution',
        '/making_input_fields_visible_when_focused'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Handling Keyboard Playground'),
      ),
      body: _getNavButtons(context),
    );
  }

  _getNavButtons(BuildContext context) {
    return ListView(
      children: _navItems
          .map(
            (item) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.pushNamed(context, item.routeName);
                    },
                    child: Text(
                      item.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
          )
          .toList(),
    );
  }
}

class NavItem {
  final title;
  final routeName;

  NavItem(this.title, this.routeName);
}

class ClosingKeyboardPage extends StatefulWidget {
  @override
  _ClosingKeyboardPageState createState() => _ClosingKeyboardPageState();
}

class _ClosingKeyboardPageState extends State<ClosingKeyboardPage> {
  bool _enableClosingKeyboardOnTapOutside = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Closing Keyboard'),
        actions: <Widget>[
          Switch(
              activeColor: Colors.orange,
              value: _enableClosingKeyboardOnTapOutside,
              onChanged: (value) {
                setState(() {
                  _enableClosingKeyboardOnTapOutside = value;
                });
                print(value);
              }),
        ],
      ),
      body: Center(child: _getBody()),
    );
  }

  Widget _getBody() => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return GestureDetector(
            onTap: () {
              _enableClosingKeyboardOnTapOutside
                  ? FocusScope.of(context).requestFocus(FocusNode())
                  : Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Enable Closing Keyboard '
                              'on Tapping Outside of Input Fields'),
                        ),
                      );
            },
            child: SingleChildScrollView(
              child: new ConstrainedBox(
                constraints: new BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(labelText: 'email'),
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'password'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
}

//Credits:
// https://gist.github.com/collinjackson/50172e3547e959cba77e2938f2fe5ff5
// https://www.didierboelens.com/2018/04/hint-4-ensure-a-textfield-or-textformfield-is-visible-in-the-viewport-when-has-the-focus/

/// A widget that ensures it is always visible when focused.
class EnsureVisibleWhenFocused extends StatefulWidget {
  const EnsureVisibleWhenFocused({
    Key key,
    @required this.child,
    @required this.focusNode,
    this.curve: Curves.ease,
    this.duration: const Duration(milliseconds: 100),
  }) : super(key: key);

  /// The node we will monitor to determine if the child is focused
  final FocusNode focusNode;

  /// The child widget that we are wrapping
  final Widget child;

  /// The curve we will use to scroll ourselves into view.
  ///
  /// Defaults to Curves.ease.
  final Curve curve;

  /// The duration we will use to scroll ourselves into view
  ///
  /// Defaults to 100 milliseconds.
  final Duration duration;

  EnsureVisibleWhenFocusedState createState() =>
      new EnsureVisibleWhenFocusedState();
}

class EnsureVisibleWhenFocusedState extends State<EnsureVisibleWhenFocused>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_ensureVisible);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    widget.focusNode.removeListener(_ensureVisible);
    super.dispose();
  }

  ///
  /// This routine is invoked when the window metrics have changed.
  /// This happens when the keyboard is open or dismissed, among others.
  /// It is the opportunity to check if the field has the focus
  /// and to ensure it is fully visible in the viewport when
  /// the keyboard is displayed
  ///
  @override
  void didChangeMetrics() {
    if (widget.focusNode.hasFocus) {
      _ensureVisible();
    }
  }

  Future<Null> _ensureVisible() async {
    // Wait for the keyboard to come into view
    // TODO: position doesn't seem to notify listeners when metrics change,
    // perhaps a NotificationListener around the scrollable could avoid
    // the need insert a delay here.
    await new Future.delayed(const Duration(milliseconds: 300));

    if (!widget.focusNode.hasFocus) return;

    final RenderObject object = context.findRenderObject();
    final RenderAbstractViewport viewport = RenderAbstractViewport.of(object);
    assert(viewport != null);

    ScrollableState scrollableState = Scrollable.of(context);
    assert(scrollableState != null);

    ScrollPosition position = scrollableState.position;
    double alignment;
    // var offset = viewport.getOffsetToReveal(object, 0.0).offset;
    // if (position.pixels > offset) {
    if (position.pixels > viewport.getOffsetToReveal(object, 0.0).offset) {
      // Move down to the top of the viewport
      alignment = 0.0;
    } else if (position.pixels < viewport.getOffsetToReveal(object, 1.0).offset) {
      // Move up to the bottom of the viewport
      alignment = 1.0;
    } else {
      // No scrolling is necessary to reveal the child
      return;
    }
    position.ensureVisible(
      object,
      alignment: alignment,
      duration: widget.duration,
      curve: widget.curve,
    );
  }

  Widget build(BuildContext context) => widget.child;
}

class MakingInputFieldsVisibleWhenFocusedPage extends StatefulWidget {
  @override
  _MakingInputFieldsVisibleWhenFocusedPageState createState() =>
      _MakingInputFieldsVisibleWhenFocusedPageState();
}

class _MakingInputFieldsVisibleWhenFocusedPageState
    extends State<MakingInputFieldsVisibleWhenFocusedPage> {
  FocusNode emailFocus = FocusNode();
  FocusNode nameFocus = FocusNode();
  FocusNode surnameFocus = FocusNode();
  FocusNode ageFocus = FocusNode();
  FocusNode occupationFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Field Visibility Solution'),
      ),
      body: Center(child: _getBody()),
    );
  }

  //the solution is by using Collin Jackson's EnsureVisibleWhenFocused widget
  // Wrap all your TextFields with this and
  // create a separate FocusNode for each TextField
  // also use the same FocusNode for EnsureVisibleWhenFocused and TextField
  Widget _getBody() => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                EnsureVisibleWhenFocused(
                  focusNode: emailFocus,
                  child: TextFormField(
                    focusNode: emailFocus,
                    decoration: InputDecoration(labelText: 'email'),
                  ),
                ),
                EnsureVisibleWhenFocused(
                  focusNode: nameFocus,
                  child: TextFormField(
                    focusNode: nameFocus,
                    decoration: InputDecoration(labelText: 'name'),
                  ),
                ),
                EnsureVisibleWhenFocused(
                  focusNode: surnameFocus,
                  child: TextFormField(
                    focusNode: surnameFocus,
                    decoration: InputDecoration(labelText: 'surname'),
                  ),
                ),
                EnsureVisibleWhenFocused(
                  focusNode: ageFocus,
                  child: TextFormField(
                    focusNode: ageFocus,
                    decoration: InputDecoration(labelText: 'age'),
                  ),
                ),
                EnsureVisibleWhenFocused(
                  focusNode: occupationFocus,
                  child: TextFormField(
                    focusNode: occupationFocus,
                    decoration: InputDecoration(labelText: 'occupation'),
                  ),
                ),
                EnsureVisibleWhenFocused(
                  focusNode: passwordFocus,
                  child: TextFormField(
                    focusNode: passwordFocus,
                    decoration: InputDecoration(labelText: 'password'),
                  ),
                ),
                EnsureVisibleWhenFocused(
                  focusNode: confirmPasswordFocus,
                  child: TextFormField(
                    focusNode: confirmPasswordFocus,
                    decoration: InputDecoration(labelText: 'confirmPassword'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class MakingInputFieldsVisibleWhenFocusedIssuePage extends StatefulWidget {
  @override
  _MakingInputFieldsVisibleWhenFocusedIssuePageState createState() =>
      _MakingInputFieldsVisibleWhenFocusedIssuePageState();
}

class _MakingInputFieldsVisibleWhenFocusedIssuePageState
    extends State<MakingInputFieldsVisibleWhenFocusedIssuePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Field Visibility Issue'),
      ),
      body: Center(child: _getBody()),
    );
  }

  //First close the keyboard and then choose one of the input fields
  //in the bottom
  //and you'll see that keyboard covers it and you manually need to scroll down
  //even though you tapped on it
  //so look the same file without the issue suffix to see solution
  //to this problem;)
  Widget _getBody() => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Just Close Keyboard and choose one input '
                    'field from the bottom to see the issue '
                    'The keyboard covers the selected input field '
                    'even though it has focus. '
                    'You have to manually scroll down to see it.'),
                TextFormField(
                  decoration: InputDecoration(labelText: 'email'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'name'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'surname'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'age'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'occupation'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'password'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'confirm password'),
                )
              ],
            ),
          ),
        ),
      );
}