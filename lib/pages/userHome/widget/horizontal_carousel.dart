import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/data/movie_section.dart';
import 'package:flutter_netflix_clone/pages/userHome/widget/movie_thumb.dart';

class HorizontalCarouselWidget extends StatefulWidget {
  final MovieSection section;

  const HorizontalCarouselWidget({Key? key, required this.section})
      : super(key: key);

  @override
  _HorizontalCarouselWidgetState createState() =>
      _HorizontalCarouselWidgetState();
}

class _HorizontalCarouselWidgetState extends State<HorizontalCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.section.titleSection,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 150,
          color: Colors.red,
          child:
          ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widget.section.movies.length,
              itemBuilder: (context, index) {
                return MovieThumb(movie: widget.section.movies[index]);
              }),
        ),
      ],
    );
  }
}
