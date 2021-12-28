part of 'movies_bloc.dart';

@immutable
abstract class MoviesEvent {}

class MovieListEvent extends MoviesEvent {
  final List<Movie> movieList;

  MovieListEvent(this.movieList);
}

class LoadingMovieEvent extends MoviesEvent {
  LoadingMovieEvent() : super();
}

class ErrorMovieEvent extends MoviesEvent {
  ErrorMovieEvent() : super();
}

class TryToLoadMoviesEvent extends MoviesEvent {}
