part of 'movies_bloc.dart';

@immutable
abstract class MoviesState {
  final MoviesInfo moviesInfo;

  const MoviesState(this.moviesInfo);
}

class InitialMovieState extends MoviesState {
  InitialMovieState() : super(MoviesInfo([]));
}

class LoadingMovieState extends MoviesState {
  LoadingMovieState() : super(MoviesInfo([]));
}

class MoviesOkState extends MoviesState {
  const MoviesOkState(MoviesInfo moviesInfo) : super(moviesInfo);
}
