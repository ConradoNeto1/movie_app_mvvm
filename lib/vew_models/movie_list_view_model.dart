import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:open_movie_app_mvvm/models/movie.dart';
import 'package:open_movie_app_mvvm/interfaces/IMovieService.dart';

class MovieListViewModel extends Model {
  Future<List<Movie>> _movies;
  Future<List<Movie>> get movieList => _movies;
  set movies(Future<List<Movie>> value) {
    _movies = value;
    notifyListeners();
  }

  final IMovieService api;

  MovieListViewModel({@required this.api});

  Future<bool> setListMovies(String title) async {
    movies = api?.fetchListMovieWithTitle(title);
    return movieList != null;
  }
  
}
