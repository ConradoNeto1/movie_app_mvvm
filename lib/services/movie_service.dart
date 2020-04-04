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

abstract class MovieService {
  Future<http.Response> fetchMovieWithTitle({String title});
  Future<http.Response> fetchListMovieWithTitle({String title});
  Future<http.Response> fetchListMovie({String title});
}

class MovieServiceImpl extends BaseService implements IMovieService {
  @override
  Future<List<Movie>> fetchMovieWithTitle(String title) {
    // TODO: implement fetchMovieWithTitle

    // http.Response response = http.get(formURL("/?s=$title"));

    return null;
  }
 
  // @override
  // Future<http.Response> fetchListMovieWithTitle({String title}) async {
  //   return http.get(formURL("/?s=$title"));
  // }

  // @override
  // Future<http.Response> fetchMovieWithTitle({String title}) {
  //   return http.get(formURL("/?t=$title"));
  // }

  // @override
  // Future<http.Response> fetchListMovie({String title}) {
  //   // TODO: implement fetchListMovie
  //   // return ;
  // }


}