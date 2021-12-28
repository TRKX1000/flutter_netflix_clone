part of 'movies_bloc.dart';

@immutable
abstract class MoviesState {
  final List<String> movieList;

  const MoviesState(this.movieList);
}

class InitialMovieState extends MoviesState {
  InitialMovieState() : super(<String>[]);
}

class LoadingMovieState extends MoviesState {
  LoadingMovieState() : super(<String>[]);
}

class MoviesOkState extends MoviesState {
  const MoviesOkState(List<String> movieList) : super(movieList);
}
