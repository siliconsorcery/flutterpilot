import 'package:flutter/material.dart';

class Example {
  Example({
    this.title, 
    this.subtitle, 
    this.color = Colors.white,
    this.child,
  });
  final String title;
  final String subtitle;
  final Color color;
  final Widget child;
}

class Examples extends StatelessWidget {
  Examples({
    Key key,
    @required this.list,
    y
  }): super(key: key);
  final List<Example> list;

  @override
  Widget build(BuildContext context) {
    var columns = 1;
    var ratio = 7.0;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        childAspectRatio: ratio,
      ),
      itemBuilder: (BuildContext context, int index) =>
        ExampleTile(example: list[index]),
      itemCount: list.length,
    );
  }
}

class ExampleTile extends StatelessWidget {
  final Example example;
  final ValueChanged<Example> onTap;

  const ExampleTile({
    Key key,
    @required this.example,
    this.onTap,
  }) : assert(example != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context, MaterialPageRoute(
              builder: (context) => example.child,
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: example.color, 
            // gradient: LinearGradient(colors: [Colors.yellow, Colors.red]),
            // image: DecorationImage(
            //   colorFilter: ColorFilter.mode(Colors.white.withAlpha(200), BlendMode.lighten),
            //   fit: BoxFit.cover,
            //   image: Image.asset('assets/avengers.jpg').image,
            // ),
            border: Border(
              left: BorderSide(
                width: 8.0,
                color: Colors.lightGreen,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    example.title,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MockupScreen extends StatelessWidget {
  MockupScreen({
    Key key,
    this.title = "Screen Mockup",
    this.color = Colors.orangeAccent,
  }) : super(key: key);
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: color,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 56.0,
              color: Colors.white, // Colors.grey[700],
            ),
          ),
        ));
  }
}

class MockupSliverFixedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      itemExtent: 42.0,
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return MockupTile(
            title: Text("$index : Item"),
          );
        }
      ),
    );
  }
}

class MockupTile extends StatelessWidget {
  MockupTile({
    Key key,
    this.title,
  }): super(key: key);
  Widget title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
    );
  }
}
