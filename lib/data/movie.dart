import 'package:flutter_netflix_clone/domain/service/model/movie_response.dart';

class Movie {
  final String headerImage;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final int voteCount;

  Movie(
    this.headerImage,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
    this.voteCount,
  );

  static Movie convertServiceModelToDataModel(MovieResponse movieResponse) {
    return Movie(
        movieResponse.backdropPath,
        movieResponse.overview,
        movieResponse.popularity,
        movieResponse.posterPath,
        movieResponse.releaseDate,
        movieResponse.title,
        movieResponse.voteAverage,
        movieResponse.voteCount);
  }
}
