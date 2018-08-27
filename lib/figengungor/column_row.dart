import 'package:flutter/material.dart';
import 'package:pilot/mockups.dart';

void main() => runApp(MaterialApp(home: ColumnRowExample()));

class ColumnRowExample extends StatelessWidget {
  ColumnRowExample({
    Key key,
    this.title = "Column & Row Demo"
  }): super(key: key);
  final String title;

final List<Example> _exampleList = [
    Example(
      title: "Row Examples",
      child: RowExample(),
    ),
    Example(
      title: "Column Examples",
      child: ColumnExample(),
    ),
    Example(
      title: "Row CrossAxisAlignment Examples",
      child: RowCrossAxisAlignment(),
    ),
    Example(
      title: "Column CrossAxisAlignment Examples",
      child: ColumnCrossAxisAlignment(),
    ),
    Example(
      title: "Row MainAxisSize",
      child: RowMainAxisSize(),
    ),
    Example(
      title: "Column MainAxisSize",
      child: ColumnMainAxisSize(),
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

class ColumnCrossAxisAlignment extends StatelessWidget {
  final _containerWidth = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column CrossAxisAlignment'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        _getRotatedText('CrossAxisAlignment.start'),
        _getColumnAxisAlignmentStart(),
        _getRotatedText('CrossAxisAlignment.center'),
        _getColumnAxisAlignmentCenter(),
        _getRotatedText('CrossAxisAlignment.end'),
        _getColumnAxisAlignmentEnd(),
        _getRotatedText('If not specified CrossAxisAlignment.center '
            'by default inside Container'),
        _getColumnAxisAlignmentDefault(),
        _getRotatedText('CrossAxisAlignment.stretch'),
        _getColumnAxisAlignmentStretch(),
        _getRotatedText('Without CrossAxisAlignment.stretch'),
        _getColumnAxisAlignmentWithoutStretch(),
      ],
    );
  }

  _getColumnAxisAlignmentStart() {
    return Container(
      color: Colors.orange,
      width: _containerWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.favorite),
          Icon(Icons.favorite),
          Icon(Icons.favorite),
        ],
      ),
    );
  }

  _getColumnAxisAlignmentCenter() {
    return Container(
      color: Colors.pink,
      width: _containerWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.favorite),
          Icon(Icons.favorite),
          Icon(Icons.favorite),
        ],
      ),
    );
  }

  _getColumnAxisAlignmentEnd() {
    return Container(
      color: Colors.green,
      width: _containerWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Icon(Icons.favorite),
          Icon(Icons.favorite),
          Icon(Icons.favorite),
        ],
      ),
    );
  }

  _getColumnAxisAlignmentDefault() {
    return Container(
      color: Colors.green,
      width: _containerWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(Icons.favorite),
          Icon(Icons.favorite),
          Icon(Icons.favorite),
        ],
      ),
    );
  }

  _getColumnAxisAlignmentStretch() {
    return Container(
      width: _containerWidth,
      color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 50.0,
            color: Colors.teal,
            child: Icon(Icons.favorite),
          ),
          Container(
            height: 50.0,
            color: Colors.lightBlue,
            child: Icon(Icons.favorite),
          ),
          Container(
            height: 50.0,
            color: Colors.purple,
            child: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }

  _getColumnAxisAlignmentWithoutStretch() {
    return Container(
      width: _containerWidth,
      color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 50.0,
            color: Colors.teal,
            child: Icon(Icons.favorite),
          ),
          Container(
            height: 50.0,
            color: Colors.lightBlue,
            child: Icon(Icons.favorite),
          ),
          Container(
            height: 50.0,
            color: Colors.purple,
            child: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }

  _getRotatedText(String title) {
    return RotatedBox(
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
      quarterTurns: 3,
    );
  }
}

class ColumnExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Column examples')),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _getColumn1(),
          _getColumn2Expanded(),
          _getColumn3Expanded(),
          _getColumn4MainAxisAlignmentStart(),
          _getColumn5MainAxisAlignmentEnd(),
          _getColumn6MainAxisAlignmentCenter(),
          _getColumn7MainAxisAlignmentSpaceBetween(),
          _getColumn8MainAxisAlignmentSpaceEvenly(),
          _getColumn9MainAxisAlignmentSpaceAround(),
        ]
            .map(
              (item) => Row(
                    children: <Widget>[
                      item,
                      Container(
                        color: Colors.black,
                        height: MediaQuery.of(context).size.height,
                        width: 1.0,
                      )
                    ],
                  ),
            )
            .toList(),
      ),
    );
  }

  _getColumn1() {
    return Column(
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
      ],
    );
  }

  _getColumn2Expanded() {
    return Column(
      children: <Widget>[
        Expanded(child: Text('Text', style: TextStyle(fontSize: 20.0))),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  _getColumn3Expanded() {
    return Column(
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Expanded(
            child:
                Center(child: Text('Text', style: TextStyle(fontSize: 20.0)))),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  _getColumn4MainAxisAlignmentStart() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  _getColumn5MainAxisAlignmentEnd() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  _getColumn6MainAxisAlignmentCenter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  //Place the free space evenly between the children.
  _getColumn7MainAxisAlignmentSpaceBetween() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  //Place the free space evenly between the children as well as
  //before and after the first and last child.
  _getColumn8MainAxisAlignmentSpaceEvenly() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  //Place the free space evenly between the children as well as half of that
  //space before and after the first and last child.
  _getColumn9MainAxisAlignmentSpaceAround() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }
}

class ColumnMainAxisSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column MainAxisSize'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _getRotatedText('MainAxisSize.max (default)'),
        Container(
          color: Colors.pink,
          child: Column(
            //mainAxisSize: MainAxisSize.max, //default
            children: <Widget>[
              Icon(Icons.person),
              Icon(Icons.person),
              Icon(Icons.person),
            ],
          ),
        ),
        _getRotatedText('MainAxisSize.min '),
        Container(
          color: Colors.pink,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.person),
              Icon(Icons.person),
              Icon(Icons.person),
            ],
          ),
        ),
      ],
    );
  }

  _getRotatedText(String title) {
    return RotatedBox(
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
      quarterTurns: 3,
    );
  }
}

class RowCrossAxisAlignment extends StatelessWidget {
  final _containerHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row CrossAxisAlignment'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return ListView(
      children: <Widget>[
        Text('CrossAxisAlignment.start'),
        _getCrossAxisAlignmentStart(),
        Text('CrossAxisAlignment.center'),
        _getCrossAxisAlignmentCenter(),
        Text('CrossAxisAlignment.end'),
        _getCrossAxisAlignmentEnd(),
        Text('If not specified CrossAxisAlignment.center '
            'by default inside Container'),
        //Row's crossAxisAlignment inside Container is center by default
        _getCrossAxisAlignmentDefault(),
        Text('CrossAxisAlignment.stretch'),
        _getCrossAxisAlignmentStretch(),
        Text('Without CrossAxisAlignment.stretch'),
        _getCrossAxisAlignmentWithoutStretch(),
        Text('CrossAxisAlignment.baseline, '
            '\ntextBaseline : TextBaseline.alphabetical'),
        _getCrossAxisAlignmentBaseline(),
        Text('Without CrossAxisAlignment.baseline'),
        _getCrossAxisAlignmentWithoutBaseline(),
      ],
    );
  }

  _getCrossAxisAlignmentStart() {
    return Container(
      color: Colors.orange,
      height: _containerHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.favorite),
          Icon(Icons.favorite),
          Icon(Icons.favorite),
        ],
      ),
    );
  }

  _getCrossAxisAlignmentCenter() {
    return Container(
      color: Colors.pink,
      height: _containerHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.favorite),
          Icon(Icons.favorite),
          Icon(Icons.favorite),
        ],
      ),
    );
  }

  _getCrossAxisAlignmentEnd() {
    return Container(
      color: Colors.green,
      height: _containerHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Icon(Icons.favorite),
          Icon(Icons.favorite),
          Icon(Icons.favorite),
        ],
      ),
    );
  }

  _getCrossAxisAlignmentDefault() {
    return Container(
      color: Colors.blue,
      height: _containerHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(Icons.favorite),
          Icon(Icons.favorite),
          Icon(Icons.favorite),
        ],
      ),
    );
  }

  _getCrossAxisAlignmentStretch() {
    return Container(
      height: _containerHeight,
      color: Colors.yellow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: 50.0,
            color: Colors.teal,
            child: Icon(Icons.favorite),
          ),
          Container(
            width: 50.0,
            color: Colors.lightBlue,
            child: Icon(Icons.favorite),
          ),
          Container(
            width: 50.0,
            color: Colors.purple,
            child: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }

  _getCrossAxisAlignmentWithoutStretch() {
    return Container(
      height: _containerHeight,
      color: Colors.yellow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 50.0,
            color: Colors.teal,
            child: Icon(Icons.favorite),
          ),
          Container(
            width: 50.0,
            color: Colors.lightBlue,
            child: Icon(Icons.favorite),
          ),
          Container(
            width: 50.0,
            color: Colors.purple,
            child: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }

  _getCrossAxisAlignmentBaseline() {
    return Container(
      height: _containerHeight,
      color: Colors.black,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text('Flutter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                )),
            Text('Rules!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                )),
          ],
        ),
      ),
    );
  }

  _getCrossAxisAlignmentWithoutBaseline() {
    return Container(
      height: _containerHeight,
      color: Colors.black,
      child: Center(
        child: Row(
          children: <Widget>[
            Text('Flutter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                )),
            Text('Rules!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                )),
          ],
        ),
      ),
    );
  }
}

class RowExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Row examples')),
      body: ListView(
        children: <Widget>[
          _getRow1(),
          _getRow2Expanded(),
          _getRow3Expanded(),
          _getRow4MainAxisAlignmentStart(),
          _getRow5MainAxisAlignmentEnd(),
          _getRow6MainAxisAlignmentCenter(),
          _getRow7MainAxisAlignmentSpaceBetween(),
          _getRow8MainAxisAlignmentSpaceEvenly(),
          _getRow9MainAxisAlignmentSpaceAround(),
        ]
            .map(
              (item) => Column(
                    children: <Widget>[
                      item,
                      Divider(),
                    ],
                  ),
            )
            .toList(),
      ),
    );
  }

  _getRow1() {
    return Row(
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
      ],
    );
  }

  _getRow2Expanded() {
    return Row(
      children: <Widget>[
        Expanded(child: Text('Text', style: TextStyle(fontSize: 20.0))),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  _getRow3Expanded() {
    return Row(
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Expanded(
            child:
                Center(child: Text('Text', style: TextStyle(fontSize: 20.0)))),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  _getRow4MainAxisAlignmentStart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  _getRow5MainAxisAlignmentEnd() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  _getRow6MainAxisAlignmentCenter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  //Place the free space evenly between the children.
  _getRow7MainAxisAlignmentSpaceBetween() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  //Place the free space evenly between the children as well as
  //before and after the first and last child.
  _getRow8MainAxisAlignmentSpaceEvenly() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  //Place the free space evenly between the children as well as half of that
  //space before and after the first and last child.
  _getRow9MainAxisAlignmentSpaceAround() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }
}

class RowMainAxisSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row MainAxisSize'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('MainAxisSize.max (default)'),
          Container(
            color: Colors.pink,
            child: Row(
              //mainAxisSize: MainAxisSize.max, //default
              children: <Widget>[
                Icon(Icons.person),
                Icon(Icons.person),
                Icon(Icons.person),
              ],
            ),
          ),
          Text('MainAxisSize.min '),
          Container(
            color: Colors.pink,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.person),
                Icon(Icons.person),
                Icon(Icons.person),
              ],
            ),
          ),
        ],
      ),
    );
  }
}