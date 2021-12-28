import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/movies_response.dart';

class MoviesService {
  final String urlBase = "https://api.themoviedb.org/3";

  Future<MoviesResponse> getPopularMovies() async {
    var url = Uri.parse(urlBase + '/discover/movie?sort_by=popularity.desc&api_key=933043b7db1ce2b66b7eec8b6e18e77f');
    var response = await http.get(url);
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    var moviesResponse = MoviesResponse.mapFromJson(jsonResponse);
    return moviesResponse;
  }
}
