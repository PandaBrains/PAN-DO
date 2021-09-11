import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pan_do/core/base/model/base_view_model.dart';
import 'package:pan_do/core/constants/app/app_constants.dart';
import 'package:pan_do/core/constants/enums/locale_keys_enum.dart';
import 'package:pan_do/core/utils/app_utils.dart';
import 'package:pan_do/view/home/newtask/model/Task.dart';
part 'new_task_view_model.g.dart';

class NewTaskViewModel = _NewTaskViewModelBase with _$NewTaskViewModel;

abstract class _NewTaskViewModelBase with Store, BaseViewModel {
  final url = ApplicationConstants.BASE_URL + 'api/todo';
  late String token;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future<void> init() async {
    token = localeManager.getStringValue(PreferencesKeys.TOKEN);
  }

  @action
  Future<void> createTask(TaskModel taskModel, BuildContext context) async {
    try {
      final response = await dio.post(
        url,
        data: taskModel.toJson(),
        options: Options(headers: {
          'Authorization': 'Bearer ' + token,
        }),
      );
      if (response.statusCode == HttpStatus.ok) {
        AppUtils().showSnackBar(context, "Başarıyla oluşturuldu.");
      }
    } catch (e) {
      print(e);
    }
  }
}
