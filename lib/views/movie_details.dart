import 'package:flutter/material.dart';
import 'package:open_movie_app_mvvm/models/movie.dart';
import 'package:open_movie_app_mvvm/services/movie_service.dart';
import 'package:open_movie_app_mvvm/vew_models/movie_list_view_model.dart';
import 'package:open_movie_app_mvvm/vew_models/movie_view_model.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:transparent_image/transparent_image.dart';

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
        body: ScopedModelDescendant<MovieListViewModel>(
          builder: (context, child, model) {
            return FutureBuilder<Movie>(
              future: model.movie,
              builder: (_, AsyncSnapshot<Movie> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:

                  case ConnectionState.waiting:
                    return Center(child: const CircularProgressIndicator());

                  case ConnectionState.active:

                  case ConnectionState.done:
                    if (snapshot.hasData) {
                      var movie = snapshot.data;
                      child:
                      Stack(
                        children: <Widget>[
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    movie.title,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: movie.poster,
                                    width: 300,
                                    height: 300,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Container();
                    } else {
                      return Container();
                    }
                }
              },
            );
          },
        ));
  }
}
