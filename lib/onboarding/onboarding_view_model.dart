import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';

import 'onboarding_model.dart';
import 'onboarding_page.dart';


enum ViewModelState {
  initial, updateCounter, processing, done
}

class OnboardingViewModel {
  String mainTitle;
  String secondaryTitle;
  String imageName;
  String buttonTitle;
  Color buttonColor;
  Color buttonBackgroundColor;
  bool shouldPresentButton;
  Function onButtonPressed;

  Function didUpdateState;
  ViewModelState _state = ViewModelState.initial;

  OnboardingPageChildModel setModel(OnboardingPageChildModel onboardingPageChildModel) {
    this.mainTitle = onboardingPageChildModel.mainTitle;
    this.secondaryTitle = onboardingPageChildModel.secondaryTitle;
    this.imageName = onboardingPageChildModel.imageName;
    this.buttonTitle = onboardingPageChildModel.buttonTitle ;
    this.buttonColor = onboardingPageChildModel.buttonColor;
    this.shouldPresentButton = onboardingPageChildModel.shouldPresentButton;
    this.onButtonPressed = onboardingPageChildModel.onButtonPressed;


    // didUpdateState(ViewModelState.updateCounter);

    return onboardingPageChildModel;
  }

}



