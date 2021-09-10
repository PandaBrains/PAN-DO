import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pan_do/core/base/model/base_view_model.dart';
import 'package:pan_do/core/constants/app/app_constants.dart';
import 'package:pan_do/core/constants/enums/locale_keys_enum.dart';
import 'package:pan_do/core/constants/navigation/navigation_constants.dart';
import 'package:pan_do/core/init/network/dio_exception.dart';
import 'package:pan_do/core/utils/app_utils.dart';
import 'package:pan_do/view/authenticate/login/model/login.dart';
import 'package:pan_do/view/authenticate/login/model/login_response.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  final url = ApplicationConstants.BASE_URL + 'login';

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}

  @action
  Future<void> userLogin(LoginModel loginModel, BuildContext context) async {
    if (loginModel.email!.isEmpty && loginModel.password!.isEmpty) {
      AppUtils().showSnackBar(context, "E-Posta ya da Şifre boş bırakılamaz.");
      return;
    } else {
      try {
        final response = await dio.post(url, data: loginModel.toJson());
        final model = LoginResponseModel.fromJson(response.data);
        if (model.token != null) {
          await localeManager.setStringValue(
              PreferencesKeys.TOKEN, model.token!);
          navigationService.navigateToPageClear(path: NavigationConstants.HOME);
        }
      } catch (e) {
        final errorMessage =
            DioExceptions.fromDioError(e as DioError).toString();
        AppUtils().showSnackBar(context, errorMessage);
      }
    }
  }

  @action
  void navigateTo(path) => navigationService.navigateToPage(path: path);

  @action
  String? checkEmail(email) => AppUtils().checkEmail(email);

  @action
  String? checkPass(pass) => AppUtils().checkPassword(pass);
}
