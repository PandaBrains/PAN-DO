import 'package:flutter/material.dart';
import 'package:pan_do/core/components/button/custom_button.dart';
import 'package:pan_do/core/components/column/form_column.dart';
import 'package:pan_do/core/components/container/custom_title_container.dart';
import 'package:pan_do/core/components/input/custom_form.dart';
import 'package:pan_do/core/components/text/custom_text.dart';
import 'package:pan_do/view/authenticate/login/model/login.dart';
import 'package:pan_do/view/authenticate/login/viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  final _viewModel = LoginViewModel();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  String username = "Test";
  String password = "Test";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: builApp(context),
    );
  }

  Widget builApp(BuildContext context) => Column(
        children: [
          buildCustomTitle(),
          buildFormColumn(context),
        ],
      );

  CustomTitleContainer buildCustomTitle() {
    return CustomTitleContainer(
      widget: CustomText(
        data: 'Giriş Yap',
      ),
    );
  }

  Expanded buildFormColumn(BuildContext context) {
    return Expanded(
      child: FormColumn(
        formKey: _formKey,
        children: [
          CustomTextForm(
            controller: _emailController,
            title: "E-Posta Hesabı",
            hintText: "E-Posta",
            validator: (value) {},
          ),
          CustomTextForm(
            controller: _passController,
            title: "Şifre",
            hintText: "********",
            isPassword: true,
            validator: (value) {},
          ),
          CustomButton(
            buttonName: "Giriş Yap",
            onPressed: () => _viewModel.userLogin(
              new LoginModel(
                email: _emailController.text,
                password: _passController.text,
              ),
              context,
            ),
          ),
        ],
      ),
    );
  }
}
