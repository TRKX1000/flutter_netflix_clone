import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/data/movie.dart';
import 'package:flutter_netflix_clone/di/locator.dart';
import 'package:flutter_netflix_clone/domain/repository/local_movies_repository.dart';

part 'local_movies_event.dart';

part 'local_movies_state.dart';

class LocalMoviesBloc extends Bloc<LocalMoviesEvent, LocalMoviesState> {
  LocalMoviesBloc() : super(LocalMovieInitialState()) {
    on<LocalMovieEventInitialEvent>((event, emit) async {
      emit(LocalMovieInitialState());
    });
    on<CheckIfMovieIsInMyList>((event, emit) async {
      var localMoviesRepository = locator.get<LocalMoviesRespository>();
      bool isInMyListResult =
          await localMoviesRepository.isMovieInMyList(event.movie);
      emit(IsInMyListState(isInMyList: isInMyListResult));
    });

    on<IsInMyListEvent>((event, emit){
      emit(IsInMyListState(isInMyList: event.isInMyList));
    });

    on<SaveMovieInListEvent>((event, emit) async {
      Movie movieToSave = event.movieToSave;
      var localMoviewRepository = locator.get<LocalMoviesRespository>();
      bool resutlSaveOK =
          await localMoviewRepository.saveMovieInLocalStorage(movieToSave);

      emit(IsInMyListState(isInMyList: resutlSaveOK));
    });
    on<RemoveMovieInListEvent>((event, emit) async{
      Movie movieToRemove = event.movie;
      var localMovieRepository = locator.get<LocalMoviesRespository>();
      bool resultRemoveOK = await localMovieRepository.removeMovieFromLocalStorage(movieToRemove);
      emit(IsInMyListState(isInMyList: !resultRemoveOK));
    });
  }

  void checkIfMovieIsInList(Movie movie){
    add(CheckIfMovieIsInMyList(movie: movie));
  }

  Future<void> removeFromMyList(Movie movie) async {
    var localMovieRepository = locator.get<LocalMoviesRespository>();
    var result = await localMovieRepository.removeMovieFromLocalStorage(movie);
    add(IsInMyListEvent(isInMyList: !result));
  }

  Future<void> addMovieToMyList(Movie movie) async {
    var localMovieRepository = locator.get<LocalMoviesRespository>();
    var result = await localMovieRepository.saveMovieInLocalStorage(movie);
    add(IsInMyListEvent(isInMyList: result));
  }
}
