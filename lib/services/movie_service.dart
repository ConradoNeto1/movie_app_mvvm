import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:open_movie_app_mvvm/interfaces/IMovieService.dart';
import 'package:open_movie_app_mvvm/models/movie.dart';

class BaseService {
  String baseURL = "http://www.omdbapi.com";
  String key = "&apikey=1b857594";

  String formURL(String endpoint) {
    return "$baseURL$endpoint$key";
  }
}

class MovieServiceImpl extends BaseService implements IMovieService {

  @override
  Future<List<Movie>> fetchListMovieWithTitle(String title) async {

    Future<List<Movie>> result;

   var response = await http.get(formURL("/?s=$title"));

   final body = jsonDecode(response.body); 
       final Iterable json = body["Search"];

        if(json != null){
          return json.map((movie) => Movie.fromMap(movie)).toList();
        }else{
          return result;
        }
  }

  @override
  Future<Movie> fetchMovieWithTitle(String title) async {

    var response = await http.get(formURL("/?t=$title"));
    var body = jsonDecode(response.body); 

    return Movie.fromMap(body);
  }

}