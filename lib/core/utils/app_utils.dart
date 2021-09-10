import 'package:flutter/material.dart';
import 'package:pan_do/core/components/text/custom_text.dart';
import 'package:pan_do/core/init/theme/light/color_scheme_light.dart';

class AppUtils {
  void showSnackBar(BuildContext context, content) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: CustomText(
          data: content,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        backgroundColor: ColorSchemeLight.instance!.black,
      ));

  String? checkEmail(mail) {
    RegExp regex = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regex.hasMatch(mail) != true
        ? 'Lütfen geçerli bir e-posta hesabı giriniz.'
        : null;
  }

  String? checkPassword(pass) =>
      pass.length <= 6 ? 'Şifreniz en az 6 karakter içermelidir.' : null;

  String? checkName(name) =>
      name.length <= 6 ? 'İsim Soyisim en az 6 karakter içermelidir.' : null;
}
