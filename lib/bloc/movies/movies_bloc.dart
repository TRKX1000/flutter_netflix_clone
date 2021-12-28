import 'package:bloc/bloc.dart';
import 'package:flutter_netflix_clone/data/movie.dart';
import 'package:flutter_netflix_clone/di/locator.dart';
import 'package:flutter_netflix_clone/domain/repository/movies_repository.dart';
import 'package:flutter_netflix_clone/domain/service/movies_service.dart';
import 'package:meta/meta.dart';

part 'movies_event.dart';

part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(InitialMovieState()) {
    on<LoadingMovieEvent>((event, emit) async {
      emit(LoadingMovieState());
    });
    on<MovieListEvent>((event, emit) async {
      emit(MoviesOkState(event.movieList));
    });
    on<TryToLoadMoviesEvent>((event, emit) async {
      emit(LoadingMovieState());
      
      var moviesRepository = MoviesRepository(locator.get<MoviesService>());
      var movies = await moviesRepository.getMovies();
      emit(MoviesOkState(movies));
    });
  }

  Future<void> loadMovies() async {
    // trigger load movies
    add(TryToLoadMoviesEvent());
  }
}
