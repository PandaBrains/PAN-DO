import 'package:flutter/material.dart';
import 'package:pan_do/core/components/button/custom_button.dart';
import 'package:pan_do/core/components/input/custom_form.dart';
import 'package:pan_do/core/components/text/custom_text.dart';
import 'package:pan_do/core/constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    print(args.name);
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(Scaffold(
            appBar: AppBar(
              title: Text('SEA'),
            ),
            body: Container(
              child: Column(
                children: [
                  CustomForm(
                    title: 'Email',
                    hintText: 'Please Enter Email Adress',
                    type: TextInputType.text,
                    validator: (value) => value,
                    onSaved: (value) => value,
                  ),

                ],
              )
            )));

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text('SEA'),
              ),
              body: Container()),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
