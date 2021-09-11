import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pan_do/core/components/button/custom_button.dart';
import 'package:pan_do/core/components/column/form_column.dart';
import 'package:pan_do/core/components/container/custom_title_container.dart';
import 'package:pan_do/core/components/input/custom_form.dart';
import 'package:pan_do/core/components/loading/custom_loading.dart';
import 'package:pan_do/core/components/text/custom_text.dart';
import 'package:pan_do/core/init/theme/light/color_scheme_light.dart';
import 'package:pan_do/view/authenticate/register/model/Register.dart';
import 'package:pan_do/view/home/profile/viewmodel/profile_view_model.dart';

class ProfileView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _viewModel = ProfileViewModel();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _cPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _viewModel.init();
    return buildApp(context);
  }

  Widget buildApp(BuildContext context) => Observer(
        builder: (_) => _viewModel.isLoading
            ? Column(
                children: [
                  buildAppTitle(),
                  Expanded(
                    child: Observer(
                      builder: (_) => _viewModel.isEditing
                          ? buildAppSettingsEditing(context)
                          : buildAppSettings(),
                    ),
                  ),
                ],
              )
            : Center(child: CustomLoading()),
      );

  FormColumn buildAppSettings() {
    return FormColumn(
      children: [
        CustomTextForm(
          title: 'İsim Soyisim',
          hintText: _viewModel.userModel.name!,
          validator: (value) {},
          isEnabled: false,
        ),
        CustomTextForm(
          title: 'E-Posta Hesabı',
          hintText: _viewModel.userModel.email!,
          validator: (value) {},
          isEnabled: false,
        ),
        CustomButton(
          buttonName: 'Bilgilerimi Güncelle',
          onPressed: () => _viewModel.changeEditing(),
          backgroudColor: ColorSchemeLight.instance!.darkPurple,
        ),
        CustomButton(
          buttonName: 'Çıkış Yap',
          onPressed: () {
            _viewModel.logOut();
          },
        ),
      ],
    );
  }

  FormColumn buildAppSettingsEditing(BuildContext context) {
    return FormColumn(
      formKey: _formKey,
      children: [
        CustomTextForm(
          controller: _nameController,
          title: "İsim Soyisim",
          hintText: "İsim Soyisim",
          validator: (value) => _viewModel.checkName(value),
        ),
        CustomTextForm(
          controller: _emailController,
          title: "E-Posta Hesabı",
          hintText: "E-Posta",
          validator: (value) => _viewModel.checkEmail(value),
        ),
        CustomTextForm(
          controller: _passController,
          title: "Şifre",
          hintText: "********",
          isPassword: true,
          validator: (value) => _viewModel.checkPass(value),
        ),
        CustomTextForm(
          controller: _cPassController,
          title: "Şifre Tekrar",
          hintText: "********",
          isPassword: true,
          validator: (value) =>
              _viewModel.checkFirstSecondPass(_passController.text, value),
        ),
        CustomButton(
          buttonName: 'Geri',
          backgroudColor: ColorSchemeLight.instance!.darkPurple,
          onPressed: () => _viewModel.changeEditing(),
        ),
        CustomButton(
          buttonName: 'Bilgilerimi Güncelle',
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _viewModel.updateProfile(
                RegisterModel(
                    name: _nameController.text,
                    email: _emailController.text,
                    pass: _passController.text,
                    cPass: _cPassController.text),
                context,
              );
            }
          },
        ),
      ],
    );
  }

  CustomTitleContainer buildAppTitle() {
    return CustomTitleContainer(
      widget: CustomText(
        data: 'Profil',
      ),
      height: 160,
    );
  }
}
