import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:pan_do/core/base/model/base_view_model.dart';
import 'package:pan_do/core/constants/app/app_constants.dart';
import 'package:pan_do/core/constants/navigation/navigation_constants.dart';
import 'package:pan_do/core/init/network/dio_exception.dart';
import 'package:pan_do/core/utils/app_utils.dart';
import 'package:pan_do/view/authenticate/register/model/Register.dart';

part 'register_view_model.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store, BaseViewModel {
  final url = ApplicationConstants.BASE_URL + 'api/register';

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}

  @action
  void navigateTo(path) => navigationService.navigateToPage(path: path);

  @action
  String? checkEmail(email) => AppUtils().checkEmail(email);

  @action
  String? checkPass(pass) => AppUtils().checkPassword(pass);

  @action
  String? checkFirstSecondPass(firstPass, secondPass) =>
      firstPass == secondPass ? null : 'Şifreler uyuşmuyor.';

  @action
  String? checkName(name) => AppUtils().checkName(name);

  @action
  Future<void> userRegister(RegisterModel model, BuildContext context) async {
    try {
      final response = await dio.post(url, data: model.toJson());
      if (response.statusCode == HttpStatus.ok) {
        navigationService.navigateToPageClear(path: NavigationConstants.LOGIN);
        AppUtils().showSnackBar(context, "Kullanıcı Başarıyla Oluşturuldu.");
      }
    } catch (e) {
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      AppUtils().showSnackBar(context, errorMessage);
    }
  }
}
