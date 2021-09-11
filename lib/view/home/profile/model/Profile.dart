import 'package:pan_do/core/base/model/base_model.dart';
import 'package:pan_do/view/home/profile/model/User.dart';

class ProfileModel with BaseModel {
  String? status;
  UserModel? response;

  ProfileModel({this.status, this.response});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response =
        json['response'] != null ? UserModel.fromJson(json['response']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}
