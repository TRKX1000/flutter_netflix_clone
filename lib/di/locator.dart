import 'package:flutter_netflix_clone/domain/service/movies_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupDependencyInjection(){
  locator.registerLazySingleton<MoviesService>(() => MoviesService());
}