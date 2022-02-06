import 'package:flutter_netflix_clone/domain/service/model/movie_response.dart';
import 'package:flutter_netflix_clone/hive/hive_cofig.dart';

//3rd libraries
import 'package:hive/hive.dart';

part 'movie.g.dart';

@HiveType(typeId: hiveTypeMovie)
class Movie {
  @HiveField(0) final String? headerImage;
  @HiveField(1) final String overview;
  @HiveField(2) final double popularity;
  @HiveField(3) final String posterPath;
  @HiveField(4) final String releaseDate;
  @HiveField(5) final String title;
  @HiveField(6) final double voteAverage;
  @HiveField(7) final int voteCount;

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
