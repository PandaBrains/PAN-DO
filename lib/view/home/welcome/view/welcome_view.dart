import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pan_do/core/components/container/custom_title_container.dart';
import 'package:pan_do/core/components/list/list_tile.dart';
import 'package:pan_do/core/components/loading/custom_loading.dart';
import 'package:pan_do/core/components/searchbar/search_bar.dart';
import 'package:pan_do/core/components/text/custom_text.dart';
import 'package:pan_do/core/init/theme/light/color_scheme_light.dart';
import 'package:pan_do/core/init/theme/light/margin_insets.dart';
import 'package:pan_do/core/init/theme/light/padding_insets.dart';
import 'package:pan_do/view/home/welcome/viewmodel/welcome_view_model.dart';

class WelcomeView extends StatelessWidget {
  final _viewModel = WelcomeViewModel();

  @override
  Widget build(BuildContext context) {
    _viewModel.init();
    return buildApp();
  }

  Scaffold buildApp() {
    return Scaffold(
      backgroundColor: ColorSchemeLight.instance!.alternativeDarkGrey,
      body: Observer(builder: (_) {
        return _viewModel.isLoading
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [buildTitleContainer(), buildContent()],
                ),
              )
            : loadingContent();
      }),
    );
  }

  Center loadingContent() {
    return Center(
      child: CustomLoading(),
    );
  }

  Widget buildContent() {
    return _viewModel.toDoModel.length != 0 || _viewModel.model.response != null
        ? buildListViewToDoItem()
        : notFoundListToDoItem();
  }

  Widget notFoundListToDoItem() {
    return Container(
      margin: MarginInsets.instance!.notFoundMargin,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: MarginInsets.instance!.formMarginLow,
              decoration: BoxDecoration(
                color: ColorSchemeLight.instance!.darkPurple,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(style: BorderStyle.none),
              ),
              child: Image.asset(
                'assets/images/logo.png',
                width: 128,
                height: 128,
                alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
            ),
            CustomText(
              data: 'Görev Bulunamadı',
              color: ColorSchemeLight.instance!.black,
            ),
          ],
        ),
      ),
    );
  }

  Column buildListViewToDoItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: MarginInsets.instance!.listTileTitleMargin,
          child: CustomText(
            data: 'Görevler',
            color: ColorSchemeLight.instance!.black,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          primary: false,
          itemCount: _viewModel.toDoModel.length,
          itemBuilder: (context, index) => Dismissible(
            key: Key(_viewModel.toDoModel[index].title!),
            child: InkWell(
              onTap: () => print("tapped"),
              child: CustomListTile(
                title: _viewModel.toDoModel[index].title!,
                subtitle: _viewModel.toDoModel[index].detail!,
              ),
            ),
            background: slideRightBackground(),
            secondaryBackground: slideLeftBackground(),
            confirmDismiss: (direction) =>
                _viewModel.dismissItem(direction, context, index),
          ),
        ),
      ],
    );
  }

  CustomTitleContainer buildTitleContainer() {
    return CustomTitleContainer(
      height: 216,
      bottomLeftRadius: 30,
      bottomRightRadius: 30,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            data: 'Hey ${_viewModel.model.username!},',
            fontSize: 16,
            color: ColorSchemeLight.instance!.grey,
          ),
          SizedBox(
            height: 8,
          ),
          CustomText(
            data: 'Hoşgeldin',
            fontSize: 24,
          ),
          CustomSearchBar(
            onChanged: (value) {
              _viewModel.searhToDo(value);
            },
          ),
        ],
      ),
    );
  }

  Widget slideRightBackground() {
    return Container(
      padding: PaddingInsets.instance!.formPadding,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: ColorSchemeLight.instance!.darkPurple,
            ),
            CustomText(
              data: 'Görevi Düzenle',
              fontWeight: FontWeight.w700,
              color: ColorSchemeLight.instance!.darkPurple,
              fontSize: 16,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      padding: PaddingInsets.instance!.formPadding,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.red,
            ),
            CustomText(
              data: 'Görevi Sil',
              fontWeight: FontWeight.w700,
              color: ColorSchemeLight.instance!.red,
              fontSize: 16,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }
}
