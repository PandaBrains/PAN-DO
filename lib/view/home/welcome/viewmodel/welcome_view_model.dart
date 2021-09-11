import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pan_do/core/base/model/base_view_model.dart';
import 'package:pan_do/core/constants/app/app_constants.dart';
import 'package:pan_do/core/constants/enums/locale_keys_enum.dart';
import 'package:pan_do/core/init/network/dio_exception.dart';
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
        changeLoding();
        model = WelcomeModel.fromJson(response.data);
        toDoModel = model.response as List<ToDoModel>;
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
}
