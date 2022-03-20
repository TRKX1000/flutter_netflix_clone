part of 'local_movies_bloc.dart';

@immutable
abstract class LocalMoviesState {}

class LocalMovieInitialState extends LocalMoviesState {}

class IsInMyListState extends LocalMoviesState {
  final bool isInMyList;

  IsInMyListState({required this.isInMyList});
}
