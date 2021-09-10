import 'package:pan_do/core/base/model/base_model.dart';

class LoginModel with BaseModel {
  String? email;
  String? password;

  LoginModel({required this.email, required this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, String> toJson() {
    final Map<String, String> data = new Map<String, String>();
    data['email'] = this.email.toString();
    data['password'] = this.password.toString();
    return data;
  }
}
