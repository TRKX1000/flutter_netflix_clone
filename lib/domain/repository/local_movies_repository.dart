import 'package:flutter_netflix_clone/data/movie.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalMoviesRespository {
  final String _localMoviesBox = "localMoviesBox";
  final String _localMoviesClass = "localMoviesClass";

  Future<List<Movie>> getLocalMovies() async {
    List<Movie> localMovieList = [];

    var movieBox = await Hive.openBox(_localMoviesBox);

    for (var element in movieBox.values) {
      if (element is Movie) {
        localMovieList.add(element);
      }
    }

    return localMovieList;
  }

  Future<bool> isMovieInMyList(Movie movie) async {
    bool exist = false;

    var movieBox = await Hive.openBox(_localMoviesBox);

    movieBox.values.firstWhere((element) {
      //if element is Movie and it is the movie
      exist = (element is Movie && element.title == movie.title);
      return exist;
    }, orElse: () {
      exist = false;
      return exist;
    });

    return exist;
  }

  Future<bool> saveMovieInLocalStorage(Movie movieToSave) async {
    var movieBox = await Hive.openBox(_localMoviesBox);
    Movie? movieExist = movieBox.get(movieToSave.id);
    if(movieExist != null){
      return false;
    }else{
      movieBox.put(movieToSave.id, movieToSave);
      return true;
    }
  }

  Future<bool> removeMovieFromLocalStorage(Movie movieToRemove) async{
    var movieBox = await Hive.openBox(_localMoviesBox);
    Movie? movieExist = movieBox.get(movieToRemove.id);
    if(movieToRemove != null){
      movieBox.delete(movieToRemove.id);
      return true;
    }else{
      return false;
    }
  }
}
