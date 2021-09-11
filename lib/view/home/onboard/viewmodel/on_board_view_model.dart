import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pan_do/core/base/model/base_view_model.dart';
import 'package:pan_do/view/home/welcome/view/welcome_view.dart';
part 'on_board_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future<void> init() async {}

  List onBoardItems = [
    WelcomeView(),
    WelcomeView(),
    WelcomeView(),
  ];

  @observable
  bool isLoading = false;

  @observable
  int currentIndex = 0;

  @action
  void changeCurrentIndex(int value) {
    currentIndex = value;
  }
}
