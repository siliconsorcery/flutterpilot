import 'package:dart/movie/movie.dart';
import 'package:flutter/material.dart';
import 'movies_provider.dart';

class MoviesView extends StatefulWidget {
  @override
  _MoviesViewState createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  @override
  Widget build(BuildContext context) {
    final moviesBloc = MoviesProvider.of(context);
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            onChanged: moviesBloc.query.add,
            decoration: InputDecoration(
              hintText: 'Search for a Movie',
            ),
          ),
        ),
        Flexible(
          child: StreamBuilder(
            stream: moviesBloc.results,
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );

              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return MovieBigTile(data: snapshot.data[index]);
                },
              );
            }
          ),
        ),
      ],
    );
  }
}

class MovieBigTile extends StatelessWidget {
  MovieBigTile({this.data});
  final Movie data;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    var _posterUrl = data.posterPath;
    Widget _avatar = (_posterUrl == null)
        ? Text("")
        : Row(
          children: <Widget>[
            SizedBox(width: 16.0),
            SizedBox(
              width: 160.0,
              child: Image.network("https://image.tmdb.org/t/p/w500" +
                _posterUrl ??
                ""),
            ),
          ],
        );
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  data.title,
                  style: themeData.textTheme.headline,
                ),
                Text(
                  data.overview,
                  style: themeData.textTheme.body1,
                ),
              ],
            ),
          ),
          _avatar,
        ],
      ),
    );
  }
}