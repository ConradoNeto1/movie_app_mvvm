import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:open_movie_app_mvvm/vew_models/movie_view_model.dart';
import 'package:open_movie_app_mvvm/services/movie_service.dart';
import 'package:open_movie_app_mvvm/models/movie.dart';
import 'package:open_movie_app_mvvm/interfaces/IMovieService.dart';

class MovieListViewModel extends Model {

  Future<List<Movie>> _movies;
  Future<List<Movie>> get movie => _movies;
  set movies(Future<List<Movie>> value) {
    _movies = value;
    notifyListeners();
  }

  final IMovieService api;

  MovieListViewModel({@required this.api});

  Future<bool> setMovie(String title) async {
    movies = api?.fetchMovieWithTitle(title);
    return movie != null;
  }
}