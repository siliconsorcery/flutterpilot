import 'package:flutter/material.dart';
import 'package:dart/movie/movie.dart';

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