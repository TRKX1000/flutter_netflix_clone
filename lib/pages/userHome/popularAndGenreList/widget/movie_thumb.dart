import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/data/movie.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieThumb extends StatelessWidget {
  final Movie movie;
  final void Function(Movie) onMoviePressed;
  final double height;

  static String urlBaseImage = "https://image.tmdb.org/t/p/w500/";

  const MovieThumb({
    Key? key,
    required this.movie,
    required this.onMoviePressed,
    this.height = 175,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: GestureDetector(
        onTap: () => onMoviePressed(movie),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
          ),
          width: 100,
          height: height,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: FadeInImage.memoryNetwork(
              fit: BoxFit.cover,
              placeholder: kTransparentImage,
              image: urlBaseImage + movie.posterPath,
            ),
          ),
        ),
      ),
    );
  }
}
