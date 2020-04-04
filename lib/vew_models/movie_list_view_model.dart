import 'package:flutter/material.dart';
import 'package:open_movie_app_mvvm/vew_models/movie_view_model.dart';
import 'package:open_movie_app_mvvm/services/movie_service.dart';

class MovieListViewModel extends ChangeNotifier {
    
    List<MovieViewModel> movies = List<MovieViewModel>();

    Future<void> fetchMovies(String keyword) async {
      final results = await MovieServiceImpl().fetchListMovieWithTitle(title: keyword);
      // this.movies = results.map((item) => )
    }

}