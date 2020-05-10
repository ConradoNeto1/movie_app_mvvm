import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_movie_app_mvvm/models/movie.dart';
import 'package:open_movie_app_mvvm/vew_models/movie_view_model.dart';
import 'package:scoped_model/scoped_model.dart';

class MovieDetailsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MovieViewModel>(
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
                    if(snapshot.hasData){
                      var movie = snapshot.data;
                      return Container(
                          child: movie != null ? 
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                      Card(
                                        elevation: 50,
                                        child: Container(
                                          margin: EdgeInsets.all(16),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "${movie.title}",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                )
                                              )
                                            ]
                                          )
                                        ),
                                      )
                                  ]
                                ),
                              ): Container()
                      );
                    }else if (snapshot.hasError){
                      return Container();
                    }else{
                      return Container();
                    }
                }
            },
        );
      },);
  }

}