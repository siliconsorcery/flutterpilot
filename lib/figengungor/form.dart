import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Form Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.pink,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login_form_1': (context) => LoginForm1(),
        '/register_form_1': (context) => RegisterForm1(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final List<NavItem> navItems = [
    NavItem('Login Form 1', '/login_form_1'),
    NavItem('Register Form 1', '/register_form_1'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Playground'),
      ),
      body: _getNavButtons(context),
    );
  }

  _getNavButtons(BuildContext context) {
    return ListView(
        children: navItems.map((navItem) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text(navItem.title),
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, navItem.routeName);
                  },
                ),
              ],
            ),
          );
        }).toList());
  }
}

class NavItem {
  final title;
  final routeName;
  NavItem(this.title, this.routeName);
}

class LoginForm1 extends StatefulWidget {
  @override
  LoginForm1State createState() {
    return new LoginForm1State();
  }
}

class LoginForm1State extends State<LoginForm1> {
  final _formKey = GlobalKey<FormState>();
  var _userName, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Form 1'),
      ),
      body: Builder(
        // to create a child context of Scaffold to use SnackBar
        builder: (context) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(hintText: 'Username'),
                          validator: (value) => value.isEmpty
                              ? 'Username cannot be empty!'
                              : null,
                          onSaved: (value) => _userName = value,
                        ),
                        TextFormField(
                          decoration: InputDecoration(hintText: 'Password'),
                          validator: (value) => value.isEmpty
                              ? 'Password cannot be empty!'
                              : null,
                          onSaved: (value) => _password = value,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        RaisedButton(
                          child: Text('Submit'),
                          color: Colors.green,
                          textColor: Colors.white,
                          onPressed: () {
                            _login(context);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
      ),
    );
  }

  _login(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final snackBar = SnackBar(
        content: Text(
          'Login Success! Username: $_userName, Password: $_password',
          style: TextStyle(color: Colors.pink),
        ),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }
}

class RegisterForm1 extends StatefulWidget {
  @override
  RegisterForm1State createState() {
    return new RegisterForm1State();
  }
}

class RegisterForm1State extends State<RegisterForm1> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  var _fullName, _emailAddress, _phone, _password, _address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Register Form 1'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(hintText: 'Full name'),
                  validator: (value) =>
                      value.isEmpty ? 'Please enter full name' : null,
                  onSaved: (value) => _fullName = value,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: 'Email'),
                  validator: (value) =>
                      value.isEmpty ? 'Please enter email' : null,
                  onSaved: (value) => _emailAddress = value,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: InputDecoration(hintText: 'Phone'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter phone';
                    }
                    if (value.length != 10) {
                      return 'Please enter 10 digits';
                    }
                  },
                  onSaved: (value) => _phone = value,
                ),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Password'),
                  validator: (value) =>
                      value.isEmpty ? 'Please enter password' : null,
                  onSaved: (value) => _password = value,
                ),
                TextFormField(
                  maxLines: 6,
                  decoration: InputDecoration(hintText: 'Address'),
                  validator: (value) =>
                      value.isEmpty ? 'Please enter address' : null,
                  onSaved: (value) => _address = value,
                ),
                RaisedButton(
                  child: Text('Submit'),
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  onPressed: () {
                    _validateForm();
                  },
                )
              ]
                  .map((item) => Padding(
                        padding: EdgeInsets.all(8.0),
                        child: item,
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  void _validateForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          'Good to go, $_fullName =)',
        ),
      ));
    }
  }
}