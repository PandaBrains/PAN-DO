import 'package:pan_do/core/base/model/base_model.dart';

class LoginResponseModel with BaseModel {
  String? status;
  String? response;
  String? token;

  LoginResponseModel({this.status, this.response, this.token});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response = json['response'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['response'] = this.response;
    data['token'] = this.token;
    return data;
  }
}
