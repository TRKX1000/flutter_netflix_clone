import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_clone/bloc/movies/movies_bloc.dart';
import 'package:flutter_netflix_clone/data/user.dart';
import 'package:flutter_netflix_clone/pages/userHome/popularAndGenreList/popular_and_genre_list.dart';
import 'package:flutter_netflix_clone/utils/colors.dart';

class UserHomePage extends StatefulWidget {
  static const String keyRoute = "UserHomePage";
  final User user;

  const UserHomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int _selectedTabIndex = 0;
  List<Widget> bottomNavigationPages = [
    const PopularAndGenreList(),
    const Center(
      child: Text(
        "My List",
        style: TextStyle(color: Colors.black),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => MoviesBloc()),
        ],
        child: Scaffold(
          backgroundColor: Colors.black,
          body: bottomNavigationPages[_selectedTabIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedTabIndex,
            backgroundColor: CustomColors.black,
            selectedFontSize: 0,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: CustomColors.gray700),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.movie), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.list_sharp), label: ""),
            ],
            onTap: (item){
              setState(() {
                _selectedTabIndex = item;
              });
            },
          ),
        ),
      ),
    );
  }
}
