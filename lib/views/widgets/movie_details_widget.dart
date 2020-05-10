import 'package:flutter/material.dart';
import 'package:open_movie_app_mvvm/models/movie.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieDetailsWidget extends StatelessWidget{
  final Movie movie;

  MovieDetailsWidget({this.movie});

  @override
  Widget build(BuildContext context) {

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
                          ),
                          Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 16),
                                  child: Divider(
                                    color: Colors.black,
                                    height: 0,
                                    thickness: 0.5,
                                  ),
                                ),
                                Text(
                                    "Year: ${movie.year}",
                                    style: TextStyle(color: Colors.black)),
                                Text(
                                    "Runtime: ${movie.runtime}",
                                    style: TextStyle(color: Colors.black)),
                                Text(
                                    "Actors: ${movie.actors}",
                                    style: TextStyle(color: Colors.black)),
                                Text(
                                    "Director: ${movie.director}",
                                    style: TextStyle(color: Colors.black)),
                                Text(
                                    "Plot: ${movie.plot}",
                                    style: TextStyle(color: Colors.black))
                        ]
                      )
                    ),
                  ),
                  Center(
                    child: Column(
                      children: <Widget>[
                        FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: movie.poster,
                          width: 300,
                          height: 300,
                        )
                      ],
                    ),
                  )
              ]
            ),
          ): Container()
  );
  }

}