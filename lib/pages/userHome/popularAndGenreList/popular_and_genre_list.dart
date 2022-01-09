import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_clone/bloc/movies/movies_bloc.dart';
import 'package:flutter_netflix_clone/data/movie.dart';
import 'package:flutter_netflix_clone/data/movie_section.dart';
import 'package:flutter_netflix_clone/data/user.dart';
import 'package:flutter_netflix_clone/pages/userHome/util/sliver_appbar_delegate.dart';

import 'widget/bottom_sheet_movie_detail.dart';
import 'widget/header_home.dart';
import 'widget/horizontal_carousel.dart';
import 'widget/sub_header_home.dart';

class PopularAndGenreList extends StatelessWidget {
  final User user;

  const PopularAndGenreList({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case InitialMovieState:
              {
                BlocProvider.of<MoviesBloc>(context, listen: false)
                    .loadMovies();
                return _showLoading();
              }
            case LoadingMovieState:
              {
                return _showLoading();
              }
            case MoviesOkState:
              {
                return _showUserMovies(state.moviesInfo.movieSections, context);
              }
            default:
              {
                return Center(
                  child: Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                  ),
                );
              }
          }
        },
      ),
    );
  }

  Widget _showUserMovies(
      List<MovieSection> movieSectionlist, BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Add the app bar to the CustomScrollView.
        SliverAppBar(
          // collapsedHeight: 50,
          toolbarHeight: 60,
          pinned: false,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          floating: false,
          flexibleSpace: FlexibleSpaceBar(
            background: HeaderHome(
              avatarImage: user.avatarImage,
            ),
          ),
          // expandedHeight: 100,
        ),
        SliverPersistentHeader(
          pinned: true,
          floating: true,
          delegate: SliverAppBarDelegate(const SubHeaderHome(), 40),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return HorizontalCarouselWidget(
                section: movieSectionlist[index],
                onMoviePressed: (movie) {
                  _showMovieInfo(movie, context);
                },
              );
            },
            childCount: movieSectionlist.length,
          ),
        ),
      ],
    );
  }

  Widget _showLoading() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    );
  }

  void _showMovieInfo(Movie movie, BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return BottomSheetMovieDetail(
            movie: movie,
            onShowDetails: (movie) {},
            close: () {
              Navigator.pop(context);
            },
          );
        });
  }
}
