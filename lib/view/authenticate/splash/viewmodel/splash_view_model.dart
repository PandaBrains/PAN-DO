import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pan_do/core/base/model/base_view_model.dart';
import 'package:pan_do/core/constants/enums/locale_keys_enum.dart';
import 'package:pan_do/core/constants/navigation/navigation_constants.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future<void> init() async {
    checkToken();
  }

  Future<void> checkToken() async {
    Timer(
      Duration(seconds: 3),
      () => localeManager.checkLocaleValue(PreferencesKeys.TOKEN)
          ? navigationService.navigateToPageClear(
              path: NavigationConstants.HOME)
          : navigationService.navigateToPageClear(
              path: NavigationConstants.LOGIN),
    );
  }
}
