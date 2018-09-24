import 'package:flutter/material.dart';

import 'src/movies_provider.dart';
import 'src/movies_page.dart';

// void main() => runApp(MoviePage());
void main() => runApp(MaterialApp(home: MoviePage()));

class MoviePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MoviesProvider(
      child: MoviesPage(),
    );
  }
  
}