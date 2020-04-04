import 'package:open_movie_app_mvvm/models/movie.dart';

abstract class IMovieService {
  Future<List<Movie>> fetchMovieWithTitle(String title);
}