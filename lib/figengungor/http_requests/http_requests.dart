import 'package:flutter/material.dart';
import 'package:pilot/figengungor/http_requests/pages/future_builder_demo.dart';
import 'package:pilot/figengungor/http_requests/pages/simple_get_request.dart';
import 'package:pilot/figengungor/http_requests/pages/using_jsonplaceholder_api.dart';
import 'package:pilot/mockups.dart';

void main() => runApp(MaterialApp(home: HttpRequestsExample()));

class HttpRequestsExample extends StatelessWidget {
  HttpRequestsExample({
    Key key,
    this.title = "HTTP Requests",
  }): super(key: key);
  final String title;

 final List<Example> _exampleList = [
    Example(
      title: "Simple Get Request",
      child: SimpleGetRequest(),
    ),
    Example(
      title: "FutureBuilder Demo",
      child: FutureBuilderDemo(),
    ),
    Example(
      title: "Using JsonPlaceholder Api",
      child: UsingJsonPlaceholderApi(),
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
