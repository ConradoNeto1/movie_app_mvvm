import 'package:flutter/material.dart';
import 'package:open_movie_app_mvvm/models/movie.dart';
import 'package:open_movie_app_mvvm/vew_models/movie_list_view_model.dart';
import 'package:open_movie_app_mvvm/views/widgets/movie_list_cell.dart';
import 'package:scoped_model/scoped_model.dart';

class MoviesPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MovieListViewModel>(
      builder: (BuildContext context, Widget child, MovieListViewModel model) {
        future: model.movie;
        FutureBuilder<List<Movie>>(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              var movies = snapshot.data;
            return ListView.builder(
              itemCount: movies == null ? 0 : movies.length,
              itemBuilder: (BuildContext context, int index) {
                  var movie = movies[index];
                  return MovieListPageCell(model: movie);
              },
            );
            }else{
              return Container();
            }
          },
        );
      },
      
    );
  }

}