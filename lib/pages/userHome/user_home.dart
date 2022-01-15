import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_clone/bloc/movies/movies_bloc.dart';
import 'package:flutter_netflix_clone/data/user.dart';
import 'package:flutter_netflix_clone/pages/userHome/popularAndGenreList/popular_and_genre_list.dart';

class UserHomePage extends StatefulWidget {
  static const String keyRoute = "UserHomePage";
  final User user;

  const UserHomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  final _pages = [];
  int _selectedTab = 0;

  @override
  void initState() {
    _pages.add(PopularAndGenreList(
      user: widget.user,
    ));
    _pages.add(const Center(
      child: Text("My List", style: TextStyle(color: Colors.white),),
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MoviesBloc()),
      ],
      child: Scaffold(
        backgroundColor: Colors.black,
        body: _pages[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 12,
          selectedIconTheme: const IconThemeData(color:Colors.white, size: 20),
          selectedItemColor: Colors.white,
          unselectedIconTheme: const IconThemeData(color: Colors.grey, size: 20),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.black,
          onTap: _onBottomNavigationItemTap,
          currentIndex: _selectedTab,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books_sharp),
              label: "My List",
            ),
          ],
        ),
      ),
    ));
  }

  _onBottomNavigationItemTap(int index) {
    setState(() {
      _selectedTab = index;
    });
  }
}
