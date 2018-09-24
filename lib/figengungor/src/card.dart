import 'package:flutter/material.dart';
import 'package:pilot/utils/mockups.dart';

void main() => runApp(MaterialApp(home: CardExample()));

class CardExample extends StatelessWidget {
  CardExample({
    Key key,
    this.title = "Card Playground"
  }): super(key: key);
  final String title;

 final List<Example> _exampleList = [
    Example(
      title: "Simple",
      child: SimpleCardDemo(),
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
        child: Examples(list: _exampleList,)
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   final _navItems = [
//     NavItem('Simple Card Demo', '/simple_card_demo'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Card Playground'),
//       ),
//       body: _getNavButtons(context),
//     );
//   }

//   _getNavButtons(BuildContext context) {
//     return ListView(
//       children: _navItems
//           .map(
//             (item) => Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: RaisedButton(
//                     padding: EdgeInsets.all(8.0),
//                     color: Colors.green,
//                     onPressed: () {
//                       Navigator.pushNamed(context, item.routeName);
//                     },
//                     child: Text(
//                       item.title,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: Colors.white, fontSize: 16.0),
//                     ),
//                   ),
//                 ),
//           )
//           .toList(),
//     );
//   }
// }

// class NavItem {
//   final title;
//   final routeName;

//   NavItem(this.title, this.routeName);
// }

class SimpleCardDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/avengers.jpg',
                      width: double.infinity,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                    ListTile(
                      title: Text(
                        'Beautiful Sunset',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18.0),
                      ),
                      subtitle: Text('by Unsplash'),
                    ),
                    ListTile(
                      title: Text(
                          "Lorem ipsum dolar amet. What a beatiful sunset. It ryhmes, doesn't it?"),
                    ),
                    ButtonTheme.bar(
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(onPressed: () {}, child: Text('READ')),
                          FlatButton(onPressed: () {}, child: Text('BOOKMARK'))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}