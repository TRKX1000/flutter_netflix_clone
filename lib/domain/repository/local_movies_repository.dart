
import 'package:flutter_netflix_clone/data/movie.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalMoviesRespository{

  final String _localMoviesBox = "localMoviesBox";
  final String _localMoviesClass = "localMoviesClass";

  Future<List<Movie>> getLocalMovies() async{
    List<Movie> localMovieList = [];

    var movieBox = await Hive.openBox(_localMoviesBox);

    for (var element in movieBox.values) {
      if(element is Movie){
        localMovieList.add(element);
      }
    }

    return localMovieList;
  }

  Future<void> saveMovieInLocalStorage(Movie movie) async{
    var movieBox = await Hive.openBox(_localMoviesBox);
    movieBox.put(_localMoviesClass, movie);
  }
}