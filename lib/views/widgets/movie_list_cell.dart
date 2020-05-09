import 'package:flutter/material.dart';
import 'package:open_movie_app_mvvm/models/movie.dart';
import 'package:open_movie_app_mvvm/views/movie_details.dart';
import 'package:transparent_image/transparent_image.dart';



class MovieListPageCell extends StatelessWidget {
  final Movie model;

  MovieListPageCell({this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  MovieDetails(model)));
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