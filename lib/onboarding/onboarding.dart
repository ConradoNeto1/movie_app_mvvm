import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_movie_app_mvvm/views/movie_list.dart';

import 'onboarding_model.dart';
import 'onboarding_page.dart';
import 'onboarding_view_model.dart';

class OnboardingPage extends StatelessWidget {
  final PageController controller = PageController();
  List<Widget> dataSource = [];
  
  OnboardingViewModel viewModel = OnboardingViewModel();

   OnboardingPage() {

   var onboardingPageChildModel =  OnboardingPageChildModel(
              mainTitle: "Open Movie App",
              secondaryTitle: "The best App for movie information",
              imageName: "resources/images/LordOfTheRings.jpg",
              shouldPresentButton: true,
              buttonTitle: "Get Start Now!!!",
              onButtonPressed: (context) {
                _presentMovieListPage(context: context);
              });
      
    viewModel.setModel(onboardingPageChildModel);
       
    dataSource = [
       OnboardingPageChild(viewModel: viewModel)
    ];
  }

  _presentMovieListPage({BuildContext context}) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: PageView(
      children: dataSource,
    )));
  }
}
