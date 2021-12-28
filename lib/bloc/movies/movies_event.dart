part of 'movies_bloc.dart';

@immutable
abstract class MoviesEvent {}

class MovieListEvent extends MoviesEvent {
  final MoviesInfo moviesInfo;

  MovieListEvent(this.moviesInfo);
}

class LoadingMovieEvent extends MoviesEvent {
  LoadingMovieEvent() : super();
}

class ErrorMovieEvent extends MoviesEvent {
  ErrorMovieEvent() : super();
}

class TryToLoadMoviesEvent extends MoviesEvent {}
