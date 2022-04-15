import 'package:flutter_netflix_clone/domain/repository/local_movies_repository.dart';
import 'package:flutter_netflix_clone/domain/repository/user_logged_repository.dart';
import 'package:flutter_netflix_clone/domain/service/movies_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupDependencyInjection(){
  locator.registerLazySingleton<MoviesService>(() => MoviesService());
  locator.registerLazySingleton<LocalMoviesRespository>(() => LocalMoviesRespository());
  locator.registerLazySingleton<UserLoggedRepository>(() => UserLoggedRepository());
}