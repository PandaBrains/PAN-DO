import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pan_do/core/base/model/base_view_model.dart';
import 'package:pan_do/core/components/text/custom_text.dart';
import 'package:pan_do/core/constants/app/app_constants.dart';
import 'package:pan_do/core/constants/enums/locale_keys_enum.dart';
import 'package:pan_do/core/constants/navigation/navigation_constants.dart';
import 'package:pan_do/core/init/network/dio_exception.dart';
import 'package:pan_do/core/init/theme/light/color_scheme_light.dart';
import 'package:pan_do/core/utils/app_utils.dart';
import 'package:pan_do/view/home/edittask/model/EditTask.dart';
import 'package:pan_do/view/home/welcome/model/ToDo.dart';
import 'package:pan_do/view/home/welcome/model/Welcome.dart';

part 'welcome_view_model.g.dart';

class WelcomeViewModel = _WelcomeViewModelBase with _$WelcomeViewModel;

abstract class _WelcomeViewModelBase with Store, BaseViewModel {
  final url = ApplicationConstants.BASE_URL + 'api/todo';
  late WelcomeModel model;
  late String token;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future<void> init() async {
    isLoading = false;
    token = localeManager.getStringValue(PreferencesKeys.TOKEN);
    getAllTodos(context);
  }

  @observable
  bool isLoading = false;

  @observable
  List<ToDoModel> toDoModel = [];

  @action
  void changeLoding() {
    isLoading = !isLoading;
  }

  @action
  Future<void> getAllTodos(context) async {
    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer ' + token,
          },
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        model = WelcomeModel.fromJson(response.data);
        toDoModel = model.response!.reversed.toList();
        changeLoding();
      }
    } catch (e) {
      print(e);
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      print(errorMessage);
    }
  }

  @action
  Future<void> searhToDo(String searchText) async {
    if (model.response != null && searchText.isNotEmpty) {
      toDoModel = [];
      model.response!.forEach((element) {
        if (element.title!.contains(searchText)) {
          toDoModel.add(element);
        }
      });
    } else if (searchText.isEmpty) {
      toDoModel = model.response!;
    }
  }

  @action
  Future<bool> dismissItem(
      DismissDirection direction, BuildContext context, int index) async {
    bool res = false;
    if (direction == DismissDirection.endToStart) {
      await showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: CustomText(
            data:
                "${toDoModel[index].title} Görevini Silmek İstediğinize Emin Misiniz?",
            color: ColorSchemeLight.instance!.black,
            fontSize: 16,
          ),
          actions: [
            TextButton(
              child: Text(
                "İptal",
                style: TextStyle(color: ColorSchemeLight.instance!.black),
              ),
              onPressed: () {
                res = false;
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                "Sil",
                style: TextStyle(color: ColorSchemeLight.instance!.red),
              ),
              onPressed: () async {
                await removeTask(
                  toDoModel[index],
                  context,
                );
                Navigator.of(context).pop();
                res = true;
              },
            ),
          ],
        ),
      );
    } else {
      // Navigate Another Page
      navigationService.navigateToPage(
        path: NavigationConstants.UPDATE,
        data: EditTaskModel(
          id: toDoModel[index].id,
          title: toDoModel[index].title,
          detail: toDoModel[index].detail,
        ),
      );
    }
    return res;
  }

  Future<void> removeTask(ToDoModel model, BuildContext context) async {
    try {
      final response = await dio.delete(
        url + '/${model.id}',
        options: Options(
          headers: {
            'Authorization': 'Bearer ' + token,
          },
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        AppUtils().showSnackBar(context, "Başarıyla Silindi.");
      }
    } catch (e) {
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      AppUtils().showSnackBar(context, errorMessage);
      navigationService.navigateToPageClear(path: NavigationConstants.HOME);
    }
  }
}
