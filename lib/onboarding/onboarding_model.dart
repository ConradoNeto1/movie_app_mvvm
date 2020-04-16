import 'package:flutter/material.dart';

class OnboardingPageChildModel {
  String mainTitle;
  String secondaryTitle;
  String imageName;
  String buttonTitle;
  Color buttonColor;
  Color buttonBackgroundColor;
  bool shouldPresentButton;
  Function onButtonPressed;

  OnboardingPageChildModel(
      {this.mainTitle,
      this.secondaryTitle,
      this.imageName,
      this.buttonTitle = "",
      this.buttonColor = Colors.white,
      this.buttonBackgroundColor = Colors.black,
      this.shouldPresentButton = false,
      this.onButtonPressed});
}