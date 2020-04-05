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
  TextEditingController _titleController = TextEditingController();


  Future loadData() async {
    await viewModel.setMovie(_titleController.text);
  }

  @override
  void initState() {
    super.initState();
    viewModel = MovieListViewModel(api: MovieServiceImpl());
    loadData();
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
                 padding: const EdgeInsets.only(top: 120, bottom: 8),
                child: MoviesPanel()
              ),
              Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 8),
                  child: TextField(controller: _titleController,
                  decoration: InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    )
                  )
                )
              ),
            ),
            Container(
            padding: const EdgeInsets.only(top: 64, bottom: 8, right: 8, left: 150),
            child: RaisedButton(
            onPressed: () {
               loadData();
            },
            color: Colors.black,
            textColor: Colors.white,
            child: const Text(
                'Search',
                 style: TextStyle(fontSize: 20)
              ),
            ),
          ),
          ],
        ),),
    );
  }

}