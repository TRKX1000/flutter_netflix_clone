import 'package:flutter_netflix_clone/data/movie.dart';
import 'package:flutter_netflix_clone/domain/service/movies_service.dart';

class MoviesRepository {
  MoviesService moviesService;

  MoviesRepository(this.moviesService);

  Future<List<Movie>> getMovies() async {
    var moviesResponse = await moviesService.getPopularMovies();
    var moviesList = moviesResponse.results.map(
        (movieResponse) => Movie.convertServiceModelToDataModel(movieResponse));
    return moviesList.toList();
  }
}
