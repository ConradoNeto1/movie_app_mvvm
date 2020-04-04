import 'package:flutter/material.dart';
import 'package:open_movie_app_mvvm/services/movie_service.dart';
import 'package:open_movie_app_mvvm/vew_models/movie_list_view_model.dart';
import 'package:open_movie_app_mvvm/views/panels/movie_panel.dart';
import 'package:scoped_model/scoped_model.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  MovieListViewModel viewModel;


  Future loadData(String title) async {
    await viewModel.setMovie(title);
  }

  @override
  void initState() {
    super.initState();
    viewModel = MovieListViewModel(api: MovieServiceImpl());
    loadData("batman");
  }

  

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
       appBar: AppBar(
        title: const Text('Movie App'),
        backgroundColor: Colors.black,
      ),
      body: ScopedModel<MovieListViewModel>(
        model: viewModel, 
        child: Stack(
          children: <Widget>[
            Container(
              child: MoviesPanel()
            )
          ],
        ),),
    );
  }

}