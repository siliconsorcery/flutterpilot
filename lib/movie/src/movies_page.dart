import 'package:flutter/material.dart';
import 'movies_view.dart';
import 'movies_provider.dart';

class MoviesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MoviesProvider(
      child: Scaffold(
        appBar: AppBar(
          title: Text('TMDB Search'),
          centerTitle: false,
        ),
        body: MoviesView(),
      ),
    );
  }
}