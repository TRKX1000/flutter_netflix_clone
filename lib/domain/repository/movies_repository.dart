import 'dart:collection';

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

    // get genre movies for sections
    sectionList.add(await _getMoviesForGenre("Action", "28"));
    sectionList.add(await _getMoviesForGenre("Adventure", "12"));
    sectionList.add(await _getMoviesForGenre("Animation", "16"));
    sectionList.add(await _getMoviesForGenre("Comedy", "35"));
    sectionList.add(await _getMoviesForGenre("Crime", "80"));
    sectionList.add(await _getMoviesForGenre("Documentary", "99"));
    sectionList.add(await _getMoviesForGenre("Drama", "18"));
    sectionList.add(await _getMoviesForGenre("Family", "10751"));
    sectionList.add(await _getMoviesForGenre("Fantasy", "14"));
    sectionList.add(await _getMoviesForGenre("History", "36"));
    // sectionList.add(await _getMoviesForGenre("Horror", "27"));
    // sectionList.add(await _getMoviesForGenre("Music", "10402"));
    // sectionList.add(await _getMoviesForGenre("Mystery", "9648"));
    // sectionList.add(await _getMoviesForGenre("Romance", "10749"));
    // sectionList.add(await _getMoviesForGenre("Science Fiction", "878"));
    // sectionList.add(await _getMoviesForGenre("TV Movie", "10770"));
    // sectionList.add(await _getMoviesForGenre("Thriller", "53"));
    // sectionList.add(await _getMoviesForGenre("War", "10752"));
    // sectionList.add(await _getMoviesForGenre("Western", "37"));

    var movieInfo = MoviesInfo(sectionList);

    return movieInfo;
  }

  Future<MovieSection> _getMoviesForGenre(String section, String genreId) async{
    var genreMoviesResponse = await moviesService.getMoviesByGenre(genreId);
    var genreMoviesList = genreMoviesResponse.results.map(
            (movieResponse) => Movie.convertServiceModelToDataModel(movieResponse));
    return MovieSection(section, genreMoviesList.toList());
  }
}
