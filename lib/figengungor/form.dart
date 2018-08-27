import 'package:flutter/material.dart';
import 'package:pilot/mockups.dart';

void main() => runApp(MaterialApp(home: FormExample()));

class FormExample extends StatelessWidget {
  FormExample({
    Key key,
    this.title = "Figen Gungor Playground"
  }): super(key: key);
  final String title;

  final List<Example> _exampleList = [
    Example(
      title: "Login Form",
      child: LoginForm1(),
    ),
    Example(
      title: "Register Form",
      child: RegisterForm1(),
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
        title: Text('Login Form'),
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
        title: Text('Register Form'),
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