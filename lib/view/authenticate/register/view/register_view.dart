import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pan_do/core/components/button/custom_button.dart';
import 'package:pan_do/core/components/column/form_column.dart';
import 'package:pan_do/core/components/container/custom_title_container.dart';
import 'package:pan_do/core/components/input/custom_form.dart';
import 'package:pan_do/core/components/text/custom_text.dart';
import 'package:pan_do/core/components/text/login_register_text.dart';
import 'package:pan_do/core/constants/navigation/navigation_constants.dart';
import 'package:pan_do/view/authenticate/register/model/Register.dart';
import 'package:pan_do/view/authenticate/register/viewmodel/register_view_model.dart';

class RegisterView extends StatelessWidget {
  final _viewModel = RegisterViewModel();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _cPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildApp(context),
    );
  }

  Widget buildApp(BuildContext context) => Column(
        children: [
          buildCustomTitle(),
          buildFormColumn(context),
        ],
      );

  CustomTitleContainer buildCustomTitle() {
    return CustomTitleContainer(
      widget: CustomText(
        data: 'Kayıt Ol',
      ),
    );
  }

  Expanded buildFormColumn(BuildContext context) {
    return Expanded(
      child: FormColumn(
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
              buttonName: "Kayıt Ol",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _viewModel.userRegister(
                    RegisterModel(
                        name: _nameController.text,
                        email: _emailController.text,
                        pass: _passController.text,
                        cPass: _cPassController.text),
                    context,
                  );
                }
              }),
          LoginRegisterText(
            firstText: 'Hesabınız var mı? ',
            secondText: 'Giriş Yap',
            gestureRecognizer: TapGestureRecognizer()
              ..onTap = () => _viewModel.navigateTo(NavigationConstants.LOGIN),
          ),
        ],
      ),
    );
  }
}
