import 'package:flutter/material.dart';
import 'package:pan_do/core/components/card/not_found_navigation_widget.dart';
import 'package:pan_do/core/constants/navigation/navigation_constants.dart';
import 'package:pan_do/view/authenticate/login/view/login_view.dart';
import 'package:pan_do/view/authenticate/register/view/register_view.dart';
import 'package:pan_do/view/authenticate/splash/view/splash_view.dart';
import 'package:pan_do/view/home/edittask/view/edit_task_view.dart';
import 'package:pan_do/view/home/onboard/view/on_board_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(SplashView());
      case NavigationConstants.LOGIN:
        return normalNavigate(LoginView());
      case NavigationConstants.REGISTER:
        return normalNavigate(RegisterView());
      case NavigationConstants.HOME:
        return normalNavigate(OnBoardView());
      case NavigationConstants.UPDATE:
        return MaterialPageRoute(
          builder: (context) => EditTaskView(),
          settings: args
        );
      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
