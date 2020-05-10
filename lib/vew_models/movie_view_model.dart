import 'package:flutter/material.dart';
import 'package:open_movie_app_mvvm/interfaces/IMovieService.dart';
import 'package:open_movie_app_mvvm/models/movie.dart';
import 'package:scoped_model/scoped_model.dart';

class MovieViewModel extends Model{
  
  Future<Movie> _movie;
  Future<Movie> get movie => _movie;
  set movieNow(Future<Movie> value) {
    _movie = value;
    notifyListeners();
  }

  final IMovieService api;

   MovieViewModel({@required this.api});

   Future<bool> setMovie(String title) async {
    movieNow = api?.fetchMovieWithTitle(title);
    return movie != null;
  }
}