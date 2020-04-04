import 'package:flutter/material.dart';
import 'package:open_movie_app_mvvm/models/movie.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieListPageCell extends StatelessWidget {
  final Movie model;

  MovieListPageCell({@required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       
      },
      child: Stack(
         children: <Widget>[
           Center(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 children: <Widget>[
                 Text(model.title,
                 style: TextStyle(
                    color: Colors.black,
                     fontSize: 18,
                     fontWeight: FontWeight.w500),),
                  FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: model.poster,
                        width: 300,
                        height: 300,
                      ),
                ],
          ),
             ),
           ),
        ], 
      )
    );
  }

}