part of 'local_movies_bloc.dart';

abstract class LocalMoviesEvent {}

class LocalMovieEventInitialEvent extends LocalMoviesEvent {}

class CheckIfMovieIsInMyList extends LocalMoviesEvent {
  final Movie movie;

  CheckIfMovieIsInMyList({required this.movie});
}

class IsInMyListEvent extends LocalMoviesEvent {
  final bool isInMyList;

  IsInMyListEvent({required this.isInMyList});
}

class SaveMovieInListEvent extends LocalMoviesEvent{
  final Movie movieToSave;

  SaveMovieInListEvent({required this.movieToSave});
}

class RemoveMovieInListEvent extends LocalMoviesEvent{
  final Movie movie;

  RemoveMovieInListEvent({required this.movie});
}
