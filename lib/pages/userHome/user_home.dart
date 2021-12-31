import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_clone/bloc/movies/movies_bloc.dart';
import 'package:flutter_netflix_clone/data/movie_section.dart';
import 'package:flutter_netflix_clone/data/user.dart';
import 'package:flutter_netflix_clone/pages/userHome/widget/horizontal_carousel.dart';
import 'package:flutter_netflix_clone/utils/image_assets.dart';

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
            background: _headerWithLogoAndSearch(),
          ),
          // expandedHeight: 100,
        ),
        SliverPersistentHeader(
          pinned: true,
          floating: true,
          //TODO ADD WIDGET WITH CATEGORIES
          delegate: _SliverAppBarDelegate(Text("This is a test mesage")),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return HorizontalCarouselWidget(
                section: movieSectionlist[index],
              );
            },
            childCount: movieSectionlist.length,
          ),
        ),
      ],
    );
  }

  Widget _headerWithLogoAndSearch() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              const Image(
                height: 40,
                image: AssetImage(ImageAssets.imageNNetflix),
              ),
              Expanded(child: Container()),
              const Image(
                color: Colors.white,
                height: 25,
                image: AssetImage(
                  ImageAssets.imageSearch,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 25,
                width: 25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    user.avatarImage,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _showLoading() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final Widget _tabBar;

  @override
  double get minExtent => 50;
  @override
  double get maxExtent => 50;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white, // ADD THE COLOR YOU WANT AS BACKGROUND.
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
