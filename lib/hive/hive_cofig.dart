
import 'package:flutter_netflix_clone/data/movie.dart';
import 'package:hive_flutter/hive_flutter.dart';

const int hiveTypeMovie = 1;

void registerHiveAdapters(){
  Hive.registerAdapter(MovieAdapter());
}