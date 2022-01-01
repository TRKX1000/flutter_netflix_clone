import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/data/movie.dart';
import 'package:flutter_netflix_clone/pages/userHome/widget/movie_thumb.dart';
import 'package:flutter_netflix_clone/pages/userHome/widget/movie_year_age_and_duration.dart';
import 'package:flutter_netflix_clone/pages/widgets/button_icon_and_text.dart';
import 'package:flutter_netflix_clone/pages/widgets/button_icon_and_text_vertical.dart';
import 'package:flutter_netflix_clone/utils/colors.dart';

class BottomSheetMovieDetail extends StatelessWidget {
  final Movie movie;
  final Function(Movie) onShowDetails;
  final Function() close;

  const BottomSheetMovieDetail({
    Key? key,
    required this.movie,
    required this.onShowDetails,
    required this.close,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: const BoxDecoration(
        color: CustomColors.gray850,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, top: 5, right: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                // Image and movie data
                MovieThumb(
                  movie: movie,
                  onMoviePressed: (movie) {},
                  height: 140,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                movie.title,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.grey,
                              ),
                              onPressed: (){
                                close();
                              },
                            )
                          ],
                        ),
                        MovieYearAgeAndDuration(movie: movie),
                        SizedBox(
                          height: 80,
                          child: Text(movie.overview,
                              overflow: TextOverflow.fade,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Actions play, download and advance
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ButtonIconAndText(
                    icon: Icons.play_arrow_rounded,
                    text: "Play",
                    onClick: () {},
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: ButtonIconAndTextVertical(
                    icon: Icons.download_rounded,
                    text: "Download",
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: ButtonIconAndTextVertical(
                    icon: Icons.play_arrow_outlined,
                    text: "Advance",
                  ),
                ),
              ],
            ),
            // Line divider
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                height: 1,
                color: Colors.grey[700],
              ),
            ),
            GestureDetector(
              onTap: () => onShowDetails(movie),
              child: Container(
                height: 60,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Icon(Icons.info_outline_rounded, color: Colors.white),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Details and more",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                    Expanded(child: Container()),
                    const Icon(Icons.arrow_forward_ios_outlined,
                        color: Colors.white)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
