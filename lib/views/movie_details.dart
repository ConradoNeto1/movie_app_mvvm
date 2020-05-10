import 'package:flutter/material.dart';
import 'package:open_movie_app_mvvm/models/movie.dart';
import 'package:open_movie_app_mvvm/services/movie_service.dart';
import 'package:open_movie_app_mvvm/vew_models/movie_view_model.dart';
import 'package:open_movie_app_mvvm/views/panels/movie_details_panel.dart';
import 'package:scoped_model/scoped_model.dart';

class MovieDetails extends StatefulWidget {
  final Movie model;
  MovieDetails([this.model]);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  MovieViewModel viewModel;

  Future loadData() async {
    await viewModel.setMovie(widget.model.title);
  }

  @override
  void initState() {
    super.initState();
    viewModel = MovieViewModel(api: MovieServiceImpl());
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
        backgroundColor: Colors.black,
      ),
      body: ScopedModel<MovieViewModel>(
        model: viewModel,
        child: Container(
          child: MovieDetailsPanel(),
        ),
      ),
    );
  }
}
