import 'package:flutter/widgets.dart';
import 'package:dart/movie/movies_bloc.dart';
import 'package:dart/movie/themoviedb_api.dart';

class MoviesProvider extends InheritedWidget {

  MoviesProvider({Key key, MoviesBloc moviesBloc, Widget child})
      : this.moviesBloc = moviesBloc ?? MoviesBloc(TheMoviewDBApi()),
        super(child: child, key: key);

  final MoviesBloc moviesBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MoviesBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(MoviesProvider) as MoviesProvider)
          .moviesBloc;

}
