import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: DismissibleExample()));

class DismissibleExample extends StatelessWidget {
  DismissibleExample({
    Key key,
    this.title = "Dismissible Example"
  }): super(key: key);
  final String title;
  
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Colors.grey[300],
        child: DismissibleDemo(),
      )
    );
  }
}

class DismissibleDemo extends StatefulWidget {
  @override
  _DismissibleDemoState createState() => _DismissibleDemoState();
}

class _DismissibleDemoState extends State<DismissibleDemo> {
  final List<String> _groceryList = ['cucumber', 'tomato', 'potato', 'milk', 'banana', 'chocolate'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _groceryList.length,
              itemBuilder: (BuildContext context, int index) {
                String item = _groceryList[index];
                return Dismissible(
                  //this is displayed while item is swiped away
                  background: Container(color: Colors.red),
                  //direction restricts swipe to dismiss only in that direction
                  //direction: DismissDirection.endToStart,
                  //define what to do after item is swiped
                  //you can take different actions according to direction
                  onDismissed: (DismissDirection direction) {
                    if (DismissDirection.startToEnd == direction) {
                      print('Swiped start to end');
                    } else if (DismissDirection.endToStart == direction) {
                      print('Swiped end to start');
                    } else {
                      print(direction.toString());
                    }

                    //You can limit the swipe by setting direction property
                    //For now, the delete action is happening
                    // for all swipe directions
                    setState(() {
                      _groceryList.removeAt(index);
                    });
                  },
                  //must have a unique key
                  key: Key(item),
                  child: ListTile(
                    title: Text(item),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Container(
            color: Colors.red,
            padding: EdgeInsets.all(8.0),
            child: Text('${_groceryList.toString()}',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}