import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_clone/bloc/movies/movies_bloc.dart';
import 'package:flutter_netflix_clone/data/user.dart';
import 'package:flutter_netflix_clone/pages/userHome/popularAndGenreList/popular_and_genre_list.dart';

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
        body: PopularAndGenreList(user: user,),
      ),
    ));
  }
}
