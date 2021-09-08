import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pan_do/view/authenticate/login/viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  final _viewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _viewModel.increment();
        },
      ),
      body: Center(
        child: Observer(builder: (_) {
          return Text(_viewModel.count.toString());
        }),
      ),
    );
  }
}
