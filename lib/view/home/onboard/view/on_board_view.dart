import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
        currentIndex: _viewModel.currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: 'Ana Sayfa'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
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
