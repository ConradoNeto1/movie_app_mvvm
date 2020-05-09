import 'package:open_movie_app_mvvm/models/movie.dart';

abstract class IMovieService {
  Future<List<Movie>> fetchListMovieWithTitle(String title);
  Future<Movie> fetchMovieWithTitle(String title);
}