import 'package:flutter_netflix_clone/data/movie.dart';
import 'package:flutter_netflix_clone/data/movie_section.dart';
import 'package:flutter_netflix_clone/data/movies_info.dart';
import 'package:flutter_netflix_clone/domain/service/movies_service.dart';

class MoviesRepository {
  MoviesService moviesService;

  MoviesRepository(this.moviesService);

  Future<MoviesInfo> getMovies() async {
    List<MovieSection> sectionList = [];

    // get popular movies
    var popularMoviesResponse = await moviesService.getPopularMovies();
    var popularMoviesList = popularMoviesResponse.results.map(
        (movieResponse) => Movie.convertServiceModelToDataModel(movieResponse));
    sectionList.add(
        MovieSection("Popular Movies on Netflix", popularMoviesList.toList()));

    var movieInfo = MoviesInfo(sectionList);

    return movieInfo;
  }
}
