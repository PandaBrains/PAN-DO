import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pan_do/core/base/model/base_view_model.dart';
import 'package:pan_do/core/constants/app/app_constants.dart';
import 'package:pan_do/core/constants/enums/locale_keys_enum.dart';
import 'package:pan_do/core/constants/navigation/navigation_constants.dart';
import 'package:pan_do/core/init/network/dio_exception.dart';
import 'package:pan_do/core/utils/app_utils.dart';
import 'package:pan_do/view/authenticate/register/model/Register.dart';
import 'package:pan_do/view/home/profile/model/Profile.dart';
import 'package:pan_do/view/home/profile/model/User.dart';
part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store, BaseViewModel {
  final url = ApplicationConstants.BASE_URL + 'api/user';
  late String token;
  late UserModel userModel;
  late ProfileModel profileModel;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future<void> init() async {
    isEditing = false;
    isLoading = false;
    token = localeManager.getStringValue(PreferencesKeys.TOKEN);
    getUserInformation();
  }

  @observable
  bool isEditing = false;

  @observable
  bool isLoading = false;

  @action
  void changeEditing() {
    isEditing = !isEditing;
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

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
  Future<void> updateProfile(RegisterModel model, BuildContext context) async {
    try {
      // final response = await dio.post(url, data: model.toJson());
      // if (response.statusCode == HttpStatus.ok) {
      changeEditing();
      AppUtils().showSnackBar(context, "Kullanıcı Bilgileri Güncellendi.");
      // }
    } catch (e) {
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      AppUtils().showSnackBar(context, errorMessage);
    }
  }

  @action
  Future<void> logOut() async {
    await localeManager.clearAll().then(
          (value) => navigationService.navigateToPageClear(
              path: NavigationConstants.LOGIN),
        );
  }

  @action
  Future<void> getUserInformation() async {
    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer ' + token,
          },
        ),
      );
      if (response.data != null) {
        profileModel = ProfileModel.fromJson(response.data);
        userModel = profileModel.response!;
        changeLoading();
      }
    } catch (e) {
      final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
      print(errorMessage);
    }
  }
}
