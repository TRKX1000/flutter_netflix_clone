import 'package:bloc/bloc.dart';
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
      // TODO: call service
      Future.delayed(const Duration(seconds: 3), () {
        add(MovieListEvent(const [
          "Avengers: End Game",
          "Matrix Resurrections",
          "Spiderman: No Way Home"
        ]));
      });
    });
  }

  Future<void> loadMovies() async {
    // trigger load movies
    add(TryToLoadMoviesEvent());
  }
}
