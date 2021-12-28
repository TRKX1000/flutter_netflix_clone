part of 'movies_bloc.dart';

@immutable
abstract class MoviesState {
  final List<Movie> movieList;

  const MoviesState(this.movieList);
}

class InitialMovieState extends MoviesState {
  InitialMovieState() : super(<Movie>[]);
}

class LoadingMovieState extends MoviesState {
  LoadingMovieState() : super(<Movie>[]);
}

class MoviesOkState extends MoviesState {
  const MoviesOkState(List<Movie> movieList) : super(movieList);
}
