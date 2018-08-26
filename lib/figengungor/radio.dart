import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Radio Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/radio_simple': (context) => RadioSimple(),
        '/radio_list_tile_demo': (context) => RadioListTileDemo(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem('Radio Simple', '/radio_simple'),
    NavItem('RadioListTile Demo', '/radio_list_tile_demo'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Playground'),
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

class RadioListTileDemo extends StatefulWidget {
  @override
  _RadioListTileDemoState createState() => _RadioListTileDemoState();
}

class _RadioListTileDemoState extends State<RadioListTileDemo> {
  _Experience _selectedExperience;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RadioListTile Demo'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Choose your experience',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          Column(
            children: _getExperienceRadioButtons(),
          ),
          Expanded(
            child: Center(
                child: Text(
                  _selectedExperience == null ? '?' : _selectedExperience.type,
              style: TextStyle(fontSize: 50.0),
            )),
          )
        ],
      ),
    );
  }

  _getExperienceRadioButtons() {
    return _experienceList
        .map((experience) => Column(
              children: <Widget>[
                RadioListTile(
                  title: Text('${experience.type}'),
                  subtitle: Text('${experience.description}'),
                  activeColor: Colors.pink,
                  secondary: Text('Id: ${experience.id}'),
                  value: experience,
                  groupValue: _selectedExperience,
                  onChanged: (value) {
                    setState(() {
                      _selectedExperience = value;
                    });
                  },
                ),
              ],
            ))
        .toList();
  }
}

final _experienceList = [
  _Experience('0', 'Beginner', 'Just started'),
  _Experience('1', 'Intermediate', '1-3 years'),
  _Experience('2', 'Expert', '>=3 years'),
];

class _Experience {
  _Experience(this.id, this.type, this.description);

  final String id;
  final String type;
  final String description;
}

class RadioSimple extends StatefulWidget {
  @override
  _RadioSimpleState createState() => _RadioSimpleState();
}

class _RadioSimpleState extends State<RadioSimple> {
  _Gender _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Simple'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Choose Gender',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23.0,
            ),
          ),

          Padding(padding: EdgeInsets.only(top: 8.0),),

          Row(
            children: _getGenderRadioButtons(),
          ),

          Expanded(
            child: Center(
                child: Text(
              _selectedGender == null ? '?' : _selectedGender.value,
              style: TextStyle(fontSize: 70.0),
            )),
          )
        ],
      ),
    );
  }

  _getGenderRadioButtons() {
    return _genderList
        .map((gender) => Row(
              children: <Widget>[
                Radio<_Gender>(
                  value: gender,
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
                Text('${gender.value}'),
              ],
            ))
        .toList();
  }
}

final _genderList = [
  _Gender('0', 'Female'),
  _Gender('1', 'Male'),
];

class _Gender {
  _Gender(this.id, this.value);

  final String id;
  final String value;
}

