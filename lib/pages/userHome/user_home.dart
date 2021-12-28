import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_clone/bloc/movies/movies_bloc.dart';
import 'package:flutter_netflix_clone/data/user.dart';

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
                    return Center(
                      child: ListView.builder(
                        itemCount: state.movieList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              state.movieList[index],
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                    );
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

  Widget _showLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
