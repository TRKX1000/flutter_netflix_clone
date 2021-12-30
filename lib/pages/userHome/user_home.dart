import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_clone/bloc/movies/movies_bloc.dart';
import 'package:flutter_netflix_clone/data/movie_section.dart';
import 'package:flutter_netflix_clone/data/user.dart';
import 'package:flutter_netflix_clone/pages/userHome/widget/horizontal_carousel.dart';

class UserHomePage extends StatelessWidget {
  static const String keyRoute = "UserHomePage";
  final User user;

  const UserHomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MoviesBloc()),
      ],
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
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
                    return _showUserMovies(state.moviesInfo.movieSections);
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
        ),
      ),
    ));
  }

  Widget _showUserMovies(List<MovieSection> movieSectionlist) {
    return ListView.builder(
      itemCount: movieSectionlist.length,
      itemBuilder: (context, index) {
        return HorizontalCarouselWidget(
          section: movieSectionlist[index],
        );
      },
    );
  }

  Widget _showLoading() {
    return const Center(
      child: CircularProgressIndicator(color: Colors.red,),
    );
  }
}
