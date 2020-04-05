import 'package:flutter/material.dart';
import 'package:open_movie_app_mvvm/models/movie.dart';
import 'package:open_movie_app_mvvm/vew_models/movie_list_view_model.dart';
import 'package:open_movie_app_mvvm/views/widgets/movie_list_cell.dart';
import 'package:scoped_model/scoped_model.dart';

class MoviesPanel extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MovieListViewModel>(
      builder: (context , child,  model) {
        return FutureBuilder<List<Movie>>(
          future: model.movie,
          builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
               switch (snapshot.connectionState) {

                 case ConnectionState.none:
                 
                 case ConnectionState.waiting:
                   return Center(child: const CircularProgressIndicator());
                  
                 case ConnectionState.active:
                   
                 case ConnectionState.done:
                   if(snapshot.hasData){
                      var movies = snapshot.data;
                      return ListView.builder(
                        itemCount: movies == null ? 0 : movies.length,
                        itemBuilder: (_, int index) {
                            var movie = movies[index];
                            return MovieListPageCell(model: movie);
                        },
                      );
                    }else if (snapshot.hasError){
                      return Container(
                        width: 0.0,
                        height: 0.0
                      );
                    }
               }
            //builder: (_, AsyncSnapshot<List<Planet>> snapshot) {
            
          },
        );
      },
      
    );
  }

}