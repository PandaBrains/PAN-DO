import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pan_do/core/constants/navigation/navigation_constants.dart';

class NavigationRoute{
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  // Route<dynamic> generateRoute(RouteSettings args) {
    // switch (args.name) {
    //   case NavigationConstants.DEFAULT:
    //     return normalNavigate(SplashView());

      // default:
      //   return MaterialPageRoute(
      //     builder: (context) => NotFoundNavigationWidget(),
      //   );
  //   }
  // }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }

}