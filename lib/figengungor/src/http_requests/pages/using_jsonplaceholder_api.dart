import 'package:flutter/material.dart';

import '../pages/albums_page.dart';
import '../pages/comments_page.dart';
import '../pages/photos_page.dart';
import '../pages/posts_page.dart';
import '../pages/todos_page.dart';
import '../pages/users_page.dart';


class UsingJsonPlaceholderApi extends StatefulWidget {
  @override
  UsingJsonPlaceholderApiState createState() {
    return new UsingJsonPlaceholderApiState();
  }
}

class UsingJsonPlaceholderApiState extends State<UsingJsonPlaceholderApi> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Using JsonPlaceholder Api'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Posts'),
              Tab(text: 'Comments'),
              Tab(text: 'Users'),
              Tab(text: 'Todos'),
              Tab(text: 'Photos'),
              Tab(text: 'Album'),
            ],
          ),
        ),
        body: _getBody(),
      ),
    );
  }

  _getBody() {
    return TabBarView(
      children: [
        PostsPage(),
        CommentsPage(),
        UsersPage(),
        TodosPage(),
        PhotosPage(),
        AlbumsPage(),
      ],
    );
  }
}