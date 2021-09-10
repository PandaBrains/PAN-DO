import 'package:pan_do/core/base/model/base_model.dart';

class RegisterModel with BaseModel {
  String? name;
  String? email;
  String? pass;
  String? cPass;

  RegisterModel(
      {required this.name,
      required this.email,
      required this.pass,
      required this.cPass});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    pass = json['pass'];
    cPass = json['c_pass'];
  }

  Map<String, String> toJson() {
    final Map<String, String> data = new Map<String, String>();
    data['name'] = this.name.toString();
    data['email'] = this.email.toString();
    data['password'] = this.pass.toString();
    data['c_password'] = this.cPass.toString();
    return data;
  }
}
