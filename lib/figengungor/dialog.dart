import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Dialog Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.pink,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/alert_dialog_demo': (context) => AlertDialogDemo(),
        '/full_screen_dialog_demo': (context) => FullScreenDialogDemo(),
        '/simple_dialog_demo': (context) => SimpleDialogDemo(),
        '/alert_dialog_single_choice_demo': (context) =>
            AlertDialogSingleChoiceDemo(),
        '/date_and_time_picker_demo': (context) => DateAndTimePickerDemo(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem('Alert Dialog', '/alert_dialog_demo'),
    NavItem('Full Screen Dialog', '/full_screen_dialog_demo'),
    NavItem('Simple Dialog', '/simple_dialog_demo'),
    NavItem('Alert Dialog Single Choice', '/alert_dialog_single_choice_demo'),
    NavItem('Date and TimePicker', '/date_and_time_picker_demo'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog Playground'),
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

class AlertDialogDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AlertDialog Demo')),
      body: _getBody(context),
    );
  }

  _showInfoDialog(BuildContext context, String message) {
    var alert = new AlertDialog(
      title: Text('Congrats! 🎉'),
      content: Text(message),
      actions: <Widget>[
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );

    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }

  _showActionDialog(BuildContext context, String title, String message) {
    var alert = new AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Disagree'.toUpperCase(),
            )),
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Agree'.toUpperCase(),
            )),
      ],
    );

    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }

  _showActionStackFullWidthButtonsDialog(
      BuildContext context, String title, String message) {
    var alert = new AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(message),
          Container(
            alignment: Alignment.bottomRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Turn on speed boost'.toUpperCase(),
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'No thanks'.toUpperCase(),
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }

  _getBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            _showInfoDialog(context, 'You completed this lesson.');
          },
          child: Text('Info AlertDialog'),
        ),
        RaisedButton(
          onPressed: () {
            _showActionDialog(
                context,
                'Use location services?',
                'Let us help apps determine location.'
                ' This means sending anonymous location data to us, even when'
                'no apps are running.');
          },
          child: Text('Action AlertDialog'),
        ),
        RaisedButton(
          onPressed: () {
            _showActionStackFullWidthButtonsDialog(
                context,
                'Use location services?',
                'Let us help apps determine location.'
                ' This means sending anonymous location data to us, even when'
                'no apps are running.');
          },
          child: Text('Stacked full-width buttons AlertDialog'),
        )
      ]
          .map((item) => Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: item,
              ))
          .toList(),
    );
  }
}

//https://stackoverflow.com/questions/46690765/
// flutter-radio-animation-is-not-showing-up-on-showdialog

class AlertDialogSingleChoiceDemo extends StatefulWidget {
  @override
  _AlertDialogSingleChoiceDemoState createState() =>
      _AlertDialogSingleChoiceDemoState();
}

class _AlertDialogSingleChoiceDemoState
    extends State<AlertDialogSingleChoiceDemo> {
  final ringTones = [
    'None',
    'Callisto',
    'Ganymede',
    'Luna',
    'Oberon',
    'Phobos',
    'Dione',
    'Dione2',
    'Dione3',
    'Dione4',
  ];

  var _ringTone;

  @override
  void initState() {
    super.initState();
    _ringTone = ringTones[3];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AlertDialog Single Choice')),
      body: _getBody(),
    );
  }

  _getBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              _showSingleChoiceAlertDialog();
            },
            child: Text('Single choice Alert Dialog'),
          ),
          SizedBox(
            height: 16.0,
          ),
          Text('Chosen ringtone: $_ringTone')
        ],
      ),
    );
  }

  _showSingleChoiceAlertDialog() {
    showDialog(
      context: context,
      builder: (context) => SingleChoiceDialog(
          ringTones, //choice list
          _ringTone, //initial value
          (value) => setState(() {
                _ringTone = value;
              })),
    );
  }
}

typedef void DialogCallback(String color);

class SingleChoiceDialog extends StatefulWidget {
  final List<String> ringTones;
  final DialogCallback onSubmit;
  final String initialValue;

  SingleChoiceDialog(this.ringTones, this.initialValue, this.onSubmit);

  @override
  _SingleChoiceDialogState createState() => _SingleChoiceDialogState();
}

class _SingleChoiceDialogState extends State<SingleChoiceDialog> {
  var _choice;

  @override
  void initState() {
    super.initState();
    _choice = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      contentPadding: EdgeInsets.all(0.0),
      title: Text('Phone ringtone'),
      content: _getRingtoneList(),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.pop(context);
            widget.onSubmit(_choice);
          },
        )
      ],
    );
  }

  _getRingtoneList() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 24.0,
        ),
        Divider(
          height: 0.0,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: ListBody(
                children: widget.ringTones
                    .map(
                      (ringTone) => RadioListTile(
                            title: Text(ringTone),
                            value: ringTone,
                            groupValue: _choice,
                            onChanged: (value) {
                              setState(() {
                                _choice = value;
                              });
                            },
                          ),
                    )
                    .toList()),
          ),
        ),
        Divider(
          height: 0.0,
        ),
      ],
    );
  }
}

class DateAndTimePickerDemo extends StatefulWidget {
  @override
  _DateAndTimePickerDemoState createState() => _DateAndTimePickerDemoState();
}

class _DateAndTimePickerDemoState extends State<DateAndTimePickerDemo> {
  DateTime _selectedDate;
  TimeOfDay _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date And Time Picker Dialog'),
      ),
      body: _getBody(context),
    );
  }

  _openDatePickerDialog(BuildContext context) async {
    var dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (dateTime != null) {
      setState(() {
        _selectedDate = dateTime;
      });
    }
  }

  _openTimePickerDialog(BuildContext context) async {
    var timeOfDay =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (timeOfDay != null) {
      setState(() {
        _selectedTime = timeOfDay;
      });
    }
  }

  _getBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  _openDatePickerDialog(context);
                },
                child: Text('Select Date'),
              ),
              Expanded(
                child: Text(
                  'Selected date: ${_selectedDate != null ? DateFormat.yMMMd()
                    .format(_selectedDate) : ''}',
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  _openTimePickerDialog(context);
                },
                child: Text('Select Time'),
              ),
              Expanded(
                child: Text(
                  'Selected time: ${_selectedTime != null ? _selectedTime.format(
                    context) : ''}',
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

//https://marcinszalek.pl/flutter/
// flutter-fullscreendialog-tutorial-weighttracker-ii/

class FullScreenDialogDemo extends StatefulWidget {
  @override
  FullScreenDialogDemoState createState() {
    return new FullScreenDialogDemoState();
  }
}

class FullScreenDialogDemoState extends State<FullScreenDialogDemo> {
  var _todo = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Screen Dialog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Full Screen Dialog(Todo Entry)'),
              onPressed: () {
                _openAddTodoDialog(context);
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            Text('Todo: $_todo')
          ],
        ),
      ),
    );
  }

  _openAddTodoDialog(BuildContext context) async {
    var todo = await Navigator.push(
      context,
      MaterialPageRoute<String>(
        builder: (context) => AddTodoDialog(),
        fullscreenDialog: true,
      ),
    );
    if (todo != null) {
      setState(() {
        _todo = todo;
      });
    }
  }
}

class AddTodoDialog extends StatefulWidget {
  @override
  AddTodoDialogState createState() {
    return new AddTodoDialogState();
  }
}

class AddTodoDialogState extends State<AddTodoDialog> {
  TextEditingController _todoController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _todoController = new TextEditingController();
  }

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Todo'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Save',
              style: Theme
                  .of(context)
                  .textTheme
                  .subhead
                  .copyWith(color: Colors.white),
            ),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Navigator.pop(context, _todoController.text);
              }
            },
          ),
        ],
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _todoController,
              decoration: InputDecoration(hintText: 'Enter your todo'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SimpleDialogDemo extends StatefulWidget {
  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  var _bgColor;

  final bgColors = [Colors.red, Colors.green, Colors.lightBlue];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Dialog'),
      ),
      body: _getBody(context),
      backgroundColor: _bgColor != null ? _bgColor : Colors.white,
    );
  }

  _getBody(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          _openSimpleDialog(context);
        },
        child: Text('Open Simple Dialog'),
      ),
    );
  }

  _openSimpleDialog(BuildContext context) async {
    var simpleDialog = SimpleDialog(
        title: Text('Choose background color:'),
        children: bgColors
            .map((color) => SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, color);
                  },
                  child: Container(
                    height: 60.0,
                    color: color,
                  ),
                ))
            .toList());
    var bgColor = await showDialog<Color>(
      context: context,
      builder: (context) => simpleDialog,
    );

    setState(() {
      _bgColor = bgColor;
    });
  }
}