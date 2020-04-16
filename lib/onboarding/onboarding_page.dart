import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';

import 'onboarding_model.dart';
import 'onboarding_view_model.dart';
class OnboardingPageChild extends StatelessWidget {
  //final OnboardingPageChildModel model;

   //OnboardingPageChild({this.model});
   OnboardingViewModel viewModel;
   OnboardingPageChild({this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(viewModel.imageName), fit: BoxFit.cover)),
            child: null,
        ),
        Container(
          color: Colors.black.withOpacity(0.7),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                  padding: EdgeInsets.only(top: 150),
                  child: Column(children: <Widget>[])),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Center(
              child: Container(
                  padding: EdgeInsets.only(bottom: 70),
                  child: Column(
                    children: <Widget>[
                      Text(
                        viewModel.mainTitle,
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 80),
                        child: Text(
                          viewModel.secondaryTitle,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      viewModel.shouldPresentButton
                          ? RaisedButton(
                              child: Text(
                                viewModel.buttonTitle,
                                style: TextStyle(fontSize: 15, color: Colors.white)
                                ),
                              color: Colors.grey,
                              onPressed: () {
                                viewModel.onButtonPressed(context);
                              })
                          : Container(),
                    ],
                  )),
            )
          ],
        )
      ],
    ));
  }
}
