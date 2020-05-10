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

  // static final MovieServiceImpl _internal = MovieServiceImpl.internal();
  // factory MovieServiceImpl () => _internal;
  // MovieServiceImpl.internal();


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

   var response = await http.get(formURL("/?s=$title"));
   var body = jsonDecode(response.body); 

    // Movie movie = Movie(title: body.)
    return Movie.fromMap(body);

    // return body;
  }

 
 
  // @override
  // Future<http.Response> fetchListMovieWithTitle({String title}) async {
  //   return http.get(formURL("/?s=$title"));
  // }

  // @override
  // Future<http.Response> fetchMovieWithTitle({String title}) {
  //   return http.get(formURL("/?t=$title"));
  // }


}