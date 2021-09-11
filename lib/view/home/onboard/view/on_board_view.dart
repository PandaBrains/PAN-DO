import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pan_do/core/init/theme/light/color_scheme_light.dart';
import 'package:pan_do/view/home/onboard/viewmodel/on_board_view_model.dart';

class OnBoardView extends StatelessWidget {
  final _viewModel = OnBoardViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => _viewModel.onBoardItems[_viewModel.currentIndex],
      ),
      bottomNavigationBar: Observer(
        builder: (_) => buildBottomBar(),
      ),
    );
  }

  BottomNavigationBar buildBottomBar() => BottomNavigationBar(
        backgroundColor: ColorSchemeLight.instance!.white,
        currentIndex: _viewModel.currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: ColorSchemeLight.instance!.darkPurple,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: 'Ana Sayfa'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box,
                color: ColorSchemeLight.instance!.orange,
                size: 48,
              ),
              label: 'Yeni Görev'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              label: 'Profile'),
        ],
        onTap: (value) => _viewModel.changeCurrentIndex(value),
      );
}
