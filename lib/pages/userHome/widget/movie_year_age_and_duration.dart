import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/data/movie.dart';
import 'package:flutter_netflix_clone/utils/image_assets.dart';

class MovieYearAgeAndDuration extends StatelessWidget {
  final Movie movie;

  const MovieYearAgeAndDuration({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          movie.releaseDate.substring(0, 4),
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(width: 20),
        Image.asset(
          ImageAssets.imageAge18,
          width: 30,
          height: 30,
        ),
        const SizedBox(width: 20),
        const Text(
          "1h 29min",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
