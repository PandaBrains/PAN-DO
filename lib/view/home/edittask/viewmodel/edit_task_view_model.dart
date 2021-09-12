import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pan_do/core/base/model/base_view_model.dart';
import 'package:pan_do/core/constants/app/app_constants.dart';
import 'package:pan_do/core/constants/enums/locale_keys_enum.dart';
import 'package:pan_do/core/constants/navigation/navigation_constants.dart';
import 'package:pan_do/core/init/network/dio_exception.dart';
import 'package:pan_do/core/utils/app_utils.dart';
import 'package:pan_do/view/home/edittask/model/EditTask.dart';

part 'edit_task_view_model.g.dart';

class EditTaskViewModel = _EditTaskViewModelBase with _$EditTaskViewModel;

abstract class _EditTaskViewModelBase with Store, BaseViewModel {
  final url = ApplicationConstants.BASE_URL + 'api/todo';
  late final args;
  late String token;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future<void> init() async {
    token = localeManager.getStringValue(PreferencesKeys.TOKEN);
  }

  @action
  Future<void> updateTask(EditTaskModel model, BuildContext context) async {
    try {
      final response = await dio.put(
        url + '/${model.id}',
        data: model.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer ' + token,
          },
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        navigationService.navigateToPageClear(path: NavigationConstants.HOME);
      }
    } catch (e) {
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      AppUtils().showSnackBar(context, errorMessage);
    }
  }
}
