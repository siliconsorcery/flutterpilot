import 'package:flutter/material.dart';
import 'package:pilot/utils/mockups.dart';

void main() => runApp(MaterialApp(home: RadioExample()));

class RadioExample extends StatelessWidget {
  RadioExample({
    Key key,
    this.title = "Figen Güngör Playground"
  }): super(key: key);
  final String title;

  final List<Example> _exampleList = [
    Example(
      title: "Simple",
      child: RadioSimple(),
    ),
    Example(
      title: "List",
      child: RadioListTileDemo(),
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

