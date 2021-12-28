class MovieResponse {
  final bool adult;
  final String backdropPath;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieResponse(
    this.adult,
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  );

  static MovieResponse mapFromJson(Map<String, dynamic> json) {
    return MovieResponse(
      json['adult'],
      json['backdrop_path'],
      json['id'],
      json['original_language'],
      json['original_title'],
      json['overview'],
      json['popularity'],
      json['poster_path'],
      json['release_date'],
      json['title'],
      json['video'],
      json['vote_average'],
      json['vote_count'],
    );
  }
}
