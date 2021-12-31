import 'dart:convert';

import 'movie_response.dart';

class MoviesResponse {
  final int page;
  final List<MovieResponse> results;
  final int totalPages;
  final int totalResults;

  MoviesResponse(this.page, this.results, this.totalPages, this.totalResults);

  static MoviesResponse mapFromJson(Map<String, dynamic> json) {
    var jsonMovies = json['results'] as List;
    var movieList =
        jsonMovies.map((movieJson) => MovieResponse.mapFromJson(movieJson));

    return MoviesResponse(
      json['page'],
      movieList.toList(),
      json['total_pages'],
      json['total_results'],
    );
  }
}
