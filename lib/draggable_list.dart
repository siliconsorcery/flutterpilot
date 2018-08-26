import 'package:flutter/material.dart';
import 'package:dragable_flutter_list/dragable_flutter_list.dart';

// https://pub.dartlang.org/packages/dragable_flutter_list
void main() => runApp(MaterialApp(home: DraggableListExample()));

class DraggableListExample extends StatelessWidget {
  DraggableListExample({
    Key key,
    this.title = "Draggable List Example",
  }): super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ),
      body: DraggableListDemo(),
    );
  }
}

class DraggableListDemo extends StatefulWidget {
  DraggableListDemoState createState() => DraggableListDemoState();
}

class DraggableListDemoState extends State<DraggableListDemo> {
  List<String> items = [
    '0',
    '1',
    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.',
    '3',
    '4',
    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
  ];

  @override
  Widget build(BuildContext context) {
    return DragAndDropList(
      items.length,
      itemBuilder: (BuildContext context, index) {
        return SizedBox(
          child: 
          Card(
            color: (canDrag(index)) ? Colors.white : Colors.grey[300],
            child: ListTile(
              title: Text(items[index]),
            ),
          ),
        );
      },
      onDragFinish: (before, after) {
        String data = items[before];
        items.removeAt(before);
        items.insert(after, data);
      },
      canDrag: (index) {
        return canDrag(index); //disable drag for index 3
      },
      canBeDraggedTo: (one, two) => true,
      dragElevation: 8.0,
    );
  }

  bool canDrag(index) {
    return (index != 3);
  }

}